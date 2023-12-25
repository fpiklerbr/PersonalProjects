

  












 

SELECT   `product_id`,  `entity_type_id`,  `attribute_set_id`,  `product_type`,  `sku`,  `has_options`,  `required_options`,  `created_at`,  `updated_at`,  `x3_sku`,  `sku_manufacturer_sku`,  `sku_size`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `product_id`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`type_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`type_id` AS string)), '') AS string) END as string)
 AS `product_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sku` AS string)), '') AS string) END as string)
 AS `sku`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`has_options` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`has_options` AS string)), '') AS string) END as float64)
 as int64)
 AS `has_options`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`required_options` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`required_options` AS string)), '') AS string) END as float64)
 as int64)
 AS `required_options`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sku_x3_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sku_x3_code` AS string)), '') AS string) END as string)
 AS `x3_sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sku_manufacturer_sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sku_manufacturer_sku` AS string)), '') AS string) END as string)
 AS `sku_manufacturer_sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sku_size` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sku_size` AS string)), '') AS string) END as string)
 AS `sku_size`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_entity` AS source_table

 ) AS un_ordered

