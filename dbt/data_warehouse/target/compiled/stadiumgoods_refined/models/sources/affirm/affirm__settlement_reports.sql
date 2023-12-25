


  












 

SELECT   `settlement_date`,  `order_date`,  `transaction_date`,  `transaction_processed_at`,  `transaction_id`,  `affirm_transaction_id`,  `mag_order_id`,  `event_type`,  `sales`,  `refunds`,  `fees`,  `total_settled`,  `settlement_id`,  `file_name`,  `file_time`
  FROM ( 

SELECT
    *

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(transaction_date AS datetime), 'America/New_York') AS timestamp) AS `transaction_processed_at` 
FROM ( 

SELECT
    *

  , 
    safe_cast(CASE WHEN event_type = 'loan_captured' THEN order_date ELSE settlement_date END as date)
 AS `transaction_date` 
FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`date` AS string)), '') AS string) END as timestamp)
 as date)
 AS `settlement_date`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`charge_created_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`charge_created_date` AS string)), '') AS string) END as timestamp)
 as date)
 AS `order_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`charge_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`charge_id` AS string)), '') AS string) END as string)
 AS `transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transaction_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_id` AS string)), '') AS string) END as string)
 AS `affirm_transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as string)
 AS `mag_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`event_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`event_type` AS string)), '') AS string) END as string)
 AS `event_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sales` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sales` AS string)), '') AS string) END as float64)
 AS `sales`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`refunds` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`refunds` AS string)), '') AS string) END as float64)
 AS `refunds`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fees` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fees` AS string)), '') AS string) END as float64)
 AS `fees`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_settled` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_settled` AS string)), '') AS string) END as float64)
 AS `total_settled`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`deposit_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`deposit_id` AS string)), '') AS string) END as string)
 AS `settlement_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`



FROM `ff-stadiumgoods-raw-live`.`imports`.`affirm_settlement_reports` AS source_table

 ) AS source_select_statement

 ) AS source_and_sql_select_statement

 ) AS un_ordered

