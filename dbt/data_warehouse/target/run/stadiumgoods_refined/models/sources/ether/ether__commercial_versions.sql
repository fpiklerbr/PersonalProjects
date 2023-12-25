

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`ether__commercial_versions`
  OPTIONS()
  as 



    
                    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_commercial_version_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_type` AS string)), '') AS string) END as string)
 AS `object_type`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `object_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`event` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`event` AS string)), '') AS string) END as string)
 AS `action_type`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`whodunnit` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`whodunnit` AS string)), '') AS string) END as string)
 AS `whodunnit`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`object` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`object` AS string)), '') AS string) END as string)
 AS `previous_attributes`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`object_changes` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`object_changes` AS string)), '') AS string) END as string)
 AS `attribute_changes`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_versions`

WHERE 1=1
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast(CASE WHEN object_type = 'Ether::Commercial::PurchaseOrder' THEN object_id END as int64)
 AS `ether_commercial_purchase_order_id`
FROM layer_0
WHERE 1=1
                     ) , layer_2 AS ( 
                    SELECT
    *
  , 
    CAST(regexp_extract(whodunnit, 
  r'gid://stadium-goods/(.*?)/.*?$'
) AS string) AS `actor_type`
  , 
    CAST(regexp_extract(whodunnit, 
  r'gid://stadium-goods/.*?/(.*?)$'
) AS string) AS `actor_id`
FROM layer_1
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `ether_commercial_version_id` AS `ether_commercial_version_id`
  , `object_type` AS `object_type`
  , `object_id` AS `object_id`
  , `ether_commercial_purchase_order_id` AS `ether_commercial_purchase_order_id`
  , `action_type` AS `action_type`
  , `whodunnit` AS `whodunnit`
  , `actor_type` AS `actor_type`
  , `actor_id` AS `actor_id`
  , `previous_attributes` AS `previous_attributes`
  , `attribute_changes` AS `attribute_changes`
  , `created_at` AS `created_at`
  , `_synched_from_source_at` AS `_synched_from_source_at`
FROM layer_2
WHERE 1=1
                     ) SELECT * FROM final ;

