


WITH sg_settlement AS (

  SELECT
    transaction_id
  , CAST('Alipay Settlements' AS string) AS data_source
  , CAST('Paid' AS string) AS checkout_status
  , sum( payment_amount ) AS payment_amount
  , min( payment_processed_at ) AS payment_processed_at
  , sum( payment_fee ) AS payment_fee
  , sum( refund_amount ) AS refund_amount
  , min( refund_processed_at ) AS refund_processed_at
  , sum( refund_fee ) AS refund_fee
  , min(settlement_date) AS settlement_date
  , max(file_time) AS file_time
  , string_agg(DISTINCT settlement_id, ',') AS settlement_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`alipay__tmall_settlement_settle`
  GROUP BY 1, 2

), palace_settlement AS (

  SELECT
    transaction_id
  , CAST('Alipay Settlements' AS string) AS  data_source
  , CAST('Paid' AS string) AS checkout_status
  , sum( payment_amount ) AS payment_amount
  , min( payment_processed_at ) AS payment_processed_at
  , sum( payment_fee ) AS payment_fee
  , sum( refund_amount ) AS refund_amount
  , min( refund_processed_at ) AS refund_processed_at
  , sum( refund_fee ) AS refund_fee
  , min(settlement_date) AS settlement_date
  , max(file_time) AS file_time
  , string_agg(DISTINCT settlement_id, ',') AS settlement_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`alipay__palace_settlement_settle`
  GROUP BY 1, 2

), unioned AS (

  SELECT
    sg_settlement.*
  FROM sg_settlement
  UNION ALL
  SELECT
    palace_settlement.*
  FROM palace_settlement

)
SELECT * FROM unioned