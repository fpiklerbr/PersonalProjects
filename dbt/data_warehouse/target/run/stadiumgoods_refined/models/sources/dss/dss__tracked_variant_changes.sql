

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`dss__tracked_variant_changes`
  OPTIONS()
  as 

  












 

SELECT   `tracked_variant_change_id`,  `variant_id`,  `new_published_quantity`,  `new_quantity`,  `old_published_quantity`,  `old_quantity`,  `new_price`,  `new_published_price`,  `old_price`,  `old_published_price`,  `created_at`,  `updated_at`,  `_synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `tracked_variant_change_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`variant_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`variant_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `variant_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`new_published_quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`new_published_quantity` AS string)), '') AS string) END as float64)
 as int64)
 AS `new_published_quantity`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`new_quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`new_quantity` AS string)), '') AS string) END as float64)
 as int64)
 AS `new_quantity`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`old_published_quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`old_published_quantity` AS string)), '') AS string) END as float64)
 as int64)
 AS `old_published_quantity`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`old_quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`old_quantity` AS string)), '') AS string) END as float64)
 as int64)
 AS `old_quantity`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`new_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`new_price` AS string)), '') AS string) END as numeric)
 AS `new_price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`new_published_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`new_published_price` AS string)), '') AS string) END as numeric)
 AS `new_published_price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`old_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`old_price` AS string)), '') AS string) END as numeric)
 AS `old_price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`old_published_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`old_published_price` AS string)), '') AS string) END as numeric)
 AS `old_published_price`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `created_at`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `updated_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`



FROM `ff-stadiumgoods-raw-live`.`dss_portal_production`.`tracked_variant_changes` AS source_table

 ) AS un_ordered

;

