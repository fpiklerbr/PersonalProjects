
        
    

    

    merge into `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_unit_warehouse_history` as DBT_INTERNAL_DEST
        using (
           

WITH attr_changes AS (

  


  
  
  
  
  
  


SELECT
    *
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`old_value` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`old_value` AS string)), '') AS string) END as float64)
 as int64)
 AS `previous_ether_wms_warehouse_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`new_value` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`new_value` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_warehouse_id`
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_unit_attribute_changes`
WHERE attribute_name = 'warehouse_id'
  AND object_type = 'Ether::Wms::InventoryUnit'

  AND ether_wms_inventory_unit_version_id > (SELECT max(ether_wms_inventory_unit_version_id) FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_unit_warehouse_history`)




), final AS (

  SELECT
    ether_wms_inventory_unit_version_id
  , ether_wms_inventory_unit_id
  , action_type
  , previous_ether_wms_warehouse_id
  , ether_wms_warehouse_id
  , created_at AS logged_at
  , employee_id
  , user_id
  FROM attr_changes

)

SELECT * FROM final
         ) as DBT_INTERNAL_SOURCE
        on FALSE

    

    when not matched then insert
        (`ether_wms_inventory_unit_version_id`, `ether_wms_inventory_unit_id`, `action_type`, `previous_ether_wms_warehouse_id`, `ether_wms_warehouse_id`, `logged_at`, `employee_id`, `user_id`)
    values
        (`ether_wms_inventory_unit_version_id`, `ether_wms_inventory_unit_id`, `action_type`, `previous_ether_wms_warehouse_id`, `ether_wms_warehouse_id`, `logged_at`, `employee_id`, `user_id`)


  