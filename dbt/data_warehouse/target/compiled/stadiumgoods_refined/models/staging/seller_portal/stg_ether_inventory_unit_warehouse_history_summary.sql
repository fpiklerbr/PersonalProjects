SELECT
    ether_wms_inventory_unit_id
  , min(
      CASE
        WHEN (previous_ether_wms_warehouse_id IS NOT NULL OR ether_wms_warehouse_id IS NOT NULL)
        THEN logged_at
      END
    ) AS warehouse_first_logged_at
  , max(
      -- new value created & or warehouse change
      CASE
        WHEN ether_wms_warehouse_id IS NOT NULL
          AND (ether_wms_warehouse_id <> previous_ether_wms_warehouse_id OR previous_ether_wms_warehouse_id IS NULL)
        THEN logged_at
      END
    ) AS warehouse_last_changed_at
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_unit_warehouse_history` AS warehouse_history
GROUP BY 1