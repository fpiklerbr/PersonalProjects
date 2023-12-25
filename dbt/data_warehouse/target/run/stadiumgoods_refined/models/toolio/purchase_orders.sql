

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_toolio`.`purchase_orders`
  
  
  OPTIONS()
  as (
    



  SELECT DISTINCT
    po.purchase_order_number AS po_number
  , po.ether_commercial_purchase_order_line_item_id AS po_line_id
  , COALESCE(po.simple_sku
      ,  substr(
    concat(
    
      coalesce(po.mfg_sku|| '|' , '')
    
      , coalesce(po.size|| '|' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(po.mfg_sku|| '|' , '')
    
      , coalesce(po.size|| '|' , '')
    
  )) - length('|')
      , 0
    )
)
      ) AS variant_id
  , po.delivery_warehouse AS location
  , po.po_creation_date AS order_date
  , po.estimated_arrival_date AS due_date
  , po.expected_quantity AS order_units
  , po.cost AS unit_cost
  , po.price AS unit_ticket
  , po.serial_inventory AS FOB
  , po.business_entity AS BE
  , CASE WHEN po.purchase_order_status IN ('closed', 'cancelled') THEN 'inactive'
    ELSE 'active'
    END AS status
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_purchase_order_lines` AS po
  );
    