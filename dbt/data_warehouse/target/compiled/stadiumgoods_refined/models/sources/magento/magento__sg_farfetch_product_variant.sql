

  

    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sg_farfetch_product_variant_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ff_size_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ff_size_id` AS string)), '') AS string) END as string)
 AS `ff_size_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ff_size` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ff_size` AS string)), '') AS string) END as string)
 AS `ff_size`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ff_variant_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ff_variant_id` AS string)), '') AS string) END as string)
 AS `ff_variant_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sg_size` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sg_size` AS string)), '') AS string) END as string)
 AS `sg_size`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`mag_variant_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`mag_variant_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `mag_variant_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sg_farfetch_product_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`size_mapping_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`size_mapping_status` AS string)), '') AS string) END as string)
 AS `size_mapping_status`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`inventory_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`inventory_status` AS string)), '') AS string) END as string)
 AS `inventory_status`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`mapped_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`mapped_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `mapped_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`missing_mag_variant_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`missing_mag_variant_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `missing_mag_variant_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
  , `inventory_integration` AS `_raw_inventory_integration`
FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_product_variant`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `sg_farfetch_product_variant_id` AS `sg_farfetch_product_variant_id`
  , `ff_size_id` AS `ff_size_id`
  , `ff_size` AS `ff_size`
  , `ff_variant_id` AS `ff_variant_id`
  , `sg_size` AS `sg_size`
  , `mag_variant_id` AS `mag_variant_id`
  , `sg_farfetch_product_id` AS `sg_farfetch_product_id`
  , `size_mapping_status` AS `size_mapping_status`
  , `inventory_status` AS `inventory_status`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `mapped_at` AS `mapped_at`
  , `missing_mag_variant_at` AS `missing_mag_variant_at`
  , `_synched_from_source_at` AS `_synched_from_source_at`
  , `_raw_inventory_integration` AS `_raw_inventory_integration`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final 