

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`dss__variants`
  OPTIONS()
  as 

  






























 

SELECT   `variant_id`,  `product_id`,  `master_variant_id`,  `third_party_id`,  `third_party_variant_id`,  `title`,  `third_party_sku`,  `third_party_barcode`,  `item_number`,  `variant_size`,  `weight_grams`,  `quantity`,  `published_quantity`,  `price`,  `published_price`,  `approval_state`,  `barcode_validation_state`,  `is_published`,  `depublished`,  `publishable`,  `metadata`,  `published_at`,  `published_price_last_updated_at`,  `created_at`,  `updated_at`,  `simple_size`
    , `_raw_third_party_inventory_item_id`
    , `_raw_barcode_validated_at`
    , `_raw_first_published_at`
    , `_raw_lock_version`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `variant_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `product_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`master_variant_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`master_variant_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `master_variant_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`third_party_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`third_party_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `third_party_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`third_party_variant_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`third_party_variant_id` AS string)), '') AS string) END as string)
 AS `third_party_variant_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`title` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`title` AS string)), '') AS string) END as string)
 AS `title`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`third_party_sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`third_party_sku` AS string)), '') AS string) END as string)
 AS `third_party_sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`third_party_barcode` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`third_party_barcode` AS string)), '') AS string) END as string)
 AS `third_party_barcode`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_number` AS string)), '') AS string) END as string)
 AS `item_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`size` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`size` AS string)), '') AS string) END as string)
 AS `variant_size`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`weight_grams` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`weight_grams` AS string)), '') AS string) END as float64)
 as int64)
 AS `weight_grams`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`quantity` AS string)), '') AS string) END as float64)
 as int64)
 AS `quantity`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`published_quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`published_quantity` AS string)), '') AS string) END as float64)
 as int64)
 AS `published_quantity`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price` AS string)), '') AS string) END as float64)
 AS `price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`published_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`published_price` AS string)), '') AS string) END as float64)
 AS `published_price`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`approval_state` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`approval_state` AS string)), '') AS string) END as float64)
 as int64)
 AS `approval_state`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`barcode_validation_state` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`barcode_validation_state` AS string)), '') AS string) END as float64)
 as int64)
 AS `barcode_validation_state`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`published` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`published` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`published` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`published` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `is_published`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`depublished` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`depublished` AS string)), '') AS string) END as float64)
 as int64)
 AS `depublished`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`publishable` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`publishable` AS string)), '') AS string) END as float64)
 as int64)
 AS `publishable`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`metadata` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`metadata` AS string)), '') AS string) END as string)
 AS `metadata`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`published_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`published_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `published_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`published_price_last_updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`published_price_last_updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `published_price_last_updated_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`simple_size` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`simple_size` AS string)), '') AS string) END as string)
 AS `simple_size`


  , `third_party_inventory_item_id` AS `_raw_third_party_inventory_item_id`

  , `barcode_validated_at` AS `_raw_barcode_validated_at`

  , `first_published_at` AS `_raw_first_published_at`

  , `lock_version` AS `_raw_lock_version`

  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`dss_portal_production`.`variants` AS source_table

 ) AS un_ordered

;

