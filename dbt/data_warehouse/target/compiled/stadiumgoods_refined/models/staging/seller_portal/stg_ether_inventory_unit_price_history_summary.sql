SELECT
    ether_wms_inventory_unit_id
  , min(
      CASE
        WHEN previous_price_base_amount <> 0 OR price_base_amount <> 0
        THEN valid_from
      END
    ) AS price_first_logged_at
  , max(
      CASE
        WHEN price_base_amount IS NOT NULL
          AND (price_base_amount <> previous_price_base_amount OR previous_price_base_amount IS NULL)
        THEN valid_from
      END
    ) AS price_last_changed_at
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_unit_price_history` AS price_history
GROUP BY 1