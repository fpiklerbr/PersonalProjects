



    
                    
                    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_inventory_unit_version_id`
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

    
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`object` AS string)), '') AS string), 
  '$newline$'
, 
  '\n'
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`object` AS string)), '') AS string), 
  '$newline$'
, 
  '\n'
) END as string)
 AS `previous_attributes`
  , 

    
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`object_changes` AS string)), '') AS string), 
  '$newline$'
, 
  '\n'
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`object_changes` AS string)), '') AS string), 
  '$newline$'
, 
  '\n'
) END as string)
 AS `attribute_changes`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
  , `context` AS `_raw_context`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_inventory_unit_versions`

WHERE 1=1
AND 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 > (SELECT max(ether_wms_inventory_unit_version_id) FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_inventory_unit_versions`)
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast(CASE WHEN object_type = 'Ether::Wms::InventoryUnit' THEN object_id END as int64)
 AS `ether_wms_inventory_unit_id`
  , 
    safe_cast(CASE WHEN object_type = 'Ether::Wms::Allocation' THEN object_id END as int64)
 AS `ether_wms_allocation_id`
  , 
    safe_cast(CASE WHEN object_type = 'Ether::Wms::PickItem' THEN object_id END as int64)
 AS `ether_wms_pick_item_id`
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
                     ) , layer_3 AS ( 
                    SELECT
    *
  , 
    safe_cast(CASE WHEN actor_type IN ('User', 'Ether::Consignor') THEN actor_id END as int64)
 AS `user_id`
  , 
    safe_cast(CASE WHEN actor_type IN ('Ether::Employee') THEN actor_id END as int64)
 AS `employee_id`
FROM layer_2
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `ether_wms_inventory_unit_version_id` AS `ether_wms_inventory_unit_version_id`
  , `object_type` AS `object_type`
  , `object_id` AS `object_id`
  , `ether_wms_inventory_unit_id` AS `ether_wms_inventory_unit_id`
  , `ether_wms_allocation_id` AS `ether_wms_allocation_id`
  , `ether_wms_pick_item_id` AS `ether_wms_pick_item_id`
  , `action_type` AS `action_type`
  , `whodunnit` AS `whodunnit`
  , `actor_type` AS `actor_type`
  , `actor_id` AS `actor_id`
  , `user_id` AS `user_id`
  , `employee_id` AS `employee_id`
  , `previous_attributes` AS `previous_attributes`
  , `attribute_changes` AS `attribute_changes`
  , `created_at` AS `created_at`
  , `_synched_from_source_at` AS `_synched_from_source_at`
  , `_raw_context` AS `_raw_context`
FROM layer_3
WHERE 1=1
                     ) SELECT * FROM final 