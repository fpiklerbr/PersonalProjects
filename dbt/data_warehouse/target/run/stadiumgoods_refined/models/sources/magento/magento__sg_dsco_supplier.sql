

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sg_dsco_supplier`
  OPTIONS()
  as 

  














 

SELECT   `supplier_id`,  `dropshipper_id`,  `name`,  `supplier_acronym`,  `created_at`,  `updated_at`,  `attribute_name_manufacturer_sku`,  `attribute_name_partner_sku`,  `attribute_name_size`,  `attribute_name_gender`,  `attribute_name_colors`,  `attribute_name_colorway`,  `is_active`
    , `_raw_stockpoint_id`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `supplier_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_supplier_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_supplier_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `dropshipper_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`name` AS string)), '') AS string) END as string)
 AS `name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`serials_acronym` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`serials_acronym` AS string)), '') AS string) END as string)
 AS `supplier_acronym`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`attribute_name_manufacturer_sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`attribute_name_manufacturer_sku` AS string)), '') AS string) END as string)
 AS `attribute_name_manufacturer_sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`attribute_name_partner_sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`attribute_name_partner_sku` AS string)), '') AS string) END as string)
 AS `attribute_name_partner_sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`attribute_name_size` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`attribute_name_size` AS string)), '') AS string) END as string)
 AS `attribute_name_size`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`attribute_name_gender` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`attribute_name_gender` AS string)), '') AS string) END as string)
 AS `attribute_name_gender`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`attribute_name_colors` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`attribute_name_colors` AS string)), '') AS string) END as string)
 AS `attribute_name_colors`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`attribute_name_colorway` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`attribute_name_colorway` AS string)), '') AS string) END as string)
 AS `attribute_name_colorway`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_active` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_active` AS string)), '') AS string) END as float64)
 as int64)
 AS `is_active`


  , `stockpoint_id` AS `_raw_stockpoint_id`

  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_dsco_supplier` AS source_table

 ) AS un_ordered

;

