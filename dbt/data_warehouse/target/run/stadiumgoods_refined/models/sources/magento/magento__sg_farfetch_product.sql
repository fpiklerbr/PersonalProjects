

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sg_farfetch_product`
  OPTIONS()
  as 

  

    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sg_farfetch_product_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `configurable_product_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`farfetch_product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`farfetch_product_id` AS string)), '') AS string) END as string)
 AS `fps_parent_product_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sg_size_scale_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sg_size_scale_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sg_size_scale_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`type` AS string)), '') AS string) END as string)
 AS `type`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`original_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`original_price` AS string)), '') AS string) END as float64)
 as int64)
 AS `original_price`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price` AS string)), '') AS string) END as float64)
 as int64)
 AS `price`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gender_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gender_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `fps_gender_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`category_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`category_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `category_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sec_level_cat` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sec_level_cat` AS string)), '') AS string) END as float64)
 as int64)
 AS `sec_level_cat`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sizescale_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sizescale_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `fps_size_scale_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sku` AS string)), '') AS string) END as string)
 AS `fps_store_sku`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`manufacturer_sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`manufacturer_sku` AS string)), '') AS string) END as string)
 AS `manufacturer_sku`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`x3_product_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`x3_product_type` AS string)), '') AS string) END as string)
 AS `x3_product_type`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`box` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`box` AS string)), '') AS string) END as float64)
 as int64)
 AS `box`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`materials` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`materials` AS string)), '') AS string) END as string)
 AS `materials`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`collection` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`collection` AS string)), '') AS string) END as float64)
 as int64)
 AS `collection`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`brand` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`brand` AS string)), '') AS string) END as float64)
 as int64)
 AS `fps_brand_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`brand_options` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`brand_options` AS string)), '') AS string) END as string)
 AS `brand_options`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pbs_csv_enabled` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pbs_csv_enabled` AS string)), '') AS string) END as float64)
 as int64)
 AS `pbs_csv_enabled`
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

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`name` AS string)), '') AS string) END as string)
 AS `name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`description` AS string)), '') AS string) END as string)
 AS `description`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`short_description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`short_description` AS string)), '') AS string) END as string)
 AS `short_description`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`color` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`color` AS string)), '') AS string) END as string)
 AS `color`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`nth_cheapest_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`nth_cheapest_price` AS string)), '') AS string) END as float64)
 as int64)
 AS `nth_cheapest_price`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pricing_algorithm` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pricing_algorithm` AS string)), '') AS string) END as float64)
 as int64)
 AS `pricing_algorithm`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`country_of_origin` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`country_of_origin` AS string)), '') AS string) END as string)
 AS `country_of_origin`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`slot_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`slot_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `slot_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`material_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`material_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `material_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`season` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`season` AS string)), '') AS string) END as float64)
 as int64)
 AS `season`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_link` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_link` AS string)), '') AS string) END as string)
 AS `product_link`
  , `farfetch_product_guid` AS `_raw_farfetch_product_guid`
  , `size_scale_mapping_id` AS `_raw_size_scale_mapping_id`
  , `size_scale_mapping_status` AS `_raw_size_scale_mapping_status`
  , `pricing_method` AS `_raw_pricing_method`
  , `ff_state` AS `_raw_ff_state`
  , `is_hazmat` AS `_raw_is_hazmat`
  , `_synched_from_source_at` AS `_raw__synched_from_source_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_product`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `sg_farfetch_product_id` AS `sg_farfetch_product_id`
  , `configurable_product_id` AS `configurable_product_id`
  , `fps_parent_product_id` AS `fps_parent_product_id`
  , `sg_size_scale_id` AS `sg_size_scale_id`
  , `type` AS `type`
  , `original_price` AS `original_price`
  , `price` AS `price`
  , `fps_gender_id` AS `fps_gender_id`
  , `category_id` AS `category_id`
  , `sec_level_cat` AS `sec_level_cat`
  , `fps_size_scale_id` AS `fps_size_scale_id`
  , `fps_store_sku` AS `fps_store_sku`
  , `manufacturer_sku` AS `manufacturer_sku`
  , `x3_product_type` AS `x3_product_type`
  , `box` AS `box`
  , `materials` AS `materials`
  , `collection` AS `collection`
  , `fps_brand_id` AS `fps_brand_id`
  , `brand_options` AS `brand_options`
  , `pbs_csv_enabled` AS `pbs_csv_enabled`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `name` AS `name`
  , `description` AS `description`
  , `short_description` AS `short_description`
  , `color` AS `color`
  , `nth_cheapest_price` AS `nth_cheapest_price`
  , `pricing_algorithm` AS `pricing_algorithm`
  , `country_of_origin` AS `country_of_origin`
  , `slot_id` AS `slot_id`
  , `material_id` AS `material_id`
  , `season` AS `season`
  , `product_link` AS `product_link`
  , `_raw_farfetch_product_guid` AS `_raw_farfetch_product_guid`
  , `_raw_size_scale_mapping_id` AS `_raw_size_scale_mapping_id`
  , `_raw_size_scale_mapping_status` AS `_raw_size_scale_mapping_status`
  , `_raw_pricing_method` AS `_raw_pricing_method`
  , `_raw_ff_state` AS `_raw_ff_state`
  , `_raw_is_hazmat` AS `_raw_is_hazmat`
  , `_raw__synched_from_source_at` AS `_raw__synched_from_source_at`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final ;

