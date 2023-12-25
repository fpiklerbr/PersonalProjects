

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`tableau_serial_to_order`
  
  
  OPTIONS()
  as (
    

  SELECT
    stadium_order_lines.order_id
  , stadium_order_lines.order_creation_nyc
  , stadium_order_lines.simple_sku order_simple_sku
  , stadium_order_lines.price order_price
  , stadium_order_lines.channel
  , stadium_order_lines.mag_order_id
  , stadium_order_lines.mag_order_status
  , stadium_order_lines.external_order_id
  , stadium_order_lines.x3_order_id
  , stadium_order_lines.x3_order_status
  , stadium_order_lines.pick_id
  , stadium_order_lines.pick_creation_nyc
  , stadium_order_lines.delivery_id
  , stadium_order_lines.delivery_flag
  , stadium_order_lines.ship_date
  , stadium_order_lines.tracking_number
  , stadium_order_lines.last_invoice_id
  , stadium_order_lines.mag_rma_ids mag_rma_info
  , stadium_order_lines.mag_order_serial
  , stadium_order_lines.x3_order_serial
  , stadium_order_lines.allocated_serial
  , stadium_order_lines.issued_serial
  , stadium_serials.serial_number
  , stadium_serials.price serial_price
  , stadium_serials.simple_sku serial_simple_sku
  , stadium_serials.consignor_id
  , stadium_serials.yseristatus_issue_date
  , stadium_serials.yseristatus_paid_out_status
  , stadium_serials.yseristatus_consignment_status
  , (1 - stadium_serials.commission_rate) * stadium_serials.price payout_amount
  , stadium_serials.warehouse
  , stadium_serials.audit_status
  , stadium_serials.last_available_date
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_order_lines` AS stadium_order_lines
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials` AS stadium_serials
  ON stadium_serials.serial_number = stadium_order_lines.serial_number
  );
    