

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`sales_channel__fps_catalog_parity_snapshot_products`
  OPTIONS()
  as 



    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `fps_catalog_parity_snapshot_product_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`snapshot_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`snapshot_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `fps_catalog_parity_snapshot_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`mag_product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`mag_product_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `configurable_product_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ff_product_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ff_product_number` AS string)), '') AS string) END as string)
 AS `fps_parent_product_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`mag_sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`mag_sku` AS string)), '') AS string) END as string)
 AS `mag_sku`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`mag_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`mag_name` AS string)), '') AS string) END as string)
 AS `mag_product_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`mag_pdp_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`mag_pdp_status` AS string)), '') AS string) END as string)
 AS `mag_pdp_status`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fps_pdp_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fps_pdp_status` AS string)), '') AS string) END as string)
 AS `fps_pdp_status`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fps_sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fps_sku` AS string)), '') AS string) END as string)
 AS `fps_sku`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fps_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fps_name` AS string)), '') AS string) END as string)
 AS `fps_product_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`size_scale_mapping_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`size_scale_mapping_status` AS string)), '') AS string) END as string)
 AS `size_scale_mapping_status`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
FROM `ff-stadiumgoods-raw-live`.`sales_channel`.`fps_catalog_parity_snapshot_products`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `fps_catalog_parity_snapshot_product_id` AS `fps_catalog_parity_snapshot_product_id`
  , `fps_catalog_parity_snapshot_id` AS `fps_catalog_parity_snapshot_id`
  , `configurable_product_id` AS `configurable_product_id`
  , `fps_parent_product_id` AS `fps_parent_product_id`
  , `mag_sku` AS `mag_sku`
  , `mag_product_name` AS `mag_product_name`
  , `mag_pdp_status` AS `mag_pdp_status`
  , `fps_pdp_status` AS `fps_pdp_status`
  , `fps_sku` AS `fps_sku`
  , `fps_product_name` AS `fps_product_name`
  , `size_scale_mapping_status` AS `size_scale_mapping_status`
  , `_synched_from_source_at` AS `_synched_from_source_at`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final ;

