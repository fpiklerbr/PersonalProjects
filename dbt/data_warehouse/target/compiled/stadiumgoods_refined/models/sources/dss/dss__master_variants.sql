







 

SELECT   `master_variants_id`,  `master_product_id`,  `size`,  `simple_size`,  `barcode_number`,  `created_at`,  `updated_at`,  `_synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `master_variants_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`master_product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`master_product_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `master_product_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`size` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`size` AS string)), '') AS string) END as string)
 AS `size`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`simple_size` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`simple_size` AS string)), '') AS string) END as string)
 AS `simple_size`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`barcode_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`barcode_number` AS string)), '') AS string) END as float64)
 as int64)
 AS `barcode_number`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`



FROM `ff-stadiumgoods-raw-live`.`dss_portal_production`.`master_variants` AS source_table

 ) AS un_ordered

