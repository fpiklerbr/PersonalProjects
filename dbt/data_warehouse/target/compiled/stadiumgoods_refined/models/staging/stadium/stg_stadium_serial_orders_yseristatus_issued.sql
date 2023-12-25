WITH issue_date AS (

  SELECT
      serial_number
    , x3_order_id
    , x3_order_line
    , row_number() OVER (PARTITION BY serial_number ORDER BY yseristatus_issue_date DESC) AS order_rank
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_x3_serials` AS x3_serials
  WHERE yseristatus_issue_date IS NOT NULL
    AND NOT EXISTS (
      SELECT *
      FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_serial_orders_ether_issued`
      WHERE serial_number = x3_serials.serial_number
    )
), final AS (

  SELECT DISTINCT
      issue_date.serial_number
    , orders.stadium_order_id
    , orders.order_creation_nyc
  FROM issue_date
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_item_line_info_orders` AS orders
    ON orders.x3_order_id = issue_date.x3_order_id
    AND orders.x3_order_line = issue_date.x3_order_line
  WHERE order_rank = 1

)

SELECT * FROM final