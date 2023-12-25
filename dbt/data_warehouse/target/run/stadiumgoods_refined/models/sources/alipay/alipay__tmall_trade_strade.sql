

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`alipay__tmall_trade_strade`
  OPTIONS()
  as 


  















 

SELECT   `tmall_transaction_id`,  `transaction_id`,  `transaction_amount`,  `rmb_amount`,  `transaction_fee`,  `transaction_refund`,  `settlement`,  `rmb_settlement`,  `currency`,  `rate`,  `transaction_processed_at`,  `settlement_time`,  `transaction_description`,  `file_time`,  `file_name`,  `original_partner_transaction_id`,  `payment_amount`,  `refund_amount`,  `payment_fee`,  `refund_fee`,  `payment_processed_at`,  `refund_processed_at`
  FROM ( 

SELECT
    *

  , 
    safe_cast(CASE WHEN transaction_description = 'P' THEN transaction_amount END as float64)
 AS `payment_amount`
  , 
    safe_cast(coalesce(CASE WHEN transaction_description = 'R' THEN (-1 * transaction_amount) END, transaction_refund) as float64)
 AS `refund_amount`
  , 
    safe_cast(CASE WHEN transaction_description = 'P' THEN (-1 * transaction_fee) END as float64)
 AS `payment_fee`
  , 
    safe_cast(coalesce(CASE WHEN transaction_description = 'R' THEN (-1 * transaction_fee) END, CASE WHEN transaction_refund IS NOT NULL THEN transaction_fee END) as float64)
 AS `refund_fee`
  , 
    safe_cast(CASE WHEN transaction_description = 'P' THEN transaction_processed_at END as timestamp)
 AS `payment_processed_at`
  , 
    safe_cast(coalesce(CASE WHEN transaction_description = 'R' THEN transaction_processed_at END, CASE WHEN transaction_refund IS NOT NULL THEN transaction_processed_at END) as timestamp)
 AS `refund_processed_at` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`partner_transaction_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`partner_transaction_id` AS string)), '') AS string) END as string)
 AS `tmall_transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transaction_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_id` AS string)), '') AS string) END as string)
 AS `transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amount` AS string)), '') AS string) IN ('-','-	','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amount` AS string)), '') AS string) END as float64)
 AS `transaction_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rmb_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rmb_amount` AS string)), '') AS string) END as string)
 AS `rmb_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fee` AS string)), '') AS string) IN ('-','-	','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fee` AS string)), '') AS string) END as float64)
 AS `transaction_fee`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`refund` AS string)), '') AS string) IN ('-','-	','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`refund` AS string)), '') AS string) END as float64)
 AS `transaction_refund`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`settlement` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`settlement` AS string)), '') AS string) END as string)
 AS `settlement`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rmb_settlement` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rmb_settlement` AS string)), '') AS string) END as string)
 AS `rmb_settlement`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`currency` AS string)), '') AS string) END as string)
 AS `currency`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rate` AS string)), '') AS string) END as float64)
 AS `rate`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payment_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_time` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Asia/Shanghai') AS timestamp) AS `transaction_processed_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`settlement_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`settlement_time` AS string)), '') AS string) END as string)
 AS `settlement_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`type` AS string)), '') AS string) END as string)
 AS `transaction_description`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`original_partner_transaction_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`original_partner_transaction_id` AS string)), '') AS string) END as string)
 AS `original_partner_transaction_id`



FROM `ff-stadiumgoods-raw-live`.`imports`.`alipay_tmall_trade_strade` AS source_table

 ) AS source_select_statement

 ) AS un_ordered

;

