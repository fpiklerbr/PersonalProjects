

  














 

SELECT   `order_date`,  `transaction_processed_at`,  `transaction_id`,  `mag_order_id`,  `status`,  `amount`,  `billing_name`,  `billing_address`,  `billing_email`,  `billing_phone`,  `shipping_name`,  `shipping_address`,  `shipping_email`,  `shipping_phone`,  `file_name`,  `file_time`
  FROM ( 

SELECT
    *

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(order_date AS datetime), 'America/New_York') AS timestamp) AS `transaction_processed_at` 
FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`date_confirmed` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`date_confirmed` AS string)), '') AS string) END as timestamp)
 as date)
 AS `order_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`loan_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`loan_id` AS string)), '') AS string) END as string)
 AS `transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as string)
 AS `mag_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as string)
 AS `status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amount` AS string)), '') AS string) END as float64)
 AS `amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_name` AS string)), '') AS string) END as string)
 AS `billing_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_address` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_address` AS string)), '') AS string) END as string)
 AS `billing_address`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_email` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_email` AS string)), '') AS string) END as string)
 AS `billing_email`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_phone` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_phone` AS string)), '') AS string) END as string)
 AS `billing_phone`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_name` AS string)), '') AS string) END as string)
 AS `shipping_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_address` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_address` AS string)), '') AS string) END as string)
 AS `shipping_address`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_email` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_email` AS string)), '') AS string) END as string)
 AS `shipping_email`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_phone` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_phone` AS string)), '') AS string) END as string)
 AS `shipping_phone`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`



FROM `ff-stadiumgoods-raw-live`.`imports`.`affirm_confirmed_charges` AS source_table

 ) AS source_and_sql_select_statement

 ) AS un_ordered

