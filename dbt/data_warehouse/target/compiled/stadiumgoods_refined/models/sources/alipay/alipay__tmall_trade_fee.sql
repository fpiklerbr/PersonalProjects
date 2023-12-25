
















 

SELECT   `payment_time`,  `alipay_transaction_id`,  `tmall_order_id`,  `amount`,  `transaction_amount`,  `currency`,  `_raw_exchange_rate`,  `fee_type`,  `fee_amount_rmb`,  `fee_amount`,  `fee_description`,  `file_time`,  `file_name`,  `original_tmall_order_id`,  `transaction_type`,  `is_shipping`,  `is_duties`,  `crossdock_reference`
  FROM ( 

SELECT
    *

  , CAST(regexp_extract(fee_description, 
  r'\{(.*?)}'
) AS string) AS `crossdock_reference` 
FROM ( 

SELECT
    *

  , 
    safe_cast((-1* _raw_fee_amount_rmb) as float64)
 AS `fee_amount_rmb`
  , 
    safe_cast((-1* _raw_fee_amount_usd) as float64)
 AS `fee_amount`
  , 
    safe_cast(CASE WHEN transaction_amount < 0 THEN 'refund' ELSE 'payment' END as string)
 AS `transaction_type`
  , 
    safe_cast(CASE WHEN fee_type = 'Tmall Logisitic' AND LEFT(fee_description,20) = '天猫进口卖家物流服务_基础服务费(商家)' THEN TRUE ELSE FALSE END as boolean)
 AS `is_shipping`
  , 
    safe_cast(CASE WHEN fee_type = 'Tmall Logisitic' AND LEFT(fee_description,19) = '天猫进口卖家物流服务_进口关税(商家)' THEN TRUE ELSE FALSE END as boolean)
 AS `is_duties` 
FROM ( 

SELECT
    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payment_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_time` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Asia/Shanghai') AS timestamp) AS `payment_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transaction_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_id` AS string)), '') AS string) END as string)
 AS `alipay_transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`partner_transaction_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`partner_transaction_id` AS string)), '') AS string) END as string)
 AS `tmall_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amount` AS string)), '') AS string) END as string)
 AS `amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`foreign_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`foreign_amount` AS string)), '') AS string) END as float64)
 AS `transaction_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`currency` AS string)), '') AS string) END as string)
 AS `currency`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`exchange_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`exchange_rate` AS string)), '') AS string) END as string)
 AS `_raw_exchange_rate`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fee_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fee_type` AS string)), '') AS string) END as string)
 AS `fee_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fee_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fee_amount` AS string)), '') AS string) END as float64)
 AS `_raw_fee_amount_rmb`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`foreign_fee_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`foreign_fee_amount` AS string)), '') AS string) END as float64)
 AS `_raw_fee_amount_usd`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fee_desc` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fee_desc` AS string)), '') AS string) END as string)
 AS `fee_description`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`original_partner_transaction_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`original_partner_transaction_id` AS string)), '') AS string) END as string)
 AS `original_tmall_order_id`



FROM `ff-stadiumgoods-raw-live`.`imports`.`alipay_tmall_trade_fee` AS source_table

 ) AS source_select_statement

 ) AS source_and_sql_select_statement

 ) AS un_ordered

