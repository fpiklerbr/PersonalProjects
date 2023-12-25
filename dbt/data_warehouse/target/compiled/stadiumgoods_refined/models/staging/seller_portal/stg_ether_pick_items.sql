WITH zebra_ship_references AS (

  SELECT DISTINCT
    zebra_ship_reference
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`link__tmall_order_id_to_zebra_ship_reference`

)

SELECT
    pick_items.ether_wms_pick_item_id
  , pick_items.`ether_wms_allocation_id`,
  pick_items.`pick_item_status`,
  pick_items.`pick_item_state`,
  pick_items.`picking_number`,
  pick_items.`ether_should_send_to_3pl`,
  pick_items.`fulfill_in_batch`,
  pick_items.`shipped_inventory_unit_label_number`
  , inventory_units.serial_number AS shipped_serial
  , pick_items.employee_id AS pick_item_employee_id
  , pick_items.shipped_by_employee_id AS pick_item_shipped_by_employee_id
  , pick_items.created_at AS pick_item_created_at
  , pick_items.updated_at AS pick_item_updated_at
  , pick_items.lock_version AS pick_item_lock_version
  , pick_items._synched_from_source_at AS pick_item__synched_from_source_at
  , pick_items.ether_wms_shipment_id
  , shipments.`fulfillment_order_number`,
  shipments.`shipment_status`,
  shipments.`tracking_number`,
  shipments.`shipment_number`,
  shipments.`tracking_url`,
  shipments.`estimated_delivery_at`,
  shipments.`shipment_confirmed_at`,
  shipments.`manifest_is_needed`,
  shipments.`ether_wms_shipment_manifest_id`,
  shipments.`customer_name`,
  shipments.`address_line_1`,
  shipments.`address_line_2`,
  shipments.`city`,
  shipments.`region_code`,
  shipments.`postcode`,
  shipments.`country_code`,
  shipments.`customer_phone`,
  shipments.`ether_wms_fulfillment_id`,
  shipments.`_raw_label_status`
  , warehouses.warehouse_code AS shipment_warehouse_code
  , shipments.created_by_employee_id AS shipment_created_by_employee_id
  , shipments.created_at AS shipment_created_at
  , shipments.updated_at AS shipment_updated_at
  , shipments.lock_version AS shipment_lock_version
  , shipments._synched_from_source_at AS shipment__synched_from_source_at
  , coalesce(zebra_picks.zebra_ship_reference, zebra_shipments.zebra_ship_reference) AS zebra_ship_reference 
  , row_number() OVER (
      PARTITION BY pick_items.ether_wms_allocation_id
      ORDER BY
          (shipments.shipment_status = 'shipped') IS TRUE DESC
        , shipments.shipment_confirmed_at DESC NULLS LAST
        --only consider status for picks that don't exist in x3
        , x3_picks.pick_id IS NOT NULL OR pick_items.pick_item_state = 'valid' DESC
        , x3_picks.pick_id IS NOT NULL OR pick_items.pick_item_state = 'pending' DESC
        , x3_picks.pick_id IS NOT NULL OR pick_items.pick_item_state = 'invalid' DESC
        , pick_items.created_at DESC NULLS LAST
    ) AS allocation_pick_item_priority
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_pick_items` AS pick_items
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_shipments` AS shipments
  ON pick_items.ether_wms_shipment_id = shipments.ether_wms_shipment_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_warehouses` AS warehouses
  ON shipments.ether_wms_warehouse_id = warehouses.ether_wms_warehouse_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_units` AS inventory_units
  ON pick_items.shipped_inventory_unit_label_number = inventory_units.label_number
  AND shipments.shipment_confirmed_at >= inventory_units.label_number_valid_from
  AND shipments.shipment_confirmed_at <= inventory_units.label_number_valid_to
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`x3__stopreh` AS x3_picks
  ON pick_items.picking_number = x3_picks.pick_id
LEFT JOIN zebra_ship_references AS zebra_picks
  ON pick_items.picking_number = zebra_picks.zebra_ship_reference
LEFT JOIN zebra_ship_references AS zebra_shipments
  ON shipments.shipment_number = zebra_shipments.zebra_ship_reference