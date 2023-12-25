SELECT
    orders.`ether_oms_order_id`,
  orders.`ether_order_number`,
  orders.`order_type`,
  orders.`order_date`,
  orders.`customer_email`,
  orders.`ecommerce_order_status`,
  orders.`sales_channel_order_id`,
  orders.`delivery_status`,
  orders.`hold_status`,
  orders.`shipping_name`,
  orders.`shipping_phone`,
  orders.`shipping_address_line_1`,
  orders.`shipping_address_line_2`,
  orders.`shipping_city`,
  orders.`shipping_region_name`,
  orders.`shipping_region_code`,
  orders.`shipping_region`,
  orders.`shipping_postcode`,
  orders.`shipping_country_name`,
  orders.`shipping_country_code`,
  orders.`shipping_country`,
  orders.`billing_name`,
  orders.`billing_address_line_1`,
  orders.`billing_address_line_2`,
  orders.`billing_city`,
  orders.`billing_region_name`,
  orders.`billing_postcode`,
  orders.`billing_country_name`,
  orders.`order_ship_date`,
  orders.`order_status`,
  orders.`sla_fulfillment_deadline`,
  orders.`ecommerce_customer_id`,
  orders.`lock_version`,
  orders.`is_exception`,
  orders.`is_vip`,
  orders.`reallocation_is_escalated`,
  orders.`locked_for_fulfillment_at`,
  orders.`billing_region_code`,
  orders.`billing_country_code`,
  orders.`ecommerce_shipping_method`,
  orders.`ecommerce_discount_code`,
  orders.`sent_to_farfetch_at`,
  orders.`tax_source`,
  orders.`tax_adjustment_base_amount`,
  orders.`discount_adjustment_base_amount`,
  orders.`base_currency`,
  orders.`shipping_adjustment_base_amount`,
  orders.`_raw_placed_at`,
  orders.`shipping_address`,
  orders.`ecommerce_sales_channel`,
  orders.`sales_channel_code`,
  orders.`order_channel`,
  orders.`created_by_employee_id`,
  orders.`created_by_employee_name`,
  orders.`ecommerce_order_id`,
  orders.`ecommerce_order_prefix`,
  orders.`ecommerce_order_regex`,
  orders.`mag_order_id_type`

  , orders.carrier_code AS order_carrier_code

  , orders.delivery_method_code AS order_delivery_method_code

  , orders.shipping_description AS order_shipping_description

  , orders.total_qty AS order_total_qty

  , orders.shipped_qty AS order_shipped_qty

  , orders.closed_qty AS order_closed_qty

  , orders.shortage_qty AS order_shortage_qty

  , orders.active_qty AS order_active_qty

  , orders.shipping_price_base_amount AS order_shipping_price_base_amount

  , orders.shipping_tax_base_amount AS order_shipping_tax_base_amount

  , orders.shipping_discount_base_amount AS order_shipping_discount_base_amount

  , orders.total_payment_base_amount AS order_total_payment_base_amount

  , orders.total_credit_base_amount AS order_total_credit_base_amount

  , orders.total_refunded_base_amount AS order_total_refunded_base_amount

  , orders.credit_refunded_base_amount AS order_credit_refunded_base_amount

  , orders.total_invoiced_base_amount AS order_total_invoiced_base_amount

  , orders.allocation_status AS order_allocation_status

  , orders.fulfillment_channel AS order_fulfillment_channel

  , orders.fulfillment_blocked_at AS order_fulfillment_blocked_at

  , orders.locked_for_x3_update_at AS order_locked_for_x3_update_at

  , orders.created_at AS order_created_at

  , orders.updated_at AS order_updated_at

  , orders.is_hazardous AS order_is_hazardous

  , orders.source_updated_at AS order_source_updated_at

  , orders._synched_from_source_at AS order__synched_from_source_at

  , order_item_allocations.`ether_oms_order_item_id`,
  order_item_allocations.`ether_order_item_line_number`,
  order_item_allocations.`order_item_status`,
  order_item_allocations.`product_name`,
  order_item_allocations.`mfg_sku`,
  order_item_allocations.`product_number`,
  order_item_allocations.`simple_sku`,
  order_item_allocations.`item_price_base_amount`,
  order_item_allocations.`item_tax_base_amount`,
  order_item_allocations.`external_identifier`,
  order_item_allocations.`size_code`,
  order_item_allocations.`variant_number`,
  order_item_allocations.`returned_at`,
  order_item_allocations.`inventory_unit_price_base_amount`,
  order_item_allocations.`item_discount_base_amount`,
  order_item_allocations.`cancel_reason`,
  order_item_allocations.`external_line_number`,
  order_item_allocations.`_raw_created_in_x3_at`,
  order_item_allocations.`_raw_last_modified_in_x3_at`,
  order_item_allocations.`order_item_serial`,
  order_item_allocations.`order_item_dss_item_id`,
  order_item_allocations.`order_item_variant_size`,
  order_item_allocations.`order_item_is_hazardous`,
  order_item_allocations.`order_item_warehouse_code`,
  order_item_allocations.`order_item_fulfillment_status`,
  order_item_allocations.`order_item_created_at`,
  order_item_allocations.`order_item_updated_at`,
  order_item_allocations.`order_item_source_updated_at`,
  order_item_allocations.`order_item__synched_from_source_at`,
  order_item_allocations.`ether_wms_allocation_id`,
  order_item_allocations.`fulfillment_number`,
  order_item_allocations.`allocation_line_number`,
  order_item_allocations.`x3_order_id`,
  order_item_allocations.`x3_order_line`,
  order_item_allocations.`allocation_state`,
  order_item_allocations.`reallocation_reason`,
  order_item_allocations.`previous_ether_wms_allocation_id`,
  order_item_allocations.`employee_id`,
  order_item_allocations.`ether_wms_product_variant_id`,
  order_item_allocations.`failure_reason`,
  order_item_allocations.`ether_allocation_number`,
  order_item_allocations.`allocation_price_base_amount`,
  order_item_allocations.`allocation_is_hazardous`,
  order_item_allocations.`allocation_created_at`,
  order_item_allocations.`allocation_updated_at`,
  order_item_allocations.`allocation_lock_version`,
  order_item_allocations.`allocation__synched_from_source_at`,
  order_item_allocations.`ether_wms_fulfillment_id`,
  order_item_allocations.`delivery_strategy`,
  order_item_allocations.`fulfillment_channel`,
  order_item_allocations.`sla_deadline`,
  order_item_allocations.`fulfillment_order_type`,
  order_item_allocations.`bill_name`,
  order_item_allocations.`bill_address1`,
  order_item_allocations.`bill_address2`,
  order_item_allocations.`bill_city`,
  order_item_allocations.`bill_region_code`,
  order_item_allocations.`bill_postal`,
  order_item_allocations.`ship_name`,
  order_item_allocations.`ship_phone`,
  order_item_allocations.`ship_address1`,
  order_item_allocations.`ship_address2`,
  order_item_allocations.`ship_city`,
  order_item_allocations.`ship_region_code`,
  order_item_allocations.`ship_postal`,
  order_item_allocations.`ship_region_id`,
  order_item_allocations.`bill_region_id`,
  order_item_allocations.`ship_country_id`,
  order_item_allocations.`bill_country_id`,
  order_item_allocations.`is_on_hold`,
  order_item_allocations.`lp_order_code`,
  order_item_allocations.`recipient_email`,
  order_item_allocations.`_raw_exported_to_warehouse_at`,
  order_item_allocations.`fulfillment_is_vip`,
  order_item_allocations.`fulfillment_sales_channel_code`,
  order_item_allocations.`fulfillment_warehouse_code`,
  order_item_allocations.`fulfillment_carrier_code`,
  order_item_allocations.`fulfillment_delivery_method_code`,
  order_item_allocations.`fulfillment_shipping_description`,
  order_item_allocations.`fulfillment_is_hazardous`,
  order_item_allocations.`fulfillment_started_at`,
  order_item_allocations.`fulfillment_fulfilled_at`,
  order_item_allocations.`fulfillment_cancelled_at`,
  order_item_allocations.`fulfillment_blocked_at`,
  order_item_allocations.`fulfillment_created_at`,
  order_item_allocations.`fulfillment_updated_at`,
  order_item_allocations.`fulfillment_lock_version`,
  order_item_allocations.`fulfillment_locked_for_x3_update_at`,
  order_item_allocations.`fulfillment__synched_from_source_at`,
  order_item_allocations.`ether_wms_pick_item_id`,
  order_item_allocations.`allocation_pick_item_priority`,
  order_item_allocations.`pick_item_status`,
  order_item_allocations.`pick_item_state`,
  order_item_allocations.`picking_number`,
  order_item_allocations.`ether_should_send_to_3pl`,
  order_item_allocations.`fulfill_in_batch`,
  order_item_allocations.`shipped_inventory_unit_label_number`,
  order_item_allocations.`pick_item_employee_id`,
  order_item_allocations.`pick_item_shipped_by_employee_id`,
  order_item_allocations.`pick_item_created_at`,
  order_item_allocations.`pick_item_updated_at`,
  order_item_allocations.`pick_item_lock_version`,
  order_item_allocations.`pick_item__synched_from_source_at`,
  order_item_allocations.`ether_wms_shipment_id`,
  order_item_allocations.`shipment_status`,
  order_item_allocations.`tracking_number`,
  order_item_allocations.`shipment_number`,
  order_item_allocations.`tracking_url`,
  order_item_allocations.`estimated_delivery_at`,
  order_item_allocations.`shipment_confirmed_at`,
  order_item_allocations.`manifest_is_needed`,
  order_item_allocations.`ether_wms_shipment_manifest_id`,
  order_item_allocations.`customer_name`,
  order_item_allocations.`address_line_1`,
  order_item_allocations.`address_line_2`,
  order_item_allocations.`city`,
  order_item_allocations.`region_code`,
  order_item_allocations.`postcode`,
  order_item_allocations.`country_code`,
  order_item_allocations.`customer_phone`,
  order_item_allocations.`_raw_label_status`,
  order_item_allocations.`shipment_warehouse_code`,
  order_item_allocations.`shipment_created_by_employee_id`,
  order_item_allocations.`shipment_created_at`,
  order_item_allocations.`shipment_updated_at`,
  order_item_allocations.`shipment_lock_version`,
  order_item_allocations.`shipment__synched_from_source_at`,
  order_item_allocations.`zebra_ship_reference`,
  order_item_allocations.`allocation_serial`,
  order_item_allocations.`pick_item_shipped_serial`,
  order_item_allocations.`source_bundle_seller_serial_number`,
  order_item_allocations.`source_bundle_allocation_fulfilled_at`,
  order_item_allocations.`ether_allocated_serial`,
  order_item_allocations.`ether_shipped_serial`,
  order_item_allocations.`x3_allocated_serial`,
  order_item_allocations.`x3_issued_serial`,
  order_item_allocations.`x3_returned_serial`,
  order_item_allocations.`x3_delivery_id`,
  order_item_allocations.`x3_delivery_line`,
  order_item_allocations.`x3_ship_date`,
  order_item_allocations.`x3_last_invoice_id`,
  order_item_allocations.`x3_last_invoice_line`,
  order_item_allocations.`x3_last_invoice_date`,
  order_item_allocations.`x3_return_id`,
  order_item_allocations.`x3_return_line`,
  order_item_allocations.`x3_return_date`,
  order_item_allocations.`allocated_serial`,
  order_item_allocations.`issued_serial`,
  order_item_allocations.`issued_at`,
  order_item_allocations.`issue_date`,
  order_item_allocations.`serial_allocation_priority`,
  order_item_allocations.`allocation_fulfillment_status`,
  order_item_allocations.`qty_delivered`,
  order_item_allocations.`delivery_flag`,
  order_item_allocations.`initial_ether_wms_allocation_id`,
  order_item_allocations.`initial_x3_order_id`,
  order_item_allocations.`initial_x3_order_line`,
  order_item_allocations.`initial_ether_order_number`,
  order_item_allocations.`initial_ether_order_item_line_number`,
  order_item_allocations.`initial_serial`,
  order_item_allocations.`dropship_source`,
  order_item_allocations.`dsco_item_id`,
  order_item_allocations.`initial_ecommerce_order_id`,
  order_item_allocations.`initial_external_identifier`,
  order_item_allocations.`mag_order_id`,
  order_item_allocations.`mag_order_item_id`,
  order_item_allocations.`qty_ordered`,
  order_item_allocations.`stadium_order_id`,
  order_item_allocations.`order_item_number`,
  order_item_allocations.`order_item_allocation_count`,
  order_item_allocations.`order_item_allocation_priority`

  , order_item_allocations.allocation_status AS order_item_allocation_status

  , rma_items.rma_number
  , rma_items.rma_created_at
  , rma_items.rma_updated_at
  , rma_items.return_reason
  , rma_items.return_condition
  , rma_items.rma_item_status
  , rma_items.rma_item_resolved_at
  , cast('Ether' AS string) data_source
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_order_item_allocations` AS order_item_allocations
INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_orders` AS orders
  ON order_item_allocations.ether_oms_order_id = orders.ether_oms_order_id 
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_rma_items` AS rma_items
  ON order_item_allocations.ether_oms_order_item_id = rma_items.ether_oms_order_item_id 
WHERE (
  order_item_allocations.fulfillment_channel <> 'dss'
  OR order_item_allocations.fulfillment_channel IS NULL
)
  AND (
    order_item_allocations.order_item_allocation_priority <= order_item_allocations.qty_ordered
    OR order_item_allocations.issued_serial IS NOT NULL
  )