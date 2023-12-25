

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_fulfillment_allocations`
  
  
  OPTIONS()
  as (
    WITH allocations AS (

SELECT
    allocations.ether_wms_allocation_id
  , fulfillments.fulfillment_number
  , fulfillments.fulfillment_order_number
  , allocations.allocation_line_number
  , fulfillments.fulfillment_source_order_number
  , allocations.allocation_source_line_number
  , fulfillments.ether_order_number
  , CASE
      WHEN fulfillments.fulfillment_order_type = 'customer_order'
      THEN allocations.allocation_line_number
    END AS ether_order_item_line_number
  , fulfillments.source_bundle_number
  , CASE
    WHEN fulfillments.fulfillment_order_type = 'source_order'
    THEN allocations.allocation_line_number
  END AS source_bundle_allocation_id
  , fulfillments.ether_withdrawal_number
  , CASE
      WHEN fulfillments.fulfillment_order_type = 'withdrawal_order'
      THEN allocations.allocation_line_number
    END AS ether_wms_withdrawal_order_item_id
  , fulfillments.x3_order_id
  , CASE
  WHEN (
    fulfillments.fulfillment_order_type = 'source_order'
    AND inventory_units.serial_number = source_bundle_allocations.seller_serial_number
  )
    THEN source_x3_serials.x3_order_line
  WHEN (
    fulfillments.fulfillment_order_type = 'customer_order'
    AND fulfillments.fulfillment_channel <> 'dss'
  )
    THEN allocations.allocation_source_line_number
END AS x3_order_line
  , allocations.`allocation_status`,
  allocations.`allocation_state`,
  allocations.`reallocation_reason`,
  allocations.`previous_ether_wms_allocation_id`,
  allocations.`employee_id`,
  allocations.`ether_wms_product_variant_id`,
  allocations.`initial_ether_wms_allocation_id`,
  allocations.`failure_reason`,
  allocations.`ether_allocation_number`
  , allocations.price_base_amount AS allocation_price_base_amount
  , allocations.is_hazardous AS allocation_is_hazardous
  , allocations.created_at AS allocation_created_at
  , allocations.updated_at AS allocation_updated_at
  , allocations.lock_version AS allocation_lock_version
  , allocations._synched_from_source_at AS allocation__synched_from_source_at
  , allocations.ether_wms_fulfillment_id
  , fulfillments.`fulfillment_status`,
  fulfillments.`delivery_strategy`,
  fulfillments.`fulfillment_channel`,
  fulfillments.`sla_deadline`,
  fulfillments.`fulfillment_order_type`,
  fulfillments.`bill_name`,
  fulfillments.`bill_address1`,
  fulfillments.`bill_address2`,
  fulfillments.`bill_city`,
  fulfillments.`bill_region_code`,
  fulfillments.`bill_postal`,
  fulfillments.`ship_name`,
  fulfillments.`ship_phone`,
  fulfillments.`ship_address1`,
  fulfillments.`ship_address2`,
  fulfillments.`ship_city`,
  fulfillments.`ship_region_code`,
  fulfillments.`ship_postal`,
  fulfillments.`ship_region_id`,
  fulfillments.`bill_region_id`,
  fulfillments.`ship_country_id`,
  fulfillments.`bill_country_id`,
  fulfillments.`is_on_hold`,
  fulfillments.`lp_order_code`,
  fulfillments.`recipient_email`,
  fulfillments.`_raw_exported_to_warehouse_at`
  , fulfillments.is_vip AS fulfillment_is_vip
  , fulfillments.sales_channel_code AS fulfillment_sales_channel_code
  , warehouses.warehouse_code AS fulfillment_warehouse_code
  , carriers.carrier_code AS fulfillment_carrier_code
  , delivery_methods.delivery_method_code AS fulfillment_delivery_method_code
  , nullif(trim(substr(
    concat(
    
      coalesce(carriers.carrier_code|| ' ' , '')
    
      , coalesce(delivery_methods.delivery_method_code|| ' ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(carriers.carrier_code|| ' ' , '')
    
      , coalesce(delivery_methods.delivery_method_code|| ' ' , '')
    
  )) - length(' ')
      , 0
    )
)), '') AS fulfillment_shipping_description
  , fulfillments.is_hazardous AS fulfillment_is_hazardous
  , fulfillments.started_at AS fulfillment_started_at
  , fulfillments.fulfilled_at AS fulfillment_fulfilled_at
  , fulfillments.cancelled_at AS fulfillment_cancelled_at
  , fulfillments.blocked_at AS fulfillment_blocked_at
  , fulfillments.created_at AS fulfillment_created_at
  , fulfillments.updated_at AS fulfillment_updated_at
  , fulfillments.lock_version AS fulfillment_lock_version
  , fulfillments.locked_for_x3_update_at AS fulfillment_locked_for_x3_update_at
  , fulfillments._synched_from_source_at AS fulfillment__synched_from_source_at
  , pick_items.ether_wms_pick_item_id
  , pick_items.allocation_pick_item_priority
  , pick_items.`pick_item_status`,
  pick_items.`pick_item_state`,
  pick_items.`picking_number`,
  pick_items.`ether_should_send_to_3pl`,
  pick_items.`fulfill_in_batch`,
  pick_items.`shipped_inventory_unit_label_number`,
  pick_items.`pick_item_employee_id`,
  pick_items.`pick_item_shipped_by_employee_id`,
  pick_items.`pick_item_created_at`,
  pick_items.`pick_item_updated_at`,
  pick_items.`pick_item_lock_version`,
  pick_items.`pick_item__synched_from_source_at`,
  pick_items.`ether_wms_shipment_id`,
  pick_items.`shipment_status`,
  pick_items.`tracking_number`,
  pick_items.`shipment_number`,
  pick_items.`tracking_url`,
  pick_items.`estimated_delivery_at`,
  pick_items.`shipment_confirmed_at`,
  pick_items.`manifest_is_needed`,
  pick_items.`ether_wms_shipment_manifest_id`,
  pick_items.`customer_name`,
  pick_items.`address_line_1`,
  pick_items.`address_line_2`,
  pick_items.`city`,
  pick_items.`region_code`,
  pick_items.`postcode`,
  pick_items.`country_code`,
  pick_items.`customer_phone`,
  pick_items.`_raw_label_status`,
  pick_items.`shipment_warehouse_code`,
  pick_items.`shipment_created_by_employee_id`,
  pick_items.`shipment_created_at`,
  pick_items.`shipment_updated_at`,
  pick_items.`shipment_lock_version`,
  pick_items.`shipment__synched_from_source_at`,
  pick_items.`zebra_ship_reference`
  , inventory_units.serial_number AS allocation_serial
  , pick_items.shipped_serial AS pick_item_shipped_serial
  , source_bundle_allocations.seller_serial_number AS source_bundle_seller_serial_number
  , source_bundle_allocations.allocation_fulfilled_at AS source_bundle_allocation_fulfilled_at
  , CASE
  WHEN (
    fulfillments.fulfillment_order_type = 'source_order'
    AND inventory_units.serial_number = source_bundle_allocations.seller_serial_number
    AND allocations.allocation_state = 'valid'
  )
    THEN source_bundle_allocations.seller_serial_number
  WHEN (
    fulfillments.fulfillment_order_type <> 'source_order'
    AND allocations.allocation_state = 'valid'
  )
    THEN coalesce(pick_items.shipped_serial, inventory_units.serial_number)
END AS ether_allocated_serial
  , CASE
  WHEN (
    fulfillments.fulfillment_order_type = 'source_order'
    AND inventory_units.serial_number = source_bundle_allocations.seller_serial_number
    AND source_bundle_allocations.allocation_fulfilled_at IS NOT NULL
  )
    THEN source_bundle_allocations.seller_serial_number
  WHEN (
    fulfillments.fulfillment_order_type <> 'source_order'
    AND allocations.allocation_status = 'shipped'
  )
    THEN coalesce(pick_items.shipped_serial, inventory_units.serial_number)
END AS ether_shipped_serial
  , coalesce(x3_order_lines.issued_serial, x3_order_lines.allocated_serial) AS x3_allocated_serial
  --TODO for DE-3934 try getting x3 issued & returned serials from stock journal for unwound shipments
  , coalesce(x3_order_lines.returned_serial, x3_order_lines.issued_serial) AS x3_issued_serial
  , x3_order_lines.returned_serial AS x3_returned_serial
  , x3_order_lines.delivery_id AS x3_delivery_id
  , x3_order_lines.delivery_line AS x3_delivery_line
  , x3_order_lines.ship_date AS x3_ship_date
  , x3_order_lines.last_invoice_id AS x3_last_invoice_id
  , x3_order_lines.last_invoice_line AS x3_last_invoice_line
  , x3_order_lines.last_invoice_date AS x3_last_invoice_date
  , x3_order_lines.return_id AS x3_return_id
  , x3_order_lines.return_line AS x3_return_line
  , cast(x3_order_lines.return_creation_nyc AS date) AS x3_return_date
  , CASE
      WHEN coalesce(x3_order_lines.returned_serial, x3_order_lines.issued_serial) IS NOT NULL
      THEN coalesce(x3_order_lines.issued_serial, x3_order_lines.allocated_serial)
      ELSE CASE
  WHEN (
    fulfillments.fulfillment_order_type = 'source_order'
    AND inventory_units.serial_number = source_bundle_allocations.seller_serial_number
    AND allocations.allocation_state = 'valid'
  )
    THEN source_bundle_allocations.seller_serial_number
  WHEN (
    fulfillments.fulfillment_order_type <> 'source_order'
    AND allocations.allocation_state = 'valid'
  )
    THEN coalesce(pick_items.shipped_serial, inventory_units.serial_number)
END
    END AS allocated_serial
  , coalesce(
        coalesce(x3_order_lines.returned_serial, x3_order_lines.issued_serial)
      , CASE
  WHEN (
    fulfillments.fulfillment_order_type = 'source_order'
    AND inventory_units.serial_number = source_bundle_allocations.seller_serial_number
    AND source_bundle_allocations.allocation_fulfilled_at IS NOT NULL
  )
    THEN source_bundle_allocations.seller_serial_number
  WHEN (
    fulfillments.fulfillment_order_type <> 'source_order'
    AND allocations.allocation_status = 'shipped'
  )
    THEN coalesce(pick_items.shipped_serial, inventory_units.serial_number)
END
    ) AS issued_serial
  , CASE
  WHEN coalesce(x3_order_lines.returned_serial, x3_order_lines.issued_serial) IS NOT NULL
    THEN SAFE_CAST(TIMESTAMP(SAFE_CAST(coalesce(x3_order_lines.ship_date, x3_order_lines.last_invoice_date) AS datetime), 
  r'America/New_York'
) AS timestamp)
  WHEN CASE
  WHEN (
    fulfillments.fulfillment_order_type = 'source_order'
    AND inventory_units.serial_number = source_bundle_allocations.seller_serial_number
    AND source_bundle_allocations.allocation_fulfilled_at IS NOT NULL
  )
    THEN source_bundle_allocations.seller_serial_number
  WHEN (
    fulfillments.fulfillment_order_type <> 'source_order'
    AND allocations.allocation_status = 'shipped'
  )
    THEN coalesce(pick_items.shipped_serial, inventory_units.serial_number)
END IS NOT NULL
    THEN coalesce(
        source_bundle_allocations.allocation_fulfilled_at
      , pick_items.shipment_confirmed_at
      , fulfillments.fulfilled_at
    )
END AS issued_at
  , safe_cast(datetime(safe_cast(CASE
  WHEN coalesce(x3_order_lines.returned_serial, x3_order_lines.issued_serial) IS NOT NULL
    THEN SAFE_CAST(TIMESTAMP(SAFE_CAST(coalesce(x3_order_lines.ship_date, x3_order_lines.last_invoice_date) AS datetime), 
  r'America/New_York'
) AS timestamp)
  WHEN CASE
  WHEN (
    fulfillments.fulfillment_order_type = 'source_order'
    AND inventory_units.serial_number = source_bundle_allocations.seller_serial_number
    AND source_bundle_allocations.allocation_fulfilled_at IS NOT NULL
  )
    THEN source_bundle_allocations.seller_serial_number
  WHEN (
    fulfillments.fulfillment_order_type <> 'source_order'
    AND allocations.allocation_status = 'shipped'
  )
    THEN coalesce(pick_items.shipped_serial, inventory_units.serial_number)
END IS NOT NULL
    THEN coalesce(
        source_bundle_allocations.allocation_fulfilled_at
      , pick_items.shipment_confirmed_at
      , fulfillments.fulfilled_at
    )
END AS timestamp), 
  r'America/New_York'
) AS date) AS issue_date
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_allocations` AS allocations
INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_fulfillments` AS fulfillments
  ON allocations.ether_wms_fulfillment_id = fulfillments.ether_wms_fulfillment_id
INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_warehouses` AS warehouses
  ON fulfillments.ether_wms_warehouse_id = warehouses.ether_wms_warehouse_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_carriers` AS carriers
  ON fulfillments.ether_wms_carrier_id = carriers.ether_wms_carrier_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_oms_delivery_methods` AS delivery_methods
  ON fulfillments.ether_oms_delivery_method_id = delivery_methods.ether_oms_delivery_method_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_units` AS inventory_units
  ON allocations.ether_wms_inventory_unit_id = inventory_units.ether_wms_inventory_unit_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_pick_items` AS pick_items
  ON allocations.ether_wms_allocation_id = pick_items.ether_wms_allocation_id 
  AND pick_items.allocation_pick_item_priority = 1
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__source_bundle_allocations` AS source_bundle_allocations
  ON CASE
    WHEN fulfillments.fulfillment_order_type = 'source_order'
    THEN allocations.allocation_line_number
  END = source_bundle_allocations.source_bundle_allocation_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_x3_serial_documents` AS source_x3_serials
  ON fulfillments.x3_order_id = source_x3_serials.x3_order_id
  AND source_bundle_allocations.seller_serial_number = source_x3_serials.serial_number
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_x3_order_lines` AS x3_order_lines
  ON fulfillments.x3_order_id = x3_order_lines.x3_order_id
  AND CASE
  WHEN (
    fulfillments.fulfillment_order_type = 'source_order'
    AND inventory_units.serial_number = source_bundle_allocations.seller_serial_number
  )
    THEN source_x3_serials.x3_order_line
  WHEN (
    fulfillments.fulfillment_order_type = 'customer_order'
    AND fulfillments.fulfillment_channel <> 'dss'
  )
    THEN allocations.allocation_source_line_number
END = x3_order_lines.order_line

)

SELECT
    allocations.*
  , CASE
      WHEN allocated_serial IS NOT NULL
      THEN row_number() OVER (
        PARTITION BY allocated_serial
        ORDER BY issued_at DESC NULLS LAST, allocation_created_at DESC
      )
    END AS serial_allocation_priority
FROM allocations
  );
    