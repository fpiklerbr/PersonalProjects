

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_toolio`.`receipts`
  
  
  OPTIONS()
  as (
    


  SELECT
    po.ether_commercial_purchase_order_line_item_id AS po_line_id
  , po.original_intake_id AS delivery_id
  , po.purchase_order_number AS po_number
  , po.simple_sku AS variant_id
  , po.delivery_warehouse AS location
  , po.original_intake_date AS delivery_date
  , COALESCE(nullif(po.received_quantity, 0), po.serial_count) AS received_units
-- todo:: need Ether side fix this bug, which is PO system cannot read every tix attached to one PO
  , po.cost AS unit_cost
  , po.price AS unit_ticket
  , po.serial_inventory AS FOB
  , po.business_entity AS BE
  , CASE WHEN po.purchase_order_status IN ('closed', 'cancelled') THEN 'inactive'
    ELSE 'active'
    END AS status
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_purchase_order_lines` AS po
  WHERE po.original_intake_id IS NOT NULL
  );
    