

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_pick_items`
  OPTIONS()
  as 



    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_pick_item_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`allocation_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`allocation_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_allocation_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`employee_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`employee_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `employee_id`
  , 

    CASE 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as float64)
 as int64)

WHEN 0 THEN cast( 'pending' AS string)
WHEN 1 THEN cast( 'missing' AS string)
WHEN 2 THEN cast( 'picked' AS string)
WHEN 3 THEN cast( 'packed' AS string)
WHEN 4 THEN cast( 'cancelled' AS string)
WHEN 5 THEN cast( 'sent_to_3pl' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END AS string)
END AS `pick_item_status`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) END as float64)
 as int64)
 AS `lock_version`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sla_deadline` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sla_deadline` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `sla_deadline`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`picking_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`picking_number` AS string)), '') AS string) END as string)
 AS `picking_number`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_shipment_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipped_by_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipped_by_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `shipped_by_employee_id`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`ether_should_send_to_3pl` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ether_should_send_to_3pl` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`ether_should_send_to_3pl` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ether_should_send_to_3pl` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `ether_should_send_to_3pl`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`fulfill_in_batch` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fulfill_in_batch` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`fulfill_in_batch` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fulfill_in_batch` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `fulfill_in_batch`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipped_serial` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipped_serial` AS string)), '') AS string) END as string)
 AS `shipped_inventory_unit_label_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_pick_items`

WHERE 1=1
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast(CASE
WHEN pick_item_status IN ('picked', 'packed') THEN 'valid'
WHEN pick_item_status IN ('pending', 'sent_to_3pl') THEN 'pending'
WHEN pick_item_status IN ('missing', 'cancelled') THEN 'invalid'
END as string)
 AS `pick_item_state`
FROM layer_0
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `ether_wms_pick_item_id` AS `ether_wms_pick_item_id`
  , `ether_wms_allocation_id` AS `ether_wms_allocation_id`
  , `employee_id` AS `employee_id`
  , `pick_item_status` AS `pick_item_status`
  , `pick_item_state` AS `pick_item_state`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `lock_version` AS `lock_version`
  , `picking_number` AS `picking_number`
  , `ether_wms_shipment_id` AS `ether_wms_shipment_id`
  , `shipped_by_employee_id` AS `shipped_by_employee_id`
  , `ether_should_send_to_3pl` AS `ether_should_send_to_3pl`
  , `fulfill_in_batch` AS `fulfill_in_batch`
  , `shipped_inventory_unit_label_number` AS `shipped_inventory_unit_label_number`
  , `_synched_from_source_at` AS `_synched_from_source_at`
FROM layer_1
WHERE 1=1
                     ) SELECT * FROM final ;

