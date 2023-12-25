


  
  
  
  
  
  


SELECT
    *
  , 

    CASE 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`old_value` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`old_value` AS string)), '') AS string) END as float64)
 as int64)

WHEN 0 THEN cast( 'in_stock' AS string)
WHEN 1 THEN cast( 'in_stock_allocated' AS string)
WHEN 2 THEN cast( 'in_transit' AS string)
WHEN 3 THEN cast( 'requested_withdrawal' AS string)
WHEN 4 THEN cast( 'review' AS string)
WHEN 5 THEN cast( 'sold_pos' AS string)
WHEN 6 THEN cast( 'sold_web' AS string)
WHEN 7 THEN cast( 'withdrawn' AS string)
WHEN 8 THEN cast( 'in_stock_allocated_transfer' AS string)
WHEN 9 THEN cast( 'quarantine' AS string)
WHEN 10 THEN cast( 'consignor_return' AS string)
WHEN 11 THEN cast( 'rejected' AS string)
WHEN 12 THEN cast( 'returned' AS string)
WHEN 13 THEN cast( 'draft' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`old_value` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`old_value` AS string)), '') AS string) END AS string)
END AS `previous_consignment_status`
  , 

    CASE 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`new_value` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`new_value` AS string)), '') AS string) END as float64)
 as int64)

WHEN 0 THEN cast( 'in_stock' AS string)
WHEN 1 THEN cast( 'in_stock_allocated' AS string)
WHEN 2 THEN cast( 'in_transit' AS string)
WHEN 3 THEN cast( 'requested_withdrawal' AS string)
WHEN 4 THEN cast( 'review' AS string)
WHEN 5 THEN cast( 'sold_pos' AS string)
WHEN 6 THEN cast( 'sold_web' AS string)
WHEN 7 THEN cast( 'withdrawn' AS string)
WHEN 8 THEN cast( 'in_stock_allocated_transfer' AS string)
WHEN 9 THEN cast( 'quarantine' AS string)
WHEN 10 THEN cast( 'consignor_return' AS string)
WHEN 11 THEN cast( 'rejected' AS string)
WHEN 12 THEN cast( 'returned' AS string)
WHEN 13 THEN cast( 'draft' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`new_value` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`new_value` AS string)), '') AS string) END AS string)
END AS `consignment_status`
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_unit_attribute_changes`
WHERE attribute_name = 'consignor_status'
  AND object_type = 'Ether::Wms::InventoryUnit'

  AND ether_wms_inventory_unit_version_id > (SELECT max(ether_wms_inventory_unit_version_id) FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_unit_consignment_status_history`)


