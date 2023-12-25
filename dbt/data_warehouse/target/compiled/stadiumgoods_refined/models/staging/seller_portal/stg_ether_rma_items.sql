SELECT
    rma_items.ether_oms_rma_item_id
  , rma_items.ether_oms_order_item_id
  , rma_items.product_number
  , rma_items.mfg_sku
  , rma_items.size_code
  , rma_items.serial_number
  , rma_items.rma_number
  , rma_items.return_reason
  , rma_items.return_condition
  , rma_items.rma_item_status
  , rma_items.resolved_by_employee_id AS rma_item_resolved_by_employee_id
  , rma_items.resolved_at AS rma_item_resolved_at
  , rma_items.created_at AS rma_item_created_at
  , rma_items.updated_at AS rma_item_updated_at
  , rma_items._synched_from_source_at AS rma_item_synched_from_source_at
  , rmas.created_by_employee_id AS rma_created_by_employee_id
  , rmas.created_at AS rma_created_at
  , rmas.updated_at AS rma_updated_at
  , rmas.lock_version AS rma_lock_version
  , rmas._synched_from_source_at AS rma_synched_from_source_at
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_oms_rma_items` AS rma_items
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_oms_rmas` AS rmas
  ON rma_items.rma_number = rmas.rma_number