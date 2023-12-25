

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`dss__master_products`
  OPTIONS()
  as 

  






















 

SELECT   `master_product_id`,  `erp_category_id`,  `direct_category_id`,  `third_party_id`,  `product_category_id`,  `sync_state`,  `title`,  `manufacturer_sku`,  `nickname`,  `gender`,  `color`,  `primary_color`,  `total_quantity`,  `audited`,  `prioritized`,  `created_at`,  `updated_at`,  `vendor`,  `publish_before_sale_date_allowed`,  `release_date`,  `total_published_quantity`,  `_synched_from_source_at`,  `earliest_sale_date`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `master_product_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`erp_category_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`erp_category_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `erp_category_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`direct_category_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`direct_category_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `direct_category_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`third_party_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`third_party_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `third_party_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_category_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_category_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `product_category_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sync_state` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sync_state` AS string)), '') AS string) END as float64)
 as int64)
 AS `sync_state`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`title` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`title` AS string)), '') AS string) END as string)
 AS `title`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`mpn` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`mpn` AS string)), '') AS string) END as string)
 AS `manufacturer_sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`nickname` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`nickname` AS string)), '') AS string) END as string)
 AS `nickname`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gender` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gender` AS string)), '') AS string) END as string)
 AS `gender`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`color` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`color` AS string)), '') AS string) END as string)
 AS `color`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`primary_color` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`primary_color` AS string)), '') AS string) END as string)
 AS `primary_color`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_quantity` AS string)), '') AS string) END as float64)
 as int64)
 AS `total_quantity`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`audited` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`audited` AS string)), '') AS string) END as float64)
 as int64)
 AS `audited`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prioritized` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prioritized` AS string)), '') AS string) END as float64)
 as int64)
 AS `prioritized`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vendor` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vendor` AS string)), '') AS string) END as string)
 AS `vendor`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`publish_before_sale_date_allowed` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`publish_before_sale_date_allowed` AS string)), '') AS string) END as float64)
 as int64)
 AS `publish_before_sale_date_allowed`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`release_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`release_date` AS string)), '') AS string) END as timestamp)
 as date)
 AS `release_date`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_published_quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_published_quantity` AS string)), '') AS string) END as float64)
 as int64)
 AS `total_published_quantity`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`earliest_sale_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`earliest_sale_date` AS string)), '') AS string) END as timestamp)
 as date)
 AS `earliest_sale_date`



FROM `ff-stadiumgoods-raw-live`.`dss_portal_production`.`master_products` AS source_table

 ) AS un_ordered

;

