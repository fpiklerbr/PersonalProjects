SELECT
    ether_wms_inventory_unit_id
  , min(
      CASE
        WHEN (previous_stock_status_code IS NOT NULL OR stock_status_code IS NOT NULL)
        THEN logged_at
      END
    ) AS stock_status_first_logged_at
  , max(
      -- new value created & or stock_status change
      CASE
        WHEN stock_status_code IS NOT NULL
        AND (stock_status_code <> previous_stock_status_code OR previous_stock_status_code IS NULL)
        THEN logged_at
      END
    ) AS stock_status_last_changed_at
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_unit_stock_status_history` AS stock_status_history
GROUP BY 1