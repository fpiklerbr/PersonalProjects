

SELECT allocations.fulfillment_source_order_number
  , allocations.allocation_source_line_number
  , max(pick_items.ether_wms_pick_item_id) AS last_ether_wms_pick_item_id
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_pick_items` AS pick_items
INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_fulfillment_allocations` AS allocations
  ON pick_items.ether_wms_allocation_id = allocations.ether_wms_allocation_id
GROUP BY 1, 2