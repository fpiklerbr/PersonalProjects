

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_seller_portal_shipments`
  
  
  OPTIONS()
  as (
    SELECT
    shipments.*
  , warehouses.warehouse_code
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__shipments` AS shipments
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_warehouses` AS warehouses
  ON shipments.ether_wms_warehouse_id = warehouses.ether_wms_warehouse_id
  );
    