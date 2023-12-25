

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_tmall_strades`
  
  
  OPTIONS()
  as (
    


WITH sg_strade AS (

  SELECT
    sg.tmall_transaction_id
  , sum( payment_amount ) AS payment_amount
  , min( payment_processed_at ) AS payment_processed_at
  , sum( payment_fee ) AS payment_fee
  , sum( refund_amount ) AS refund_amount
  , min( refund_processed_at ) AS refund_processed_at
  , sum( refund_fee ) AS refund_fee
  , min(CAST(NULL AS date)) AS settlement_date
  , max(file_time) AS file_time
  FROM (SELECT DISTINCT * FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`alipay__tmall_trade_strade`) AS sg
  INNER JOIN (
    SELECT DISTINCT tmall_transaction_id
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`alipay__tmall_trade_strade`
    WHERE transaction_description = 'P'
  ) AS sg_payment USING (tmall_transaction_id)
  GROUP BY 1

), palace_strade AS (

  SELECT
    palace.tmall_transaction_id
  , sum( payment_amount ) AS payment_amount
  , min( payment_processed_at ) AS payment_processed_at
  , sum( payment_fee ) AS payment_fee
  , sum( refund_amount ) AS refund_amount
  , min( refund_processed_at ) AS refund_processed_at
  , sum( refund_fee ) AS refund_fee
  , min(CAST(NULL AS date)) AS settlement_date
  , max(file_time) AS file_time
  FROM (SELECT DISTINCT * FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`alipay__palace_trade_strade`) AS palace
  INNER JOIN (
    SELECT DISTINCT tmall_transaction_id
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`alipay__palace_trade_strade`
    WHERE transaction_description = 'P'
  ) AS palace_payment USING (tmall_transaction_id)
  GROUP BY 1

), unioned AS (

  SELECT
    sg_strade.*
  FROM sg_strade
  UNION ALL
  SELECT
    palace_strade.*
  FROM palace_strade

), final AS (

  SELECT
    unioned.tmall_transaction_id AS transaction_id
  , CAST('Alipay Trades' AS string) AS data_source
  , CAST('Paid' AS string) AS checkout_status
  , unioned.payment_amount
  , unioned.payment_processed_at
  , unioned.payment_fee
  , coalesce(unioned.refund_amount, CASE WHEN api.is_refunded IS TRUE THEN unioned.payment_amount END) AS refund_amount
  , coalesce(unioned.refund_processed_at, CASE WHEN api.is_refunded IS TRUE THEN unioned.payment_processed_at END) AS refund_processed_at
  , coalesce(unioned.refund_fee, CASE WHEN api.is_refunded IS TRUE THEN (-1 *unioned.payment_fee) END) AS refund_fee
  , SAFE_CAST(SAFE_CAST(NULL AS datetime) AS date) AS settlement_date
  , unioned.file_time
  , CAST(NULL AS string) AS settlement_id
  FROM unioned
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_tmall_api_orders` AS api ON unioned.tmall_transaction_id = api.transaction_id

)
SELECT * FROM final
  );
    