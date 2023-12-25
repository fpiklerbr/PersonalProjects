

WITH ship_references AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`link__tmall_order_id_to_zebra_ship_reference`

), tracking_numbers AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`zebra__tracking_number`

), zebra_costs AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`zebra__dashboard_parcel_list`

), matched_tracking_numbers AS (

  SELECT DISTINCT
      ship_references.serial_number
    , ship_references.zebra_ship_reference
    , tracking_numbers.tracking_number AS zebra_tracking_number
  FROM ship_references
  INNER JOIN tracking_numbers
    ON tracking_numbers.zebra_order_reference = ship_references.zebra_order_reference
  INNER JOIN zebra_costs
    ON tracking_numbers.tracking_number = zebra_costs.tracking_number
  WHERE zebra_costs.ship_cost IS NOT NULL

), unmatched_tracking_numbers AS (

  SELECT DISTINCT
      ship_references.serial_number
    , ship_references.zebra_ship_reference
    , zebra_costs.tracking_number AS zebra_tracking_number
  FROM ship_references
  INNER JOIN zebra_costs
    ON ship_references.zebra_ship_reference = zebra_costs.ship_reference
  WHERE NOT EXISTS (SELECT * FROM matched_tracking_numbers WHERE serial_number = ship_references.serial_number AND zebra_tracking_number = zebra_costs.tracking_number)
    AND zebra_costs.ship_cost IS NOT NULL

), matched_and_unmatched AS (

  SELECT *
  FROM matched_tracking_numbers
  UNION ALL
  SELECT *
  FROM unmatched_tracking_numbers

), final AS (

  SELECT
      serial_number
    , zebra_ship_reference
    , string_agg(DISTINCT zebra_tracking_number, ', ') AS zebra_tracking_number
  FROM matched_and_unmatched
  GROUP BY 1, 2

)

SELECT * FROM final