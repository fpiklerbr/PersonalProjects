SELECT
    coalesce(x3_order_lines.mag_order_id, x3_order_lines.x3_order_id) AS stadium_order_id
  , x3_order_lines.mag_order_id
  , x3_order_lines.order_item_id AS mag_order_item_id
  , x3_order_lines.dsco_item_id
  , x3_order_lines.x3_order_id
  , x3_order_lines.order_line AS x3_order_line
  , cast('X3 only' AS string) AS data_source
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_x3_order_lines` AS x3_order_lines
WHERE x3_order_lines.order_type NOT IN ('Transfer', 'SOURCE')
  AND NOT EXISTS (
    SELECT *
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_fulfillment_allocations`
    WHERE x3_order_id = x3_order_lines.x3_order_id
      AND x3_order_line = x3_order_lines.order_line
  )
  AND NOT EXISTS (
    SELECT *
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_order_items`
    WHERE order_item_id = x3_order_lines.order_item_id
  )