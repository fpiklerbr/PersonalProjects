


WITH attr_changes AS (

  


  
  
  
  
  
  


SELECT
    *
  , 

    CASE 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`old_value` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`old_value` AS string)), '') AS string) END as float64)
 as int64)

WHEN 0 THEN cast( 'A - Available' AS string)
WHEN 1 THEN cast( 'AC - Being Cheffed' AS string)
WHEN 2 THEN cast( 'Q - Quarantine' AS string)
WHEN 3 THEN cast( 'RW - Requested Withdrawal' AS string)
WHEN 4 THEN cast( 'R - Rejected' AS string)
WHEN 5 THEN cast( 'A1 - Being Cheffed' AS string)
WHEN 6 THEN cast( 'A2 - Remove From Web' AS string)
WHEN 7 THEN cast( 'A3 - In Photos' AS string)
WHEN 8 THEN cast( 'AD - Item On display' AS string)
WHEN 9 THEN cast( 'AZ - FBA Preparation' AS string)
WHEN 10 THEN cast( 'Q1 - Hidden' AS string)
WHEN 11 THEN cast( 'A4 - Photos' AS string)
WHEN 12 THEN cast( 'No Status' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`old_value` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`old_value` AS string)), '') AS string) END AS string)
END AS `previous_stock_status_label`
  , 

    CASE 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`new_value` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`new_value` AS string)), '') AS string) END as float64)
 as int64)

WHEN 0 THEN cast( 'A - Available' AS string)
WHEN 1 THEN cast( 'AC - Being Cheffed' AS string)
WHEN 2 THEN cast( 'Q - Quarantine' AS string)
WHEN 3 THEN cast( 'RW - Requested Withdrawal' AS string)
WHEN 4 THEN cast( 'R - Rejected' AS string)
WHEN 5 THEN cast( 'A1 - Being Cheffed' AS string)
WHEN 6 THEN cast( 'A2 - Remove From Web' AS string)
WHEN 7 THEN cast( 'A3 - In Photos' AS string)
WHEN 8 THEN cast( 'AD - Item On display' AS string)
WHEN 9 THEN cast( 'AZ - FBA Preparation' AS string)
WHEN 10 THEN cast( 'Q1 - Hidden' AS string)
WHEN 11 THEN cast( 'A4 - Photos' AS string)
WHEN 12 THEN cast( 'No Status' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`new_value` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`new_value` AS string)), '') AS string) END AS string)
END AS `stock_status_label`
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_unit_attribute_changes`
WHERE attribute_name = 'stock_status'
  AND object_type = 'Ether::Wms::InventoryUnit'

  AND ether_wms_inventory_unit_version_id > (SELECT max(ether_wms_inventory_unit_version_id) FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_unit_stock_status_history`)




), joins AS (

  SELECT
    attr_changes.ether_wms_inventory_unit_version_id
  , attr_changes.ether_wms_inventory_unit_id
  , attr_changes.action_type
  , attr_changes.object_type
  , CAST(attr_changes.old_value AS int64) AS previous_stock_status_code
  , CAST(attr_changes.new_value AS int64) AS stock_status_code
  , attr_changes.created_at AS logged_at
  , attr_changes.user_id
  , attr_changes.employee_id
  FROM attr_changes

)

SELECT * FROM joins