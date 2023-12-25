WITH transfer_items AS (

  SELECT
      transfers.transfer_number
    , transfer_items.transfer_item_line_number
    , transfers.ether_wms_transfer_id
    , transfer_items.ether_wms_transfer_item_id
    , transfer_items.transfer_item_status
    , transfers.created_at AS transfer_created_at
    , transfers.total_qty AS transfer_total_qty
    , transfers.transfer_reason
    , transfer_items.error_messages
    , transfers.ship_date
    , transfers.picking_number
    , transfers.shipment_number
    , transfers.transfer_status
    , transfers.shipped_at
    , transfers.is_digital
    , sending_warehouses.warehouse_code AS sending_warehouse
    , receiving_warehouses.warehouse_code AS receiving_warehouse
    , transfer_employees.employee_name AS transfer_employee
    , transfer_items.ether_wms_transfer_receipt_id
    , transfer_receipts.receipt_number
    , transfer_receipts.closed_at
    , receiving_employees.employee_name AS receiving_employee
    , inventory_units.serial_number
    , cast('Ether' AS string) AS data_source
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_transfer_items` AS transfer_items
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_transfers` AS transfers
    ON transfer_items.ether_wms_transfer_id = transfers.ether_wms_transfer_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_units` AS inventory_units
    ON transfer_items.ether_wms_inventory_unit_id = inventory_units.ether_wms_inventory_unit_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_warehouses` AS sending_warehouses
    ON transfers.origin_ether_wms_warehouse_id = sending_warehouses.ether_wms_warehouse_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_warehouses` AS receiving_warehouses
    ON transfers.destination_ether_wms_warehouse_id = receiving_warehouses.ether_wms_warehouse_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__employees` AS transfer_employees
    ON transfers.employee_id = transfer_employees.employee_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_transfer_receipts` AS transfer_receipts
    ON transfer_items.ether_wms_transfer_receipt_id = transfer_receipts.ether_wms_transfer_receipt_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__employees` AS receiving_employees
    ON transfer_receipts.employee_id = receiving_employees.employee_id

), serial_counts AS (

  SELECT
      ether_wms_transfer_id
    , count(DISTINCT serial_number) AS transfer_total_serial_count
  FROM transfer_items
  GROUP BY 1

), final AS (

  SELECT
      transfer_items.*
    , serial_counts.transfer_total_serial_count
  FROM transfer_items
  INNER JOIN serial_counts
    ON transfer_items.ether_wms_transfer_id = serial_counts.ether_wms_transfer_id

)

SELECT * FROM final