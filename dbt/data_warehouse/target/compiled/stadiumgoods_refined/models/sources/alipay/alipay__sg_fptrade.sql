




















 

SELECT   `partner_transaction_id`,  `transaction_amount`,  `rmb_amount`,  `fee`,  `distribute_amount`,  `distribute_rmb_amount`,  `settlement`,  `rmb_settlement`,  `currency`,  `rate`,  `transaction_processed_at`,  `settlement_time`,  `transaction_description`,  `status`,  `remarks`,  `file_name`,  `file_time`,  `original_partner_transaction_id`,  `payment_amount`,  `payment_processed_at`,  `payment_fee`,  `refund_amount`,  `refund_processed_at`,  `refund_fee`,  `flow_order_number`,  `mag_order_id`
  FROM ( 

SELECT
    *

  , coalesce(
        
  CAST(regexp_extract(partner_transaction_id, 
  r'ord-[A-z0-9]{32}'
) AS string)

      , 
  CAST(regexp_extract(original_partner_transaction_id, 
  r'ord-[A-z0-9]{32}'
) AS string)

      , 
  CAST(regexp_extract(remarks, 
  r'ord-[A-z0-9]{32}'
) AS string)

    )

 AS `flow_order_number`
  , coalesce(
        
  CAST(regexp_extract(partner_transaction_id, 
  r'-[0-9]([0-9]{9})-[0-9]'
) AS string)

      , 
  CAST(regexp_extract(original_partner_transaction_id, 
  r'[0-9]{9}'
) AS string)

      , 
  CAST(regexp_extract(remarks, 
  r'#([0-9]{9})'
) AS string)

    )
  

 AS `mag_order_id` 
FROM ( 

SELECT
    *

  , 
    safe_cast(CASE WHEN transaction_description = 'P' THEN transaction_amount END as float64)
 AS `payment_amount`
  , 
    safe_cast(CASE WHEN transaction_description = 'P' THEN transaction_processed_at END as timestamp)
 AS `payment_processed_at`
  , 
    safe_cast(CASE WHEN transaction_description = 'P' THEN (-1 * fee) END as float64)
 AS `payment_fee`
  , 
    safe_cast(CASE WHEN transaction_description = 'R' THEN (-1 * transaction_amount) END as float64)
 AS `refund_amount`
  , 
    safe_cast(CASE WHEN transaction_description = 'R' THEN transaction_processed_at END as timestamp)
 AS `refund_processed_at`
  , 
    safe_cast(CASE WHEN transaction_description = 'R' THEN (-1 * fee) END as float64)
 AS `refund_fee` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`partner_transaction_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`partner_transaction_id` AS string)), '') AS string) END as string)
 AS `partner_transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amount` AS string)), '') AS string) IN ('-','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amount` AS string)), '') AS string) END as float64)
 AS `transaction_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rmb_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rmb_amount` AS string)), '') AS string) END as string)
 AS `rmb_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fee` AS string)), '') AS string) IN ('-','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fee` AS string)), '') AS string) END as float64)
 AS `fee`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`distribute_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`distribute_amount` AS string)), '') AS string) END as string)
 AS `distribute_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`distribute_rmb_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`distribute_rmb_amount` AS string)), '') AS string) END as string)
 AS `distribute_rmb_amount`

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
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`settlement_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`settlement_time` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `settlement_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`type` AS string)), '') AS string) END as string)
 AS `transaction_description`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as string)
 AS `status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`remarks` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`remarks` AS string)), '') AS string) END as string)
 AS `remarks`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`original_partner_transaction_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`original_partner_transaction_id` AS string)), '') AS string) END as string)
 AS `original_partner_transaction_id`



FROM `ff-stadiumgoods-raw-live`.`imports`.`alipay_sg_fptrade` AS source_table

 ) AS source_select_statement

 ) AS source_and_sql_select_statement

 ) AS un_ordered

