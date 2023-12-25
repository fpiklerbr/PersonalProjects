

  






 

SELECT   `value_id`,  `entity_type_id`,  `attribute_id`,  `store_id`,  `category_id`,  `attribute_value`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`value_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`value_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `value_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_type_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_type_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `entity_type_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`attribute_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`attribute_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `attribute_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `store_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `category_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`value` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`value` AS string)), '') AS string) END as string)
 AS `attribute_value`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_category_entity_varchar` AS source_table

 ) AS un_ordered

