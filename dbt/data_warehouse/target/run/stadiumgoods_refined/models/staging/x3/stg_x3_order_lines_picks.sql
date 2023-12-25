

  create or replace table `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_order_lines_picks`
  
  
  OPTIONS()
  as (
    

SELECT
    last_pick.x3_order_id
  , last_pick.x3_order_line
  , pick_detail.pick_id
  , pick_detail.pick_line
  , DATETIME(SAFE_CAST(pick_detail.created_at AS timestamp), 'America/New_York') AS pick_creation_nyc
  , DATETIME(SAFE_CAST(pick_detail.updated_at AS timestamp), 'America/New_York') AS pick_update_nyc
  , pick.delivery_flag
  , pick_detail.lg_order_number
  , pick_detail.lg_order_number AS tmall_b2c_ship_reference
  , zebra_ship_references.zebra_ship_reference
FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_last_pick_by_order_line` AS last_pick
INNER JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__stopred` AS pick_detail
  ON last_pick.last_pick_row_id = pick_detail.row_id
LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__stopreh` AS pick
  ON pick_detail.pick_id = pick.pick_id
LEFT JOIN (
  SELECT DISTINCT
    zebra_ship_reference
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`link__tmall_order_id_to_zebra_ship_reference`
) AS zebra_ship_references
  ON pick_detail.pick_id = zebra_ship_references.zebra_ship_reference
  );
    