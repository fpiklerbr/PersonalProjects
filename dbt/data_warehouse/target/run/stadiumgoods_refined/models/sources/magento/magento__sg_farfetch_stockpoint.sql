

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sg_farfetch_stockpoint`
  OPTIONS()
  as 

  

    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sg_farfetch_stockpoint_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stockpoint_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stockpoint_name` AS string)), '') AS string) END as string)
 AS `sg_farfetch_stockpoint_name`
  , CAST(NULL AS int64) AS `price_channel_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`warehouse_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`warehouse_id` AS string)), '') AS string) END as string)
 AS `warehouse_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`integration_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`integration_type` AS string)), '') AS string) END as string)
 AS `integration_type`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`inventory_sync` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`inventory_sync` AS string)), '') AS string) END as float64)
 as int64)
 AS `inventory_sync`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`safekey` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`safekey` AS string)), '') AS string) END as string)
 AS `api_key`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`farfetch_merchant_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`farfetch_merchant_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sg_farfetch_merchant_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_default_for_merchant` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_default_for_merchant` AS string)), '') AS string) END as float64)
 as int64)
 AS `is_default_for_merchant`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ff_stockpoint_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ff_stockpoint_id` AS string)), '') AS string) END as string)
 AS `fps_stock_point_id`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_stockpoint`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `sg_farfetch_stockpoint_id` AS `sg_farfetch_stockpoint_id`
  , `sg_farfetch_stockpoint_name` AS `sg_farfetch_stockpoint_name`
  , `price_channel_id` AS `price_channel_id`
  , `warehouse_id` AS `warehouse_id`
  , `integration_type` AS `integration_type`
  , `inventory_sync` AS `inventory_sync`
  , `api_key` AS `api_key`
  , `sg_farfetch_merchant_id` AS `sg_farfetch_merchant_id`
  , `is_default_for_merchant` AS `is_default_for_merchant`
  , `fps_stock_point_id` AS `fps_stock_point_id`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `_synched_from_source_at` AS `_synched_from_source_at`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final ;

