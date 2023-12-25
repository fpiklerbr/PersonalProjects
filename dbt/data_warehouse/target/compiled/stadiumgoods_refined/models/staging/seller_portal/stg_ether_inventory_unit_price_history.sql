


WITH attr_changes AS (

  


  
  
  
  
  
  


SELECT
    *
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`old_value` AS string)), '') AS string) IN ('0','0.0','nan','None','','NaT','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`old_value` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `previous_price_base_amount`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`new_value` AS string)), '') AS string) IN ('0','0.0','nan','None','','NaT','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`new_value` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `price_base_amount`
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_unit_attribute_changes`
WHERE attribute_name = 'price_cents'
  AND object_type = 'Ether::Wms::InventoryUnit'

  AND ether_wms_inventory_unit_version_id > (SELECT max(ether_wms_inventory_unit_version_id) FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_unit_price_history`)




), joins AS (

  SELECT
    attr_changes.ether_wms_inventory_unit_version_id
  , attr_changes.ether_wms_inventory_unit_id
  , inventory_units.serial_number
  , attr_changes.action_type
  , attr_changes.object_type
  , attr_changes.previous_price_base_amount
  , attr_changes.price_base_amount
  , attr_changes.created_at AS valid_from
  , safe_cast(datetime(safe_cast(attr_changes.created_at AS timestamp), 'America/New_York') AS date) AS action_date
  , attr_changes.user_id
  , attr_changes.employee_id
  FROM attr_changes
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_inventory_units` AS inventory_units
   ON attr_changes.ether_wms_inventory_unit_id =  inventory_units.ether_wms_inventory_unit_id

)

SELECT * FROM joins