


  










 

SELECT   `category_id`,  `entity_type_id`,  `attribute_set_id`,  `parent_id`,  `created_at`,  `updated_at`,  `position`,  `category_level`,  `children_count`,  `category_path`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    *

  , SPLIT(path,'/') AS `category_path` 
FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `category_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_type_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_type_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `entity_type_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`attribute_set_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`attribute_set_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `attribute_set_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`parent_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`parent_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `parent_id`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`path` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`path` AS string)), '') AS string) END as string)
 AS `path`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`position` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`position` AS string)), '') AS string) END as float64)
 as int64)
 AS `position`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`level` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`level` AS string)), '') AS string) END as float64)
 as int64)
 AS `category_level`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`children_count` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`children_count` AS string)), '') AS string) END as float64)
 as int64)
 AS `children_count`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_category_entity` AS source_table

 ) AS source_and_sql_select_statement

 ) AS un_ordered

