

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`dss__products`
  OPTIONS()
  as 

  





























 

SELECT   `product_id`,  `master_product_id`,  `third_party_id`,  `third_party_product_id`,  `product_number`,  `title`,  `manufacturer_sku`,  `color`,  `gender`,  `product_type`,  `brand`,  `approval_state`,  `categorized`,  `rejected`,  `is_published`,  `needs_photos`,  `synced`,  `hidden`,  `is_deleted`,  `metadata`,  `third_party_published_at`,  `published_at`,  `created_at`,  `updated_at`
    , `_raw_total_quantity`
    , `_raw_total_published_quantity`
    , `_raw_inventory_updated_at`
    , `_raw_published_on`
    , `_raw_auto_publish_strategy`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `product_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`master_product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`master_product_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `master_product_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`third_party_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`third_party_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `third_party_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`third_party_product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`third_party_product_id` AS string)), '') AS string) END as string)
 AS `third_party_product_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_number` AS string)), '') AS string) END as string)
 AS `product_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`title` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`title` AS string)), '') AS string) END as string)
 AS `title`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`mpn` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`mpn` AS string)), '') AS string) END as string)
 AS `manufacturer_sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`color` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`color` AS string)), '') AS string) END as string)
 AS `color`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gender` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gender` AS string)), '') AS string) END as string)
 AS `gender`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_type` AS string)), '') AS string) END as string)
 AS `product_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vendor` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vendor` AS string)), '') AS string) END as string)
 AS `brand`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`approval_state` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`approval_state` AS string)), '') AS string) END as float64)
 as int64)
 AS `approval_state`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`categorized` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`categorized` AS string)), '') AS string) END as float64)
 as int64)
 AS `categorized`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rejected` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rejected` AS string)), '') AS string) END as float64)
 as int64)
 AS `rejected`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`published` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`published` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`published` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`published` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `is_published`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`needs_photos` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`needs_photos` AS string)), '') AS string) END as float64)
 as int64)
 AS `needs_photos`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`synced` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`synced` AS string)), '') AS string) END as float64)
 as int64)
 AS `synced`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`hidden` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`hidden` AS string)), '') AS string) END as float64)
 as int64)
 AS `hidden`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`deleted` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`deleted` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`deleted` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`deleted` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `is_deleted`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`metadata` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`metadata` AS string)), '') AS string) END as string)
 AS `metadata`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`third_party_published_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`third_party_published_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `third_party_published_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`published_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`published_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `published_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`


  , `total_quantity` AS `_raw_total_quantity`

  , `total_published_quantity` AS `_raw_total_published_quantity`

  , `inventory_updated_at` AS `_raw_inventory_updated_at`

  , `published_on` AS `_raw_published_on`

  , `auto_publish_strategy` AS `_raw_auto_publish_strategy`

  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`dss_portal_production`.`products` AS source_table

 ) AS un_ordered

;

