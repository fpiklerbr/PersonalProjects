

  








 

SELECT   `sg_farfetch_country_id`,  `farfetch_country_id`,  `farfetch_country_code`,  `magento_country_id`,  `farfetch_country_name`,  `magento_country_name`,  `created_at`,  `updated_at`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sg_farfetch_country_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`country_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`country_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `farfetch_country_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`farfetch_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`farfetch_code` AS string)), '') AS string) END as string)
 AS `farfetch_country_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`system_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`system_code` AS string)), '') AS string) END as string)
 AS `magento_country_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`farfetch_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`farfetch_country` AS string)), '') AS string) END as string)
 AS `farfetch_country_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`system_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`system_country` AS string)), '') AS string) END as string)
 AS `magento_country_name`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_country` AS source_table

 ) AS un_ordered

