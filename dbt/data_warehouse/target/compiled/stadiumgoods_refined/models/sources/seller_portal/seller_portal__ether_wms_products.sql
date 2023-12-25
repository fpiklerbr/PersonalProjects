



    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_product_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sgp` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sgp` AS string)), '') AS string) END as string)
 AS `product_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`name` AS string)), '') AS string) END as string)
 AS `product_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`manufacturer_sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`manufacturer_sku` AS string)), '') AS string) END as string)
 AS `mfg_sku`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`manufacturer_sku_token` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`manufacturer_sku_token` AS string)), '') AS string) END as string)
 AS `manufacturer_sku_token`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`type_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`type_name` AS string)), '') AS string) END as string)
 AS `attribute_set`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`brand_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`brand_name` AS string)), '') AS string) END as string)
 AS `brand`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gender_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gender_name` AS string)), '') AS string) END as string)
 AS `gender`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`category_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`category_name` AS string)), '') AS string) END as string)
 AS `category_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`colorway` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`colorway` AS string)), '') AS string) END as string)
 AS `colorway`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`hazardous` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`hazardous` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`hazardous` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`hazardous` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `is_hazardous`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tariff_schedule_code_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tariff_schedule_code_code` AS string)), '') AS string) END as string)
 AS `tariff_schedule_code_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`country_of_origin_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`country_of_origin_code` AS string)), '') AS string) END as string)
 AS `country_of_origin_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`nickname` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`nickname` AS string)), '') AS string) END as string)
 AS `nickname`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gender_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gender_code` AS string)), '') AS string) END as string)
 AS `gender_code`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`release_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`release_date` AS string)), '') AS string) END as timestamp)
 as date)
 AS `release_date`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
  , `brand_code` AS `_raw_brand_code`
  , `category_code` AS `_raw_category_code`
  , `type_code` AS `_raw_type_code`
  , `tax_code` AS `_raw_tax_code`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_products`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `ether_wms_product_id` AS `ether_wms_product_id`
  , `product_number` AS `product_number`
  , `product_name` AS `product_name`
  , `mfg_sku` AS `mfg_sku`
  , `manufacturer_sku_token` AS `manufacturer_sku_token`
  , `attribute_set` AS `attribute_set`
  , `brand` AS `brand`
  , `gender` AS `gender`
  , `category_name` AS `category_name`
  , `colorway` AS `colorway`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `is_hazardous` AS `is_hazardous`
  , `tariff_schedule_code_code` AS `tariff_schedule_code_code`
  , `country_of_origin_code` AS `country_of_origin_code`
  , `nickname` AS `nickname`
  , `gender_code` AS `gender_code`
  , `release_date` AS `release_date`
  , `_synched_from_source_at` AS `_synched_from_source_at`
  , `_raw_brand_code` AS `_raw_brand_code`
  , `_raw_category_code` AS `_raw_category_code`
  , `_raw_type_code` AS `_raw_type_code`
  , `_raw_tax_code` AS `_raw_tax_code`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final 