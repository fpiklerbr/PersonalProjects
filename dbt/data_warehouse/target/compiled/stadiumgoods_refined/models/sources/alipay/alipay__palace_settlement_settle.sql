



















 

SELECT   `partner_transaction_id`,  `amount`,  `rmb_amount`,  `fee`,  `settlement`,  `rmb_settlement`,  `currency`,  `rate`,  `payment_time`,  `settlement_time`,  `transaction_description`,  `status`,  `stem_from`,  `remarks`,  `original_partner_transaction_id`,  `file_time`,  `file_name`,  `transaction_id`,  `transaction_amount`,  `transaction_processed_at`,  `settlement_date`,  `settlement_id`,  `payment_amount`,  `refund_amount`,  `payment_fee`,  `refund_fee`,  `payment_processed_at`,  `refund_processed_at`
  FROM ( SELECT
    *

  , 
    safe_cast(CASE WHEN transaction_description = 'P' THEN transaction_amount END as float64)
 AS `payment_amount`
  , 
    safe_cast(CASE WHEN transaction_description = 'R' THEN (-1 * transaction_amount) END as float64)
 AS `refund_amount`
  , 
    safe_cast(CASE WHEN transaction_description = 'P' THEN transaction_processed_at END as timestamp)
 AS `payment_processed_at`
  , 
    safe_cast(CASE WHEN transaction_description = 'R' THEN transaction_processed_at END as timestamp)
 AS `refund_processed_at` 

 

FROM ( 

SELECT
    *

  , safe_cast(datetime(safe_cast(settlement_time AS timestamp), 'America/New_York') AS date) AS `settlement_date`
  , CAST(regexp_extract(file_name, 
  r'([0-9]{32}).csv'
) AS string) AS `settlement_id` 
FROM ( 

SELECT
    *

  , 
    safe_cast(replace(partner_transaction_id, '	', '') as string)
 AS `transaction_id`
  , 
    safe_cast(nullif(replace(amount, '	', ''), '-') as float64)
 AS `transaction_amount`
  , 
    safe_cast(coalesce(payment_time, settlement_time) as timestamp)
 AS `transaction_processed_at`
  , 
    safe_cast(CASE WHEN transaction_description = 'P' THEN (-1 * fee) END as float64)
 AS `payment_fee`
  , 
    safe_cast(CASE WHEN transaction_description = 'R' THEN (-1 * fee) END as float64)
 AS `refund_fee` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`partner_transaction_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`partner_transaction_id` AS string)), '') AS string) END as string)
 AS `partner_transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amount` AS string)), '') AS string) END as string)
 AS `amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rmb_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rmb_amount` AS string)), '') AS string) END as string)
 AS `rmb_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fee` AS string)), '') AS string) IN ('-','-	','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fee` AS string)), '') AS string) END as float64)
 AS `fee`

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
 AS datetime), 'Asia/Shanghai') AS timestamp) AS `payment_time`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`settlement_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`settlement_time` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Asia/Shanghai') AS timestamp) AS `settlement_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`type` AS string)), '') AS string) END as string)
 AS `transaction_description`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as string)
 AS `status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stem_from` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stem_from` AS string)), '') AS string) END as string)
 AS `stem_from`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`remarks` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`remarks` AS string)), '') AS string) END as string)
 AS `remarks`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`original_partner_transaction_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`original_partner_transaction_id` AS string)), '') AS string) END as string)
 AS `original_partner_transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`



FROM `ff-stadiumgoods-raw-live`.`imports`.`tmall_palace_settlement_settle` AS source_table

 ) AS source_select_statement

 ) AS source_and_sql_select_statement

 ) AS macro_statement

 ) AS un_ordered

