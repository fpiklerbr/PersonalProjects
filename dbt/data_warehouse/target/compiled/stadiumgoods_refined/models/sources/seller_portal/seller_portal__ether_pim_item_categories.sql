



    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_pim_item_category_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`code` AS string)), '') AS string) END as string)
 AS `item_category_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`name` AS string)), '') AS string) END as string)
 AS `item_category`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`brand_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`brand_code` AS string)), '') AS string) END as string)
 AS `brand_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gender_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gender_code` AS string)), '') AS string) END as string)
 AS `gender_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`category_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`category_code` AS string)), '') AS string) END as string)
 AS `product_category_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`type_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`type_code` AS string)), '') AS string) END as string)
 AS `product_type_code`
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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`activated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`activated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `activated_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`last_modified_in_x3_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`last_modified_in_x3_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `last_modified_in_x3_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
  , `size_scale_id` AS `_raw_size_scale_id`
  , `primary_fps_web_category_id` AS `_raw_primary_fps_web_category_id`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_pim_item_categories`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `ether_pim_item_category_id` AS `ether_pim_item_category_id`
  , `item_category_code` AS `item_category_code`
  , `item_category` AS `item_category`
  , `brand_code` AS `brand_code`
  , `gender_code` AS `gender_code`
  , `product_category_code` AS `product_category_code`
  , `product_type_code` AS `product_type_code`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `activated_at` AS `activated_at`
  , `last_modified_in_x3_at` AS `last_modified_in_x3_at`
  , `_synched_from_source_at` AS `_synched_from_source_at`
  , `_raw_size_scale_id` AS `_raw_size_scale_id`
  , `_raw_primary_fps_web_category_id` AS `_raw_primary_fps_web_category_id`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final 