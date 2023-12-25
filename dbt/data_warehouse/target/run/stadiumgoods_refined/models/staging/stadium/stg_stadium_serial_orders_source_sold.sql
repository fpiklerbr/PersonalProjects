

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_serial_orders_source_sold`
  
  
  OPTIONS()
  as (
    SELECT
    source_order_item_lines.serial_number
  , source_order_item_lines.stadium_order_id
  , source_order_item_lines.order_creation_nyc
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_source_order_item_lines` AS source_order_item_lines
WHERE serial_order_match IS TRUE
  AND NOT EXISTS (
    SELECT *
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_serial_orders_ether_issued` AS ether_issued
    WHERE ether_issued.serial_number = source_order_item_lines.seller_serial_number
  )
  AND NOT EXISTS (
    SELECT *
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_serial_orders_yseristatus_issued` AS yseristatus_issued
    WHERE yseristatus_issued.serial_number = source_order_item_lines.seller_serial_number
  )
  AND NOT EXISTS (
    SELECT *
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_serial_orders_allocated_or_issued` AS matched_not_yseristatus_issued
    WHERE matched_not_yseristatus_issued.serial_number = source_order_item_lines.seller_serial_number
  )
  );
    