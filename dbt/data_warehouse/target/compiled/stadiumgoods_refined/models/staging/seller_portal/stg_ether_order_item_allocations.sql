WITH order_item_allocations AS (

  SELECT
      order_items.ether_oms_order_item_id
    , order_items.ether_order_number
    , order_items.ether_order_item_line_number
    , order_items.`ether_oms_order_id`,
  order_items.`order_item_status`,
  order_items.`product_name`,
  order_items.`mfg_sku`,
  order_items.`product_number`,
  order_items.`simple_sku`,
  order_items.`item_price_base_amount`,
  order_items.`item_tax_base_amount`,
  order_items.`external_identifier`,
  order_items.`size_code`,
  order_items.`variant_number`,
  order_items.`returned_at`,
  order_items.`inventory_unit_price_base_amount`,
  order_items.`item_discount_base_amount`,
  order_items.`cancel_reason`,
  order_items.`external_line_number`,
  order_items.`_raw_created_in_x3_at`,
  order_items.`_raw_last_modified_in_x3_at`
    , order_items.serial_number AS order_item_serial
    , order_items.dss_item_id AS order_item_dss_item_id
    , order_items.variant_size AS order_item_variant_size
    , order_items.is_hazardous AS order_item_is_hazardous
    , order_items.warehouse_code AS order_item_warehouse_code
    , order_items.fulfillment_status AS order_item_fulfillment_status
    , order_items.created_at AS order_item_created_at
    , order_items.updated_at AS order_item_updated_at
    , order_items.source_updated_at AS order_item_source_updated_at
    , order_items._synched_from_source_at AS order_item__synched_from_source_at
    , allocations.ether_wms_allocation_id
    , allocations.fulfillment_number
    , allocations.allocation_line_number
    , allocations.`x3_order_id`,
  allocations.`x3_order_line`,
  allocations.`allocation_status`,
  allocations.`allocation_state`,
  allocations.`reallocation_reason`,
  allocations.`previous_ether_wms_allocation_id`,
  allocations.`employee_id`,
  allocations.`ether_wms_product_variant_id`,
  allocations.`failure_reason`,
  allocations.`ether_allocation_number`,
  allocations.`allocation_price_base_amount`,
  allocations.`allocation_is_hazardous`,
  allocations.`allocation_created_at`,
  allocations.`allocation_updated_at`,
  allocations.`allocation_lock_version`,
  allocations.`allocation__synched_from_source_at`,
  allocations.`ether_wms_fulfillment_id`,
  allocations.`delivery_strategy`,
  allocations.`fulfillment_channel`,
  allocations.`sla_deadline`,
  allocations.`fulfillment_order_type`,
  allocations.`bill_name`,
  allocations.`bill_address1`,
  allocations.`bill_address2`,
  allocations.`bill_city`,
  allocations.`bill_region_code`,
  allocations.`bill_postal`,
  allocations.`ship_name`,
  allocations.`ship_phone`,
  allocations.`ship_address1`,
  allocations.`ship_address2`,
  allocations.`ship_city`,
  allocations.`ship_region_code`,
  allocations.`ship_postal`,
  allocations.`ship_region_id`,
  allocations.`bill_region_id`,
  allocations.`ship_country_id`,
  allocations.`bill_country_id`,
  allocations.`is_on_hold`,
  allocations.`lp_order_code`,
  allocations.`recipient_email`,
  allocations.`_raw_exported_to_warehouse_at`,
  allocations.`fulfillment_is_vip`,
  allocations.`fulfillment_sales_channel_code`,
  allocations.`fulfillment_warehouse_code`,
  allocations.`fulfillment_carrier_code`,
  allocations.`fulfillment_delivery_method_code`,
  allocations.`fulfillment_shipping_description`,
  allocations.`fulfillment_is_hazardous`,
  allocations.`fulfillment_started_at`,
  allocations.`fulfillment_fulfilled_at`,
  allocations.`fulfillment_cancelled_at`,
  allocations.`fulfillment_blocked_at`,
  allocations.`fulfillment_created_at`,
  allocations.`fulfillment_updated_at`,
  allocations.`fulfillment_lock_version`,
  allocations.`fulfillment_locked_for_x3_update_at`,
  allocations.`fulfillment__synched_from_source_at`,
  allocations.`ether_wms_pick_item_id`,
  allocations.`allocation_pick_item_priority`,
  allocations.`pick_item_status`,
  allocations.`pick_item_state`,
  allocations.`picking_number`,
  allocations.`ether_should_send_to_3pl`,
  allocations.`fulfill_in_batch`,
  allocations.`shipped_inventory_unit_label_number`,
  allocations.`pick_item_employee_id`,
  allocations.`pick_item_shipped_by_employee_id`,
  allocations.`pick_item_created_at`,
  allocations.`pick_item_updated_at`,
  allocations.`pick_item_lock_version`,
  allocations.`pick_item__synched_from_source_at`,
  allocations.`ether_wms_shipment_id`,
  allocations.`shipment_status`,
  allocations.`tracking_number`,
  allocations.`shipment_number`,
  allocations.`tracking_url`,
  allocations.`estimated_delivery_at`,
  allocations.`shipment_confirmed_at`,
  allocations.`manifest_is_needed`,
  allocations.`ether_wms_shipment_manifest_id`,
  allocations.`customer_name`,
  allocations.`address_line_1`,
  allocations.`address_line_2`,
  allocations.`city`,
  allocations.`region_code`,
  allocations.`postcode`,
  allocations.`country_code`,
  allocations.`customer_phone`,
  allocations.`_raw_label_status`,
  allocations.`shipment_warehouse_code`,
  allocations.`shipment_created_by_employee_id`,
  allocations.`shipment_created_at`,
  allocations.`shipment_updated_at`,
  allocations.`shipment_lock_version`,
  allocations.`shipment__synched_from_source_at`,
  allocations.`zebra_ship_reference`,
  allocations.`allocation_serial`,
  allocations.`pick_item_shipped_serial`,
  allocations.`source_bundle_seller_serial_number`,
  allocations.`source_bundle_allocation_fulfilled_at`,
  allocations.`ether_allocated_serial`,
  allocations.`ether_shipped_serial`,
  allocations.`x3_allocated_serial`,
  allocations.`x3_issued_serial`,
  allocations.`x3_returned_serial`,
  allocations.`x3_delivery_id`,
  allocations.`x3_delivery_line`,
  allocations.`x3_ship_date`,
  allocations.`x3_last_invoice_id`,
  allocations.`x3_last_invoice_line`,
  allocations.`x3_last_invoice_date`,
  allocations.`x3_return_id`,
  allocations.`x3_return_line`,
  allocations.`x3_return_date`,
  allocations.`allocated_serial`,
  allocations.`issued_serial`,
  allocations.`issued_at`,
  allocations.`issue_date`,
  allocations.`serial_allocation_priority`
    , allocations.fulfillment_status AS allocation_fulfillment_status
    , CASE
        WHEN allocations.issued_serial IS NOT NULL
        THEN cast(1 AS int64)
        ELSE cast(0 AS int64)
      END AS qty_delivered
    , CASE
        WHEN allocations.issued_serial IS NOT NULL
          THEN cast('Delivered' AS string)
        WHEN allocations.ether_wms_shipment_id IS NOT NULL
          THEN cast('Deliverable' AS string)
        WHEN allocations.ether_wms_pick_item_id IS NOT NULL
          THEN cast('In process' AS string)
      END AS delivery_flag
    , allocations.initial_ether_wms_allocation_id
    , coalesce(initial_allocations.x3_order_id, allocations.x3_order_id) AS initial_x3_order_id
    , coalesce(initial_allocations.x3_order_line, allocations.x3_order_line) AS initial_x3_order_line
    , coalesce(
      initial_allocations.ether_order_number
    , order_items.ether_order_number
  ) AS initial_ether_order_number
    , coalesce(
      initial_allocations.ether_order_item_line_number
    , order_items.ether_order_item_line_number
  ) AS initial_ether_order_item_line_number
    , coalesce(initial_order_items.serial_number, order_items.serial_number) AS initial_serial
    , CASE
        WHEN initial_orders.fulfillment_channel = 'dss'
        THEN upper(left(coalesce(initial_order_items.serial_number, order_items.serial_number), 6))
      END AS dropship_source
    , coalesce(initial_order_items.dss_item_id, order_items.dss_item_id) AS dsco_item_id
    , initial_orders.ecommerce_order_id AS initial_ecommerce_order_id
    , coalesce(initial_order_items.external_identifier, order_items.external_identifier) AS initial_external_identifier
    , initial_orders.mag_order_id
    , CASE
    WHEN initial_orders.mag_order_id IS NOT NULL
    THEN coalesce(simple_order_items.order_item_id, configurable_order_items.order_item_id)
  END AS mag_order_item_id
    , coalesce(simple_order_items.item_qty_ordered, configurable_order_items.item_qty_ordered, 1) AS qty_ordered
    , coalesce(initial_orders.mag_order_id, coalesce(
      initial_allocations.ether_order_number
    , order_items.ether_order_number
  )) AS stadium_order_id
    , coalesce(
          initial_orders.mag_order_id || '-' || cast(CASE
    WHEN initial_orders.mag_order_id IS NOT NULL
    THEN coalesce(simple_order_items.order_item_id, configurable_order_items.order_item_id)
  END AS string)
        , coalesce(
      initial_allocations.ether_order_number
    , order_items.ether_order_number
  ) || '-' || cast(coalesce(
      initial_allocations.ether_order_item_line_number
    , order_items.ether_order_item_line_number
  ) AS string)
      ) AS order_item_number
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_oms_order_items` AS order_items
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_fulfillment_allocations` AS allocations
    ON order_items.ether_order_number = allocations.ether_order_number
    AND order_items.ether_order_item_line_number = allocations.ether_order_item_line_number
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_fulfillment_allocations` AS initial_allocations
    ON allocations.initial_ether_wms_allocation_id = initial_allocations.ether_wms_allocation_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_oms_order_items` AS initial_order_items
    ON initial_allocations.ether_order_number = initial_order_items.ether_order_number
    AND initial_allocations.ether_order_item_line_number = initial_order_items.ether_order_item_line_number
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_orders` AS initial_orders
    ON coalesce(
      initial_allocations.ether_order_number
    , order_items.ether_order_number
  ) = initial_orders.ether_order_number
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_order_items` AS simple_order_items
    ON coalesce(initial_order_items.external_identifier, order_items.external_identifier) = simple_order_items.simple_item_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_order_items` AS configurable_order_items
    ON coalesce(initial_order_items.external_identifier, order_items.external_identifier) = configurable_order_items.configurable_item_id

), final AS (

  SELECT
      *  
    , count(ether_wms_allocation_id) OVER (PARTITION BY order_item_number) AS order_item_allocation_count
    , row_number() OVER (
        PARTITION BY order_item_number
        ORDER BY
            issued_serial IS NOT NULL DESC
          , allocated_serial IS NOT NULL DESC
          , x3_order_line IS NOT NULL DESC
          , allocation_created_at DESC
      ) AS order_item_allocation_priority
  FROM order_item_allocations

)

SELECT * FROM final