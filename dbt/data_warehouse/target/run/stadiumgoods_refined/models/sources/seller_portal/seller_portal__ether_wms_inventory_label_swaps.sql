

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_inventory_label_swaps`
  OPTIONS()
  as 

    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_inventory_label_swaps_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`label_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`label_number` AS string)), '') AS string) END as string)
 AS `label_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`origin_serial_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`origin_serial_number` AS string)), '') AS string) END as string)
 AS `origin_serial_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`destination_serial_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`destination_serial_number` AS string)), '') AS string) END as string)
 AS `destination_serial_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`origin_warehouse_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`origin_warehouse_id` AS string)), '') AS string) END as string)
 AS `origin_warehouse_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`destination_warehouse_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`destination_warehouse_id` AS string)), '') AS string) END as string)
 AS `destination_warehouse_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reason` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reason` AS string)), '') AS string) END as string)
 AS `reason`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`swapped_at` AS string)), '') AS string) IN ('1900-01-01 00:00:00','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`swapped_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `swapped_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('1900-01-01 00:00:00','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('1900-01-01 00:00:00','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('1900-01-01 00:00:00','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `_synched_from_source_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_inventory_label_swaps`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `ether_wms_inventory_label_swaps_id` AS `ether_wms_inventory_label_swaps_id`
  , `label_number` AS `label_number`
  , `origin_serial_number` AS `origin_serial_number`
  , `destination_serial_number` AS `destination_serial_number`
  , `origin_warehouse_id` AS `origin_warehouse_id`
  , `destination_warehouse_id` AS `destination_warehouse_id`
  , `reason` AS `reason`
  , `swapped_at` AS `swapped_at`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `_synched_from_source_at` AS `_synched_from_source_at`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final ;

