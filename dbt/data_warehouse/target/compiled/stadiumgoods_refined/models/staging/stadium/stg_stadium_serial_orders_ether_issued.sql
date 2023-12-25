SELECT
    order_items.allocated_serial AS serial_number
  , order_items.stadium_order_id
  , nullif(
     least(
      coalesce(mag_orders.order_creation_nyc, CAST('9999-12-31 23:59:59' AS datetime))
      ,coalesce(mag_orders.external_order_creation_nyc, CAST('9999-12-31 23:59:59' AS datetime))
      ,coalesce(safe_cast(datetime(safe_cast(order_items.order_created_at AS timestamp), 
  r'America/New_York'
) AS datetime), CAST('9999-12-31 23:59:59' AS datetime))
      ,coalesce(x3_orders.order_creation_nyc, CAST('9999-12-31 23:59:59' AS datetime))
      
      )
     , CAST('9999-12-31 23:59:59' AS datetime)
  ) AS order_creation_nyc
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_order_items` AS order_items
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_orders` AS mag_orders
  USING (mag_order_id)
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_x3_orders` AS x3_orders
  USING (x3_order_id)
WHERE order_items.serial_allocation_priority = 1
  AND order_items.issued_serial IS NOT NULL