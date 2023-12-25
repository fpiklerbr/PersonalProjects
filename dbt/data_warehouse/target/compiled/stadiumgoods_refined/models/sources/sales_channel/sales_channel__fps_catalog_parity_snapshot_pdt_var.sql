



    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `fps_catalog_parity_snapshot_product_variant_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `fps_catalog_parity_snapshot_product_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sg_size` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sg_size` AS string)), '') AS string) END as string)
 AS `sg_size`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sg_price_in_dollars` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sg_price_in_dollars` AS string)), '') AS string) END as float64)
 as int64)
 AS `sg_price_in_dollars`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fps_size` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fps_size` AS string)), '') AS string) END as string)
 AS `fps_size`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fps_price_in_dollars` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fps_price_in_dollars` AS string)), '') AS string) END as float64)
 as int64)
 AS `fps_price_in_dollars`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fps_merchant_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fps_merchant_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `fps_merchant_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`size_mapping_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`size_mapping_status` AS string)), '') AS string) END as string)
 AS `size_mapping_status`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`global_on_hand_inv_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`global_on_hand_inv_price` AS string)), '') AS string) END as string)
 AS `global_on_hand_inv_price`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dss_merchants_on_hand_inventory` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dss_merchants_on_hand_inventory` AS string)), '') AS string) END as string)
 AS `dss_merchants_on_hand_inventory`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ff_variant_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ff_variant_id` AS string)), '') AS string) END as string)
 AS `ff_variant_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`global_on_hand_inventory` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`global_on_hand_inventory` AS string)), '') AS string) END as string)
 AS `global_on_hand_inventory`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dss_merchants_on_hand_inv_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dss_merchants_on_hand_inv_price` AS string)), '') AS string) END as string)
 AS `dss_merchants_on_hand_inv_price`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sg_merchants_on_hand_inv_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sg_merchants_on_hand_inv_price` AS string)), '') AS string) END as string)
 AS `sg_merchants_on_hand_inv_price`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sg_merchants_on_hand_inventory` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sg_merchants_on_hand_inventory` AS string)), '') AS string) END as string)
 AS `sg_merchants_on_hand_inventory`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
  , `sg_barcode` AS `_raw_sg_barcode`
  , `ff_barcode` AS `_raw_ff_barcode`
FROM `ff-stadiumgoods-raw-live`.`sales_channel`.`fps_catalog_parity_snapshot_product_variants`

WHERE 1=1
AND 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 > (SELECT max(fps_catalog_parity_snapshot_product_variant_id) FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`sales_channel__fps_catalog_parity_snapshot_pdt_var`)
                 ) , final AS ( 
                    SELECT

    `fps_catalog_parity_snapshot_product_variant_id` AS `fps_catalog_parity_snapshot_product_variant_id`
  , `fps_catalog_parity_snapshot_product_id` AS `fps_catalog_parity_snapshot_product_id`
  , `sg_size` AS `sg_size`
  , `sg_price_in_dollars` AS `sg_price_in_dollars`
  , `fps_size` AS `fps_size`
  , `fps_price_in_dollars` AS `fps_price_in_dollars`
  , `fps_merchant_id` AS `fps_merchant_id`
  , `size_mapping_status` AS `size_mapping_status`
  , `global_on_hand_inv_price` AS `global_on_hand_inv_price`
  , `dss_merchants_on_hand_inventory` AS `dss_merchants_on_hand_inventory`
  , `ff_variant_id` AS `ff_variant_id`
  , `global_on_hand_inventory` AS `global_on_hand_inventory`
  , `dss_merchants_on_hand_inv_price` AS `dss_merchants_on_hand_inv_price`
  , `sg_merchants_on_hand_inv_price` AS `sg_merchants_on_hand_inv_price`
  , `sg_merchants_on_hand_inventory` AS `sg_merchants_on_hand_inventory`
  , `_synched_from_source_at` AS `_synched_from_source_at`
  , `_raw_sg_barcode` AS `_raw_sg_barcode`
  , `_raw_ff_barcode` AS `_raw_ff_barcode`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final 