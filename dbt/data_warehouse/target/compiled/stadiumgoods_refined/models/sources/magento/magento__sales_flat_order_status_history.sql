

  









 

SELECT   `sales_flat_order_status_history_id`,  `sales_flat_order_id`,  `is_customer_notified`,  `is_visible_on_front`,  `comment`,  `order_status`,  `created_at`,  `entity_name`
    , `_raw_author`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sales_flat_order_status_history_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`parent_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`parent_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sales_flat_order_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_customer_notified` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_customer_notified` AS string)), '') AS string) END as float64)
 as int64)
 AS `is_customer_notified`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_visible_on_front` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_visible_on_front` AS string)), '') AS string) END as float64)
 as int64)
 AS `is_visible_on_front`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`comment` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`comment` AS string)), '') AS string) END as string)
 AS `comment`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as string)
 AS `order_status`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_name` AS string)), '') AS string) END as string)
 AS `entity_name`


  , `author` AS `_raw_author`

  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_order_status_history` AS source_table

 ) AS un_ordered

