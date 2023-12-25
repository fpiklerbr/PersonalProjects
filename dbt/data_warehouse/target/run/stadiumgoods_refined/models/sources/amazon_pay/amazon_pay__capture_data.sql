

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`amazon_pay__capture_data`
  OPTIONS()
  as 

  












 

SELECT   `transaction_id`,  `capture_reference_id`,  `amazon_authorization_id`,  `amazon_order_reference_id`,  `payment_amount`,  `currency_code`,  `seller_capture_note`,  `capture_status`,  `last_update_timestamp`,  `reason_code`,  `payment_processed_at`,  `file_time`,  `file_name`
  FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amazon_capture_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amazon_capture_id` AS string)), '') AS string) END as string)
 AS `transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`capture_reference_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`capture_reference_id` AS string)), '') AS string) END as string)
 AS `capture_reference_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amazon_authorization_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amazon_authorization_id` AS string)), '') AS string) END as string)
 AS `amazon_authorization_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amazon_order_reference_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amazon_order_reference_id` AS string)), '') AS string) END as string)
 AS `amazon_order_reference_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`capture_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`capture_amount` AS string)), '') AS string) END as float64)
 AS `payment_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`currency_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`currency_code` AS string)), '') AS string) END as string)
 AS `currency_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`seller_capture_note` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`seller_capture_note` AS string)), '') AS string) END as string)
 AS `seller_capture_note`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`capture_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`capture_status` AS string)), '') AS string) END as string)
 AS `capture_status`

  , 
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`last_update_timestamp` AS string)), '') AS string), 
  ' '
, 
  ''
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`last_update_timestamp` AS string)), '') AS string), 
  ' '
, 
  ''
) END as timestamp)
 AS `last_update_timestamp`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reason_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reason_code` AS string)), '') AS string) END as string)
 AS `reason_code`

  , 
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`creation_timestamp` AS string)), '') AS string), 
  ' '
, 
  ''
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`creation_timestamp` AS string)), '') AS string), 
  ' '
, 
  ''
) END as timestamp)
 AS `payment_processed_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`



FROM `ff-stadiumgoods-raw-live`.`imports`.`amazon_pay_capture_data` AS source_table

 ) AS un_ordered

;

