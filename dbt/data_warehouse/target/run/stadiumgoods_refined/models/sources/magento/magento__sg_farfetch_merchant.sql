

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sg_farfetch_merchant`
  OPTIONS()
  as 

    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sg_farfetch_merchant_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_id` AS string)), '') AS string) END as string)
 AS `primary_fps_stock_point_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`merchant_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`merchant_name` AS string)), '') AS string) END as string)
 AS `fps_merchant_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`merchant_safekey` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`merchant_safekey` AS string)), '') AS string) END as string)
 AS `merchant_api_key`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`currency_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`currency_code` AS string)), '') AS string) END as string)
 AS `base_currency`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`merchant_upcharge_percent` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`merchant_upcharge_percent` AS string)), '') AS string) END as numeric)
 AS `merchant_upcharge_percent`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`supply_channel` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`supply_channel` AS string)), '') AS string) END as string)
 AS `supply_channel`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
  , `created_at` AS `_raw_created_at`
  , `updated_at` AS `_raw_updated_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_merchant`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `sg_farfetch_merchant_id` AS `sg_farfetch_merchant_id`
  , `primary_fps_stock_point_id` AS `primary_fps_stock_point_id`
  , `fps_merchant_name` AS `fps_merchant_name`
  , `merchant_api_key` AS `merchant_api_key`
  , `base_currency` AS `base_currency`
  , `merchant_upcharge_percent` AS `merchant_upcharge_percent`
  , `supply_channel` AS `supply_channel`
  , `_synched_from_source_at` AS `_synched_from_source_at`
  , `_raw_created_at` AS `_raw_created_at`
  , `_raw_updated_at` AS `_raw_updated_at`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final ;

