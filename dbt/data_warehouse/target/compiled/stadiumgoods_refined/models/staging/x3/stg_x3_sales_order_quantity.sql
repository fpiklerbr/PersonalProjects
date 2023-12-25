

SELECT
    sorderq.x3_order_id
  , sorderq.x3_order_line
  , sorderq.sequence_number
  , sorderq.mag_order_item_id
  , sorderq.created_at
  , sorderq.qty_ordered
  , sorderq.serial_number AS order_serial
  , sorderq.qty_delivered
  , sorderq.delivery_id
  , sorderq.delivery_line
  , sorderq.invoice_flag_code
  , sorderq.invoice_flag
  , zebra_ship_references.zebra_ship_reference
FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__sorderq` AS sorderq
LEFT JOIN (
  SELECT DISTINCT
    zebra_ship_reference
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`link__tmall_order_id_to_zebra_ship_reference`
) AS zebra_ship_references
  ON sorderq.delivery_id = zebra_ship_references.zebra_ship_reference