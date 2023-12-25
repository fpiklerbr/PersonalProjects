

  









 

SELECT   `entity_id`,  `order_id`,  `order_increment_id`,  `tmall_order_id`,  `message`,  `type`,  `created_at`,  `updated_at`,  `raw_order_data`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `entity_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_increment_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_increment_id` AS string)), '') AS string) END as string)
 AS `order_increment_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tmall_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tmall_order_id` AS string)), '') AS string) END as string)
 AS `tmall_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`message` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`message` AS string)), '') AS string) END as string)
 AS `message`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`type` AS string)), '') AS string) END as string)
 AS `type`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `created_at`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `updated_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`raw_order_data` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`raw_order_data` AS string)), '') AS string) END as string)
 AS `raw_order_data`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`smv_tmall_order_log` AS source_table

 ) AS un_ordered

