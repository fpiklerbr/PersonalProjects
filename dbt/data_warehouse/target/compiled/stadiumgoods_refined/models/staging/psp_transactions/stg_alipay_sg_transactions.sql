

WITH mag_order AS (

  SELECT mag_order_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order`

), alipay_settlements AS (

  SELECT
       mag_order_id
    , CAST('Alipay Settlements' AS string) AS data_source
    , CAST('Settled' AS string) AS  transaction_status
    , sum( payment_amount ) AS payment_amount
    , min( payment_processed_at ) AS payment_processed_at
    , sum( payment_fee ) AS payment_fee
    , sum( refund_amount ) AS refund_amount
    , min( refund_processed_at ) AS refund_processed_at
    , sum( refund_fee ) AS refund_fee
    , min( settlement_date ) AS settlement_date
    , max( file_time ) AS file_time
    , string_agg(DISTINCT settlement_id, ',') AS settlement_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`alipay__sg_settle`
  WHERE flow_order_number IS NULL
  AND mag_order_id IS NOT NULL
  GROUP BY 1

), alipay_transactions AS (

  SELECT
       mag_order_id
    , CAST('Alipay Trades' AS string) AS  data_source
    , CAST('Not Settled' AS string) AS  transaction_status
    , sum( payment_amount ) AS payment_amount
    , min( payment_processed_at ) AS payment_processed_at
    , sum( payment_fee ) AS payment_fee
    , sum( refund_amount ) AS refund_amount
    , min( refund_processed_at ) AS refund_processed_at
    , sum( refund_fee ) AS refund_fee
    , min( CAST(NULL AS date) ) AS settlement_date
    , max( file_time ) AS file_time
    , CAST(NULL AS string) AS settlement_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`alipay__sg_fptrade` AS fptrade
  WHERE flow_order_number IS NULL
  AND mag_order_id IS NOT NULL
  AND NOT EXISTS (SELECT * FROM alipay_settlements WHERE mag_order_id = fptrade.mag_order_id)
  GROUP BY 1

), transaction_union AS (

  SELECT *
  FROM alipay_settlements
  UNION ALL
  SELECT *
  FROM alipay_transactions

), final AS (

  SELECT
      transaction_union.mag_order_id AS transaction_id
    , mag_order.mag_order_id
    , transaction_union.settlement_id
    , CAST('Alipay' AS string) AS channel_or_gateway
    , transaction_union.data_source
    , transaction_union.transaction_status AS transaction_state
    , CAST('Approved' AS string) AS checkout_status
    , transaction_union.payment_processed_at
    , transaction_union.payment_amount
    , transaction_union.payment_fee
    , transaction_union.refund_processed_at
    , transaction_union.refund_amount
    , transaction_union.refund_fee
    , transaction_union.settlement_date
    , transaction_union.file_time
    , CAST('SG Web' AS string) AS sales_channel
    , current_timestamp AS rebuild_timestamp
  FROM transaction_union
  LEFT JOIN mag_order
    ON transaction_union.mag_order_id = mag_order.mag_order_id

)

SELECT * FROM final