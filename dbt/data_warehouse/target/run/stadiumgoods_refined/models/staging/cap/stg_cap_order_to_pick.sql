

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_cap_order_to_pick`
  OPTIONS()
  as 

WITH cap_picks AS (

  SELECT
      x3_order_id
    , x3_order_line
    , pick_id
    , file_time
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`cap__sorder`
  WHERE x3_order_id IS NOT NULL
    AND x3_order_line IS NOT NULL

), law_picks AS (

  SELECT
      x3_order_id
    , x3_order_line
    , pick_id
    , file_time
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`law__sorder`
  WHERE x3_order_id IS NOT NULL
    AND x3_order_line IS NOT NULL

), pick_union AS (

  SELECT *
  FROM cap_picks
  UNION ALL
  SELECT *
  FROM law_picks

), final AS (

  SELECT
      x3_order_id
    , x3_order_line
    , array_agg(DISTINCT pick_id) AS cap_pick_ids
, DATETIME(SAFE_CAST(min(file_time) AS timestamp), 'America/New_York') AS first_cap_pick_creation_nyc
    , current_timestamp AS rebuild_timestamp
  FROM pick_union
  GROUP BY 1, 2

)

SELECT * FROM final;

