

  create or replace table `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_order_lines`
  
  
  OPTIONS()
  as (
    

SELECT
/* x3 order info */
    order_lines.x3_order_id
  , order_lines.order_type
  , order_lines.x3_order_status
  , order_lines.closes_line
  , order_lines.order_date
  , order_lines.order_creation_nyc
  , order_lines.order_channel
  , order_lines.order_total
  , order_lines.stadium_order_id
  , order_lines.serial_source
  , order_lines.order_total_serial_count
  , order_lines.order_total_line_count
  , order_lines.order_creation_user_id

  , order_lines.order_invoice_status
  , order_lines.last_invoice_date
  , order_lines.last_invoice_status
  , order_lines.last_invoice_id
  , order_lines.credit_status
  , order_lines.cash_payment

/* mag order info */
  , order_lines.ymagord
  , order_lines.mag_order_id
  , order_lines.mag_order_id_type
  , order_lines.mag_order_status

/* customer info */
  , order_lines.customer_id
  , order_lines.customer_email
  , order_lines.shipping_country
  , order_lines.shipping_region
  , order_lines.shipping_city
  , order_lines.shipping_postcode
  , order_lines.shipping_address
  , order_lines.order_shipping_description

/* item info */
  , order_lines.product_sku
  , order_lines.variant_size
  , order_lines.x3_order_line AS order_line
  , order_lines.created_at AS order_line_creation
  , order_lines.simple_sku
  , order_lines.x3_sku
  , order_lines.x3_size_code
  , order_lines.qty_ordered
  , order_lines.order_serial
  , order_lines.order_warehouse
  , order_lines.price
  , order_lines.shipping
  , order_lines.tax
  , order_lines.gift_card
  , order_lines.delivery_status
  , order_lines.qty_delivered
  , order_lines.delivery_id
  , order_lines.delivery_line
  , order_lines.allocation_status
  , order_lines.invoice_flag

/* item info */
  , coalesce(order_lines.mag_order_item_id, order_item.mag_order_item_id) AS order_item_id

/* allocation info */
  , order_allocation.allocation_type
  , order_allocation.allocated_serial

/* pick info */
  , prep_list.prep_list_id
  , prep_list.prep_list_line

/* delivery info */
  , delivery.delivery_warehouse
  , delivery.delivery_creation_nyc
  , delivery.delivery_shipping_description
  , delivery.ship_date
  , pack_detail.tracking_number
  , order_issue.issued_serial

/* return info (N.B. this only catches serials returned after issue date but before payout, and returned to consignor account) */
  , return_detail.return_id
  , return_detail.return_line
  , return_detail.return_creation_nyc
  , return_detail.returned_serial

/* invoice/credit/payment info */
  , invoice_detail.invoice_line AS last_invoice_line

/* creditmemo info */
  , creditmemo_lines.creditmemo_id
  , creditmemo_lines.creditmemo_creation_nyc
  , creditmemo_lines.creditmemo_total
  , creditmemo_lines.creditmemo_line
  , creditmemo_lines.creditmemo_line_price
  , creditmemo_lines.creditmemo_line_discount
  , creditmemo_lines.creditmemo_line_shipping
  , creditmemo_lines.creditmemo_line_tax
  , creditmemo_lines.creditmemo_line_gift_card

  , coalesce(
    
  CAST(regexp_extract(order_lines.order_serial , 
  r'^d.*?-[A-Z]{2}-([0-9]{10})-'
) AS string)

  , 
  CAST(regexp_extract(order_allocation.allocated_serial, 
  r'^d.*?-[A-Z]{2}-([0-9]{10})-'
) AS string)

  , 
  CAST(regexp_extract(order_issue.issued_serial, 
  r'^d.*?-[A-Z]{2}-([0-9]{10})-'
) AS string)

    ) AS dsco_item_id

  , coalesce(
        picks.zebra_ship_reference
      , order_lines.zebra_ship_reference
    ) AS zebra_ship_reference
  , picks.pick_id
  , picks.pick_line
  , picks.pick_creation_nyc
  , picks.pick_update_nyc
  , picks.delivery_flag
  , picks.lg_order_number
  , coalesce(
        picks.lg_order_number
      , picks.zebra_ship_reference
      , order_lines.zebra_ship_reference
    ) AS crossdock_reference
  , picks.tmall_b2c_ship_reference
  , row_number() OVER (
      PARTITION BY order_lines.stadium_order_id, order_lines.product_sku, order_lines.variant_size, order_lines.serial_source
      ORDER BY order_lines.x3_order_id, order_lines.x3_order_line
    ) AS order_sku_size_source_line
  , row_number() OVER (
      PARTITION BY order_lines.stadium_order_id, order_lines.simple_sku
      ORDER BY order_lines.x3_order_id, order_lines.x3_order_line
    ) AS order_simple_sku_line
  , order_lines.discount + order_lines.order_total_discount * coalesce(
        order_lines.price / nullif(sum(order_lines.price) OVER (PARTITION BY order_lines.x3_order_id), 0)
      , CAST(1 AS float64) / count(*) OVER (PARTITION BY order_lines.x3_order_id)
    ) AS discount
  , current_timestamp rebuild_timestamp

FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_order_lines_core` AS order_lines
LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`link__x3_order_line_to_mag_order_item_id` AS order_item
  ON order_lines.x3_order_id = order_item.x3_order_id
  AND order_lines.x3_order_line = order_item.x3_order_line
LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_order_lines_allocated_serials` AS order_allocation
  ON order_lines.x3_order_id = order_allocation.x3_order_id
  AND order_lines.x3_order_line = order_allocation.x3_order_line
LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_order_lines_issued_serials` AS order_issue
  ON order_lines.x3_order_id = order_issue.x3_order_id
  AND order_lines.x3_order_line = order_issue.x3_order_line
LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_order_lines_creditmemos` AS creditmemo_lines
  ON order_lines.x3_order_id = creditmemo_lines.x3_order_id
  AND order_lines.x3_order_line = creditmemo_lines.x3_order_line
LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_order_lines_prep_list` AS prep_list
  ON order_lines.x3_order_id = prep_list.x3_order_id
  AND order_lines.x3_order_line = prep_list.x3_order_line
LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_order_lines_invoices` AS invoice_detail
  ON order_lines.x3_order_id = invoice_detail.x3_order_id
  AND order_lines.x3_order_line = invoice_detail.x3_order_line
LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_order_lines_returns` AS return_detail
  ON order_lines.delivery_id = return_detail.delivery_id
  AND order_lines.delivery_line = return_detail.delivery_line
LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_order_lines_picks` AS picks
  ON order_lines.x3_order_id = picks.x3_order_id
  AND order_lines.x3_order_line = picks.x3_order_line
LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_deliveries` AS delivery
  ON order_lines.delivery_id = delivery.delivery_id
LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_order_lines_pack_detail` AS pack_detail
  ON order_lines.delivery_id = pack_detail.delivery_id
  AND order_lines.delivery_line = pack_detail.delivery_line
  );
    