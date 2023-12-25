

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_affirm_transactions`
  
  
  OPTIONS()
  as (
    

WITH settled AS (

  SELECT
      transaction_id
    , mag_order_id
    , settlement_id
    , CAST('Settled' AS string) AS transaction_state
    , CAST('Approved' AS string) AS checkout_status
    , payment_processed_at
    , payment_amount
    , payment_fee
    , refund_processed_at
    , refund_amount
    , refund_fee
    , settlement_date
    , file_time
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_affirm_settled_transactions`

), not_settled AS (

  SELECT
      transaction_id
    , mag_order_id
    , CAST(NULL AS string) AS settlement_id
    , CAST('Not Settled' AS string) AS transaction_state
    , checkout_status
    , payment_processed_at
    , payment_amount
    , CAST(NULL AS float64) AS payment_fee
    , cast(NULL AS timestamp) AS refund_processed_at
    , refund_amount
    , CAST(NULL AS float64) AS refund_fee
    , SAFE_CAST(SAFE_CAST(NULL AS datetime) AS date) AS settlement_date
    , file_time
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_affirm_confirmed_transactions` AS confirmed
  WHERE NOT EXISTS (SELECT * FROM settled WHERE transaction_id = confirmed.transaction_id)

), combined AS (

  SELECT *
  FROM settled
  UNION ALL
  SELECT *
  FROM not_settled

), final AS (

  SELECT
    transaction_id
    , mag_order_id
    , settlement_id
    , CAST('Affirm' AS string) AS channel_or_gateway
    , CASE
        WHEN transaction_state = 'Settled'
          THEN CAST('Affirm Settlement Reports' AS string)
        ELSE
          CAST('Affirm Confirmed Charges' AS string)
      END AS data_source
    , transaction_state
    , checkout_status
    , payment_processed_at
    , payment_amount
    , payment_fee
    , refund_processed_at
    , refund_amount
    , refund_fee
    , settlement_date
    , file_time
    , CAST('SG Web' AS string) AS sales_channel
    , current_timestamp AS rebuild_timestamp
  FROM combined

)

SELECT * FROM final
  );
    