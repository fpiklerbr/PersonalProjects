

  create or replace table `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_order_lines_core`
  
  
  OPTIONS()
  as (
    

SELECT
/* x3 order info */
    x3.x3_order_id
  , x3.order_type
  , x3.x3_order_status
  , x3.closes_line
  , x3.order_date
  , x3.order_creation_nyc
  , x3.order_channel
  , x3.order_total
  , x3.stadium_order_id
  , CAST('X3' AS string) AS serial_source
  , x3.serial_count AS order_total_serial_count
  , x3.line_count AS order_total_line_count
  , x3.order_total_discount
  , x3.creation_user_id AS order_creation_user_id

  , x3.order_invoice_status
  , x3.last_invoice_date
  , x3.last_invoice_status
  , x3.last_invoice_id
  , x3.credit_status
  , x3.cash_payment

/* mag order info */
  , x3.ymagord
  , x3.mag_order_id
  , x3.mag_order_id_type
  , x3.mag_order_status

/* customer info */
  , x3.customer_id
  , x3.customer_email
  , x3.shipping_country
  , x3.shipping_region
  , x3.shipping_city
  , x3.shipping_postcode
  , x3.shipping_address
  , x3.order_shipping_description

/* item info */
  , sales_order_qty.x3_order_line
  , sales_order_qty.mag_order_item_id
  , sales_order_price.product_sku
  , sales_order_price.variant_size
  , sales_order_qty.created_at
  , sales_order_price.simple_sku
  , sales_order_price.x3_sku
  , sales_order_price.x3_size_code
  , sales_order_qty.qty_ordered
  , sales_order_qty.order_serial
  , sales_order_price.order_warehouse
  , sales_order_price.price
  , sales_order_price.shipping
  , sales_order_price.tax
  , sales_order_price.gift_card
  , sales_order_price.discount
  , x3.delivery_status
  , sales_order_qty.qty_delivered
  , sales_order_qty.delivery_id
  , sales_order_qty.delivery_line
  , x3.allocation_status
  , sales_order_qty.invoice_flag
  , sales_order_qty.zebra_ship_reference
FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_orders` AS x3
INNER JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_sales_order_quantity` AS sales_order_qty
  ON x3.x3_order_id = sales_order_qty.x3_order_id
INNER JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_sales_order_price` AS sales_order_price
  ON sales_order_qty.x3_order_id = sales_order_price.x3_order_id
  AND sales_order_qty.x3_order_line = sales_order_price.x3_order_line
  AND sales_order_qty.sequence_number = sales_order_price.sequence_number
  );
    