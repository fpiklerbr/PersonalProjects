

  









 

SELECT   `smv_fancy_order_queue_id`,  `fancy_order_id`,  `event_type`,  `request_data`,  `fancy_username`,  `status`,  `error_message`,  `created_at`,  `updated_at`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `smv_fancy_order_queue_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fancy_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fancy_order_id` AS string)), '') AS string) END as string)
 AS `fancy_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`event_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`event_type` AS string)), '') AS string) END as string)
 AS `event_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`request_data` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`request_data` AS string)), '') AS string) END as string)
 AS `request_data`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fancy_username` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fancy_username` AS string)), '') AS string) END as string)
 AS `fancy_username`

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


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`smv_fancy_order_queue` AS source_table

 ) AS un_ordered

