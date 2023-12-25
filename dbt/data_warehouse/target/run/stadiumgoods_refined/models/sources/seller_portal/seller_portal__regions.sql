

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__regions`
  OPTIONS()
  as 










 

SELECT   `region_id`,  `country_id`,  `key`,  `region_code`,  `region_name`,  `last_modified_in_x3_at`,  `created_at`,  `updated_at`,  `_synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `region_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`country_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`country_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `country_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`key` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`key` AS string)), '') AS string) END as string)
 AS `key`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`code` AS string)), '') AS string) END as string)
 AS `region_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`name` AS string)), '') AS string) END as string)
 AS `region_name`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`last_modified_in_x3_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`last_modified_in_x3_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `last_modified_in_x3_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `_synched_from_source_at`



FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`regions` AS source_table

 ) AS un_ordered

;

