

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sumoheavy_imageimportdetail`
  OPTIONS()
  as 













 

SELECT   `sumoheavy_imageimportdetail_id`,  `import_label`,  `mfg_sku`,  `configurable_product_id`,  `number_of_serials`,  `product_status`,  `import_status`,  `image_count`,  `error_count`,  `created_at`,  `updated_at`,  `_synched_from_source_at`
  FROM ( 

SELECT
    *

  , CASE product_status_code
WHEN 1 THEN cast( 'Enabled' AS string)
WHEN 2 THEN cast( 'Disabled' AS string)
ELSE cast(product_status_code AS string)
END AS `product_status`
  , CASE import_status_code
WHEN 1 THEN cast( 'Failed - Missing' AS string)
WHEN 2 THEN cast( 'Imported' AS string)
WHEN 3 THEN cast( 'Failed - Multiple' AS string)
WHEN 4 THEN cast( 'Imported - Incomplete' AS string)
WHEN 5 THEN cast( 'Reimported' AS string)
ELSE cast(import_status_code AS string)
END AS `import_status` 
FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sumoheavy_imageimportdetail_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`import_label` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`import_label` AS string)), '') AS string) END as string)
 AS `import_label`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`manufacturer_sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`manufacturer_sku` AS string)), '') AS string) END as string)
 AS `mfg_sku`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `configurable_product_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`number_of_serials` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`number_of_serials` AS string)), '') AS string) END as float64)
 as int64)
 AS `number_of_serials`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_status` AS string)), '') AS string) END as float64)
 as int64)
 AS `product_status_code`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as float64)
 as int64)
 AS `import_status_code`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`number_image` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`number_image` AS string)), '') AS string) END as float64)
 as int64)
 AS `image_count`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`number_of_errors` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`number_of_errors` AS string)), '') AS string) END as float64)
 as int64)
 AS `error_count`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`



FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sumoheavy_imageimportdetail` AS source_table

 ) AS source_and_sql_select_statement

 ) AS un_ordered

;

