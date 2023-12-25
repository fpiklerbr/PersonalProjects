

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`sales_channel_orders`
  
  
  OPTIONS()
  as (
    

SELECT
    imported_order.channel_order_id AS sales_channel_order_id
  , imported_order.channel AS sales_channel_order_channel
  , sales_flat_order.mag_order_id
  , sales_flat_order.channel AS mag_order_channel
  , current_timestamp rebuild_timestamp
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`sales_channel__imported_order` AS imported_order
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order` AS sales_flat_order
  ON imported_order.sales_flat_order_id = sales_flat_order.sales_flat_order_id
  );
    