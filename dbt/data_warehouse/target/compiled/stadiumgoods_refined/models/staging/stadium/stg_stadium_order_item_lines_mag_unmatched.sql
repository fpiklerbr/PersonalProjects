SELECT
    mag_order_items.mag_order_id AS stadium_order_id
  , mag_order_items.mag_order_id
  , mag_order_items.order_item_id AS mag_order_item_id
  , mag_order_items.dsco_item_id
  , mag_order_items.dropship_source
  , mag_order_items.x3_order_id
  , cast('Mag only' AS string) AS data_source
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_order_items` AS mag_order_items
INNER JOIN (
  SELECT *
  FROM 
  UNNEST( generate_array(1,  (SELECT cast(max(item_qty_ordered) AS int64) FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_order_items`), 1) )
 AS item_line
) AS qty_line ON qty_line.item_line <= mag_order_items.item_qty_ordered
WHERE NOT EXISTS (
  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_order_items`
  WHERE mag_order_item_id = mag_order_items.order_item_id
)
  AND NOT EXISTS (
    SELECT *
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_x3_order_lines`
    WHERE order_item_id = mag_order_items.order_item_id
  )