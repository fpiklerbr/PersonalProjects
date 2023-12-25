

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__smv_tmall_order_queue`
  OPTIONS()
  as 

  










 

SELECT   `smv_tmall_order_queue_id`,  `tmall_order_id`,  `tmall_status`,  `status`,  `error_message`,  `created_at`,  `updated_at`,  `retries_count`,  `force_retry_error_code`,  `tmall_entity_id`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `smv_tmall_order_queue_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tmall_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tmall_order_id` AS string)), '') AS string) END as string)
 AS `tmall_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tmall_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tmall_status` AS string)), '') AS string) END as string)
 AS `tmall_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as string)
 AS `status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`error_message` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`error_message` AS string)), '') AS string) END as string)
 AS `error_message`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`retries_count` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`retries_count` AS string)), '') AS string) END as float64)
 as int64)
 AS `retries_count`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`force_retry_error_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`force_retry_error_code` AS string)), '') AS string) END as string)
 AS `force_retry_error_code`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tmall_entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tmall_entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `tmall_entity_id`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`smv_tmall_order_queue` AS source_table

 ) AS un_ordered

;

