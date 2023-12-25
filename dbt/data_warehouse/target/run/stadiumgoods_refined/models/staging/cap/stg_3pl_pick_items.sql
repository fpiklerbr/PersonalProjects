

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_3pl_pick_items`
  OPTIONS()
  as WITH last_file_by_pick_item AS (

  SELECT
      pick_id
    , label_number
    , max(file_time) AS file_time
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`barrett__pending_orders`
  GROUP BY 1, 2

), final AS (

SELECT
    pending_orders.*
  , coalesce(inventory_units.serial_number, pending_orders.label_number) AS serial_number
FROM last_file_by_pick_item
INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`barrett__pending_orders` AS pending_orders
  ON last_file_by_pick_item.pick_id = pending_orders.pick_id
  AND last_file_by_pick_item.label_number = pending_orders.label_number
  AND last_file_by_pick_item.file_time = pending_orders.file_time
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_inventory_units` AS inventory_units
  ON last_file_by_pick_item.label_number = inventory_units.label_number
  AND last_file_by_pick_item.file_time >= inventory_units.label_number_valid_from
  AND last_file_by_pick_item.file_time <= inventory_units.label_number_valid_to

)

SELECT * FROM final;

