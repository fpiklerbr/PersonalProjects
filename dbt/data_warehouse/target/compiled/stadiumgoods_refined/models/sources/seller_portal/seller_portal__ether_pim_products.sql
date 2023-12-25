



    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_pim_product_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`name` AS string)), '') AS string) END as string)
 AS `product_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`nickname` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`nickname` AS string)), '') AS string) END as string)
 AS `nickname`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sgp` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sgp` AS string)), '') AS string) END as string)
 AS `product_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`manufacturer_sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`manufacturer_sku` AS string)), '') AS string) END as string)
 AS `mfg_sku`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`eu_manufacturer_sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`eu_manufacturer_sku` AS string)), '') AS string) END as string)
 AS `eu_manufacturer_sku`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`release_date` AS string)), '') AS string) IN ('1753-01-01','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`release_date` AS string)), '') AS string) END as timestamp)
 as date)
 AS `release_date`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as float64)
 as int64)
 AS `product_status`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`colorway` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`colorway` AS string)), '') AS string) END as string)
 AS `colorway`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`primary_color_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`primary_color_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `primary_ether_pim_product_color_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`secondary_color_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`secondary_color_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `secondary_ether_pim_product_color_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`brand_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`brand_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_pim_product_brand_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`type_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`type_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_pim_product_type_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`category_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`category_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_pim_product_category_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`country_of_origin_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`country_of_origin_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_pim_product_country_of_origin_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gender_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gender_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_pim_product_gender_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_code_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_code_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_pim_tax_code_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tariff_schedule_code_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tariff_schedule_code_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_pim_tariff_schedule_code_id`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`x3_category_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`x3_category_code` AS string)), '') AS string) END as string)
 AS `item_category_code`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`last_modified_in_x3_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`last_modified_in_x3_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `last_modified_in_x3_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`indexed_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`indexed_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `indexed_at`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`intake_enabled` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`intake_enabled` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`intake_enabled` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`intake_enabled` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `intake_is_enabled`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`retail_price_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`retail_price_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `retail_price`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`retail_price_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`retail_price_currency` AS string)), '') AS string) END as string)
 AS `retail_price_currency`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`farfetch_product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`farfetch_product_id` AS string)), '') AS string) END as string)
 AS `ff_product_id`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`locked_for_x3_update_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`locked_for_x3_update_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `locked_for_x3_update_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) END as float64)
 as int64)
 AS `lock_version`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`images_count` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`images_count` AS string)), '') AS string) END as float64)
 as int64)
 AS `images_count`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`hazardous` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`hazardous` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`hazardous` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`hazardous` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `is_hazardous`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`manufacturer_sku_token` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`manufacturer_sku_token` AS string)), '') AS string) END as string)
 AS `manufacturer_sku_token`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sales_channels` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sales_channels` AS string)), '') AS string) END as string)
 AS `sales_channels`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`first_intaken_by_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`first_intaken_by_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `first_intaken_by_employee_id`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`first_intaken_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`first_intaken_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `first_intaken_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
  , `eu_manufacturer_sku_token` AS `_raw_eu_manufacturer_sku_token`
  , `first_intaken_at_warehouse_code` AS `_raw_first_intaken_at_warehouse_code`
  , `threat_score` AS `_raw_threat_score`
  , `threat_score_comments` AS `_raw_threat_score_comments`
  , `onport_enabled` AS `_raw_onport_enabled`
  , `created_by_id` AS `_raw_created_by_id`
  , `rfid_enabled` AS `_raw_rfid_enabled`
  , `size_scale_id` AS `_raw_size_scale_id`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_products`

WHERE 1=1
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast(product_number || '|' || mfg_sku as string)
 AS `configurable_sku`
FROM layer_0
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `ether_pim_product_id` AS `ether_pim_product_id`
  , `product_name` AS `product_name`
  , `nickname` AS `nickname`
  , `product_number` AS `product_number`
  , `mfg_sku` AS `mfg_sku`
  , `configurable_sku` AS `configurable_sku`
  , `eu_manufacturer_sku` AS `eu_manufacturer_sku`
  , `release_date` AS `release_date`
  , `product_status` AS `product_status`
  , `colorway` AS `colorway`
  , `primary_ether_pim_product_color_id` AS `primary_ether_pim_product_color_id`
  , `secondary_ether_pim_product_color_id` AS `secondary_ether_pim_product_color_id`
  , `ether_pim_product_brand_id` AS `ether_pim_product_brand_id`
  , `ether_pim_product_type_id` AS `ether_pim_product_type_id`
  , `ether_pim_product_category_id` AS `ether_pim_product_category_id`
  , `ether_pim_product_country_of_origin_id` AS `ether_pim_product_country_of_origin_id`
  , `ether_pim_product_gender_id` AS `ether_pim_product_gender_id`
  , `ether_pim_tax_code_id` AS `ether_pim_tax_code_id`
  , `ether_pim_tariff_schedule_code_id` AS `ether_pim_tariff_schedule_code_id`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `item_category_code` AS `item_category_code`
  , `last_modified_in_x3_at` AS `last_modified_in_x3_at`
  , `indexed_at` AS `indexed_at`
  , `intake_is_enabled` AS `intake_is_enabled`
  , `retail_price` AS `retail_price`
  , `retail_price_currency` AS `retail_price_currency`
  , `ff_product_id` AS `ff_product_id`
  , `locked_for_x3_update_at` AS `locked_for_x3_update_at`
  , `lock_version` AS `lock_version`
  , `images_count` AS `images_count`
  , `is_hazardous` AS `is_hazardous`
  , `manufacturer_sku_token` AS `manufacturer_sku_token`
  , `sales_channels` AS `sales_channels`
  , `first_intaken_by_employee_id` AS `first_intaken_by_employee_id`
  , `first_intaken_at` AS `first_intaken_at`
  , `_synched_from_source_at` AS `_synched_from_source_at`
  , `_raw_eu_manufacturer_sku_token` AS `_raw_eu_manufacturer_sku_token`
  , `_raw_first_intaken_at_warehouse_code` AS `_raw_first_intaken_at_warehouse_code`
  , `_raw_threat_score` AS `_raw_threat_score`
  , `_raw_threat_score_comments` AS `_raw_threat_score_comments`
  , `_raw_onport_enabled` AS `_raw_onport_enabled`
  , `_raw_created_by_id` AS `_raw_created_by_id`
  , `_raw_rfid_enabled` AS `_raw_rfid_enabled`
  , `_raw_size_scale_id` AS `_raw_size_scale_id`
FROM layer_1
WHERE 1=1
                     ) SELECT * FROM final 