

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__products`
  OPTIONS()
  as 



    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `product_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`brand` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`brand` AS string)), '') AS string) END as string)
 AS `brand_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`name` AS string)), '') AS string) END as string)
 AS `product_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sku` AS string)), '') AS string) END as string)
 AS `mfg_sku`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`
  , 

    CASE 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as float64)
 as int64)

WHEN 0 THEN cast( 'pending' AS string)
WHEN 1 THEN cast( 'draft' AS string)
WHEN 2 THEN cast( 'approved' AS string)
WHEN 3 THEN cast( 'rejected' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END AS string)
END AS `product_status`
  , 

    CASE 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`source` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`source` AS string)), '') AS string) END as float64)
 as int64)

WHEN 0 THEN cast( 'admin' AS string)
WHEN 1 THEN cast( 'seller' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`source` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`source` AS string)), '') AS string) END AS string)
END AS `product_source`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price` AS string)), '') AS string) END as float64)
 AS `price`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`description` AS string)), '') AS string) END as string)
 AS `product_description`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gender` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gender` AS string)), '') AS string) END as string)
 AS `gender_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`color` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`color` AS string)), '') AS string) END as string)
 AS `colorway`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`size` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`size` AS string)), '') AS string) END as string)
 AS `variant_size`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`nickname` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`nickname` AS string)), '') AS string) END as string)
 AS `product_nickname`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`type` AS string)), '') AS string) END as string)
 AS `seller_portal_product_type`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_reference` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_reference` AS string)), '') AS string) END as string)
 AS `item_reference`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_type` AS string)), '') AS string) END as string)
 AS `product_type_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`category` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`category` AS string)), '') AS string) END as string)
 AS `product_category_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`country_region_of_origin` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`country_region_of_origin` AS string)), '') AS string) END as string)
 AS `country_of_origin_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`retail_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`retail_price` AS string)), '') AS string) END as numeric)
 AS `retail_price`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sgp` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sgp` AS string)), '') AS string) END as string)
 AS `product_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`manufacturer_sku_token` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`manufacturer_sku_token` AS string)), '') AS string) END as string)
 AS `manufacturer_sku_token`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`deleted_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`deleted_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `deleted_at`
  , `_synched_from_source_at` AS `_raw__synched_from_source_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`products`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `product_id` AS `product_id`
  , `brand_code` AS `brand_code`
  , `product_name` AS `product_name`
  , `mfg_sku` AS `mfg_sku`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `product_status` AS `product_status`
  , `product_source` AS `product_source`
  , `price` AS `price`
  , `product_description` AS `product_description`
  , `gender_code` AS `gender_code`
  , `colorway` AS `colorway`
  , `variant_size` AS `variant_size`
  , `product_nickname` AS `product_nickname`
  , `seller_portal_product_type` AS `seller_portal_product_type`
  , `item_reference` AS `item_reference`
  , `product_type_code` AS `product_type_code`
  , `product_category_code` AS `product_category_code`
  , `country_of_origin_code` AS `country_of_origin_code`
  , `retail_price` AS `retail_price`
  , `product_number` AS `product_number`
  , `manufacturer_sku_token` AS `manufacturer_sku_token`
  , `deleted_at` AS `deleted_at`
  , `_raw__synched_from_source_at` AS `_raw__synched_from_source_at`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final ;

