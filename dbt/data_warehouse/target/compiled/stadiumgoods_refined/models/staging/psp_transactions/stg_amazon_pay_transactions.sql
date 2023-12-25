WITH mag_orders AS (

  SELECT DISTINCT
      amazon_order_reference_id
    , mag_order_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`amazon_pay__order_reference_data`

), settlements AS (

  SELECT
      transaction_id
    , mag_order_id
    , CAST('Amazon Pay' AS string) AS channel_or_gateway
    , CAST('Amazon Pay Settlement Data' AS string) AS data_source
    , CAST('Settled' AS string) AS transaction_state
    , CAST('Approved' AS string) AS checkout_status
    , sum( payment_amount ) AS payment_amount
    , min( payment_processed_at ) AS payment_processed_at
    , sum( payment_fee ) AS payment_fee
    , sum( refund_amount ) AS refund_amount
    , min( refund_processed_at ) AS refund_processed_at
    , sum( refund_fee ) AS refund_fee
    , min(settlement_date) AS settlement_date
    , max(file_time) AS file_time
    , string_agg(DISTINCT settlement_id, ',') AS settlement_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`amazon_pay__settlement_data`
  WHERE transaction_id IS NOT NULL
  GROUP BY 1, 2

), all_captures AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`amazon_pay__capture_data`

), captures AS (

  SELECT
      transaction_id
    , CAST('Amazon Pay Capture Data' AS string) AS data_source
    , CAST('Not Settled' AS string) AS transaction_state
    , CAST('Approved' AS string) AS checkout_status
    , payment_processed_at
    , payment_amount
    , CAST(NULL AS float64) AS payment_fee
    , SAFE_CAST(NULL AS timestamp) AS refund_processed_at
    , CAST(NULL AS float64) AS refund_amount
    , CAST(NULL AS float64) AS refund_fee
    , SAFE_CAST(SAFE_CAST(NULL AS datetime) AS date) AS settlement_date
    , file_time
    , last_update_timestamp
    , amazon_order_reference_id
    , row_number() OVER (PARTITION BY transaction_id ORDER BY last_update_timestamp DESC) AS transaction_row
  FROM all_captures
  WHERE NOT EXISTS (SELECT * FROM settlements WHERE transaction_id = all_captures.transaction_id)

), refunds AS (

  SELECT
      transaction_id
    , CAST('Amazon Pay Refund Data' AS string) AS data_source
    , CAST('Not Settled' AS string) AS transaction_state
    , CAST('Approved' AS string) AS checkout_status
    , SAFE_CAST(NULL AS timestamp) AS payment_processed_at
    , CAST(NULL AS float64) AS payment_amount
    , CAST(NULL AS float64) AS payment_fee
    , refund_processed_at
    , refund_amount
    , CAST(NULL AS float64) AS refund_fee
    , SAFE_CAST(SAFE_CAST(NULL AS datetime) AS date) AS settlement_date
    , file_time
    , last_update_timestamp
    , amazon_order_reference_id
    , row_number() OVER (PARTITION BY transaction_id ORDER BY last_update_timestamp DESC) AS transaction_row
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`amazon_pay__refund_data` AS refund_data
  WHERE NOT EXISTS (SELECT * FROM settlements WHERE transaction_id = refund_data.transaction_id)

), authorizations AS (

  SELECT
      transaction_id
    , CAST('Amazon Pay Authorization Data' AS string) AS data_source
    , CAST('Not Settled' AS string) AS transaction_state
    , CAST((CASE WHEN authorization_status = 'Declined' THEN 'Not Approved' ELSE 'Approved' END) AS string) AS checkout_status
    , SAFE_CAST(creation_timestamp AS timestamp) AS payment_processed_at
    , CAST(authorization_amount AS float64) AS payment_amount
    , CAST(NULL AS float64) AS payment_fee
    , (CASE WHEN authorization_status = 'Closed' THEN last_update_timestamp END) AS refund_processed_at
    , CAST((CASE WHEN authorization_status = 'Closed' THEN authorization_amount END) AS float64) AS refund_amount
    , CAST(NULL AS float64) AS refund_fee
    , SAFE_CAST(SAFE_CAST(NULL AS datetime) AS date) AS settlement_date
    , file_time
    , last_update_timestamp
    , amazon_order_reference_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`amazon_pay__authorization_data` AS authorization_data
  WHERE NOT EXISTS (SELECT * FROM settlements WHERE transaction_id = authorization_data.transaction_id)
    AND NOT EXISTS (SELECT * FROM all_captures WHERE amazon_authorization_id = authorization_data.transaction_id)

), declined_authorizations AS (

  SELECT *
    , row_number() OVER (PARTITION BY transaction_id ORDER BY last_update_timestamp DESC) AS transaction_row
  FROM authorizations
  WHERE checkout_status = 'Not Approved'

), not_declined_authorizations AS (

  SELECT *
    , row_number() OVER (PARTITION BY transaction_id ORDER BY last_update_timestamp DESC) AS transaction_row
  FROM authorizations
  WHERE NOT EXISTS (SELECT * FROM declined_authorizations WHERE transaction_id = authorizations.transaction_id)

), not_settled_union AS (

  SELECT *
  FROM refunds
  UNION ALL
  SELECT *
  FROM captures
  UNION ALL
  SELECT *
  FROM declined_authorizations
  UNION ALL
  SELECT *
  FROM not_declined_authorizations

), not_settled AS (

  SELECT
      not_settled_union.transaction_id
    , mag_orders.mag_order_id
    , CAST('Amazon Pay' AS string) AS channel_or_gateway
    , not_settled_union.data_source
    , not_settled_union.transaction_state
    , not_settled_union.checkout_status
    , not_settled_union.payment_amount
    , not_settled_union.payment_processed_at
    , not_settled_union.payment_fee
    , not_settled_union.refund_amount
    , not_settled_union.refund_processed_at
    , not_settled_union.refund_fee
    , not_settled_union.settlement_date
    , not_settled_union.file_time
    , CAST(NULL AS string) AS settlement_id
  FROM not_settled_union
  INNER JOIN mag_orders
    ON not_settled_union.amazon_order_reference_id = mag_orders.amazon_order_reference_id
  WHERE transaction_row = 1

), final AS (

  SELECT *
  FROM settlements
  UNION ALL
  SELECT *
  FROM not_settled

)

SELECT *
  , CAST('SG Web' AS string) AS sales_channel
  , current_timestamp AS rebuild_timestamp
FROM final