

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_order_item_lines_mag_x3_unmatched`
  
  
  OPTIONS()
  as (
    WITH matched_items_dupes AS (

  SELECT
      mag_order_items.mag_order_id AS stadium_order_id
    , mag_order_items.mag_order_id
    , mag_order_items.order_item_id AS mag_order_item_id
    , mag_order_items.dsco_item_id
    , mag_order_items.dropship_source
    , x3_order_lines.x3_order_id
    , x3_order_lines.order_line AS x3_order_line
    , mag_order_items.item_qty_ordered
    , x3_order_lines.issued_serial
    , row_number() OVER (
        PARTITION BY mag_order_items.order_item_id
        ORDER BY x3_order_lines.issued_serial IS NOT NULL DESC, x3_order_lines.order_line_creation DESC
      ) AS item_line
    , count(x3_order_lines.issued_serial) OVER (
        PARTITION BY mag_order_items.order_item_id
      ) AS item_issued_serial_count
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_order_items` AS mag_order_items
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_x3_order_lines` AS x3_order_lines
    ON mag_order_items.order_item_id = x3_order_lines.order_item_id
  WHERE NOT EXISTS (
    SELECT *
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ether_order_items`
    WHERE mag_order_item_id = mag_order_items.order_item_id
  )

), final AS (

  SELECT
      stadium_order_id
    , mag_order_id
    , mag_order_item_id
    , dsco_item_id
    , dropship_source
    , x3_order_id
    , x3_order_line
    , cast('Mag & X3' AS string) AS data_source
  FROM matched_items_dupes
  WHERE issued_serial IS NOT NULL
    OR (item_issued_serial_count <= item_qty_ordered AND item_line <= item_qty_ordered)

)

SELECT * FROM final
  );
    