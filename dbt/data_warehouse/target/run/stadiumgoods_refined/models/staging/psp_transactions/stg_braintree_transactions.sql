

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_braintree_transactions`
  
  
  OPTIONS()
  as (
    WITH dashboard AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_braintree_dashboard_transactions` AS dash

), paypal AS (

  SELECT
      transaction_id
    , mag_order_id
    , CAST('Braintree (Paypal)' AS string) AS channel_or_gateway
    , data_source
    , transaction_state
    , checkout_status
    , transaction_description
    , payment_processed_at
    , payment_fee
    , payment_amount
    , refund_processed_at
    , refund_fee
    , refund_amount
    , settlement_date
    , file_time
    , settlement_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_paypal_all_transactions`
  WHERE is_braintree = TRUE

), api AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_braintree_api_transactions`

), api_not_dashboard_not_paypal AS (

  SELECT *
  FROM api
  WHERE NOT EXISTS (SELECT * FROM dashboard WHERE transaction_id = api.transaction_id)
    AND NOT EXISTS (SELECT * FROM paypal WHERE transaction_id = api.paypal_transaction_id)

), paypal_matched AS (

  SELECT
      api.transaction_id
    , paypal.mag_order_id
    , paypal.channel_or_gateway
    , CASE WHEN paypal.data_source = 'Paypal Settlements' THEN paypal.data_source ELSE api.data_source END AS data_source
    , api.transaction_state
    , api.checkout_status
    , paypal.transaction_description
    , api.payment_amount
    , api.payment_processed_at
    , coalesce(paypal.payment_fee, api.payment_paypal_transaction_fee) AS payment_fee
    , api.refund_amount
    , api.refund_processed_at
    , coalesce(paypal.refund_fee, api.refund_paypal_transaction_fee) AS refund_fee
    , coalesce(paypal.settlement_date, api.settlement_date) AS settlement_date
    , CASE WHEN paypal.data_source = 'Paypal Settlements' THEN paypal.file_time ELSE api.file_time END AS file_time
    , paypal.settlement_id
  FROM paypal
  INNER JOIN api
    ON paypal.transaction_id = api.paypal_transaction_id

), paypal_not_matched AS (

  SELECT transaction_id
  , mag_order_id
  , channel_or_gateway
  , data_source
  , transaction_state
  , checkout_status
  , transaction_description
  , payment_amount
  , payment_processed_at
  , payment_fee
  , refund_amount
  , refund_processed_at
  , refund_fee
  , settlement_date
  , file_time
  , settlement_id
  FROM paypal
  WHERE NOT EXISTS (
    SELECT * FROM api WHERE paypal_transaction_id = paypal.transaction_id
  )

), paypal_union AS (

  SELECT *
  FROM paypal_not_matched
  UNION ALL
  SELECT *
  FROM paypal_matched

), braintree_union AS (

  SELECT transaction_id
  , mag_order_id
  , channel_or_gateway
  , data_source
  , transaction_state
  , checkout_status
  , transaction_description
  , payment_amount
  , payment_processed_at
  , payment_fee
  , refund_amount
  , refund_processed_at
  , refund_fee
  , settlement_date
  , file_time
  , settlement_id
  FROM dashboard
  UNION ALL
  SELECT transaction_id
  , mag_order_id
  , channel_or_gateway
  , data_source
  , transaction_state
  , checkout_status
  , transaction_description
  , payment_amount
  , payment_processed_at
  , payment_fee
  , refund_amount
  , refund_processed_at
  , refund_fee
  , settlement_date
  , file_time
  , settlement_id
  FROM api_not_dashboard_not_paypal

), paypal_agg AS (

  SELECT transaction_id
  , mag_order_id
  , channel_or_gateway
  , data_source
  , transaction_state
  , checkout_status
  , sum( payment_amount ) AS payment_amount
  , min( payment_processed_at ) AS payment_processed_at
  , sum( payment_fee ) AS payment_fee
  , sum( refund_amount ) AS refund_amount
  , min( refund_processed_at ) AS refund_processed_at
  , sum( refund_fee ) AS refund_fee
  , min(settlement_date) AS settlement_date
  , max(file_time) AS file_time
  , string_agg(settlement_id, ',') AS settlement_id
  FROM paypal_union
  GROUP BY 1, 2, 3, 4, 5, 6

), braintree_agg AS (

  SELECT transaction_id
  , mag_order_id
  , channel_or_gateway
  , data_source
  , transaction_state
  , checkout_status
  , sum( payment_amount ) AS payment_amount
  , min( payment_processed_at ) AS payment_processed_at
  , sum( payment_fee ) AS payment_fee
  , sum( refund_amount ) AS refund_amount
  , min( refund_processed_at ) AS refund_processed_at
  , sum( refund_fee ) AS refund_fee
  , min(settlement_date) AS settlement_date
  , max(file_time) AS file_time
  , string_agg(settlement_id, ',') AS settlement_id
  FROM braintree_union
  GROUP BY 1, 2, 3, 4, 5, 6

), agg_union AS (

  SELECT *
  FROM braintree_agg
  UNION ALL
  SELECT *
  FROM paypal_agg

), final AS (

  SELECT *
    , CASE
        WHEN channel_or_gateway = 'Beyond'
        THEN 'Beyond'
        ELSE 'SG App'
      END AS sales_channel
    , current_timestamp AS rebuild_timestamp
  FROM agg_union

)

SELECT * FROM final
  );
    