

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_serial_orders_allocated_or_issued`
  
  
  OPTIONS()
  as (
    WITH not_yseristatus_issued AS (

  SELECT
      serials.serial_number
    , serials.serial_inventory
    , serials.mag_order_id
    , serials.x3_order_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_serial_tmp_info` AS serials
  WHERE NOT EXISTS (
    SELECT *
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_serial_orders_ether_issued` AS ether_issued
    WHERE ether_issued.serial_number = serials.serial_number
  )
  AND NOT EXISTS (
    SELECT *
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_serial_orders_yseristatus_issued` AS yseristatus_issued
    WHERE yseristatus_issued.serial_number = serials.serial_number
  )

), matched_orders_with_dupes AS (

  SELECT
      serials.serial_number
    , item_lines.stadium_order_id
    , item_lines.order_creation_nyc
    , row_number() OVER (PARTITION BY serials.serial_number ORDER BY item_lines.order_creation_nyc DESC) AS order_rank
  FROM not_yseristatus_issued AS serials
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_item_line_info` AS item_lines
    ON serials.serial_number = coalesce(item_lines.issued_serial, item_lines.allocated_serial)
  WHERE (
    CASE
      WHEN item_lines.dropship_inventory_type IS NOT NULL
      THEN item_lines.mag_order_id = serials.mag_order_id
      ELSE item_lines.x3_order_id = serials.x3_order_id
    END
  )

), final AS (

  SELECT
      serial_number
    , stadium_order_id
    , order_creation_nyc
  FROM matched_orders_with_dupes
  WHERE order_rank = 1

)

SELECT * FROM final
  );
    