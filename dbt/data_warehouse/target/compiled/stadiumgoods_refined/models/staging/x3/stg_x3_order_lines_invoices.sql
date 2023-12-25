

SELECT
    invoice_detail.x3_order_id
  , invoice_detail.x3_order_line
  , invoice_detail.invoice_id
  , invoice_detail.invoice_line
FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__sinvoiced` AS invoice_detail
INNER JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_orders` AS x3_orders
  ON invoice_detail.invoice_id = x3_orders.last_invoice_id
  AND invoice_detail.x3_order_id = x3_orders.x3_order_id