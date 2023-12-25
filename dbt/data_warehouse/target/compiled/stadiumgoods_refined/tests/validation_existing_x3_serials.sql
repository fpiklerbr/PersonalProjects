
with dbt__CTE__INTERNAL_test as (




WITH final as (


  
  SELECT
      serial_number
    , cast('consignor_id' AS string) AS check_column
    , cast(live.consignor_id AS string) AS live_value
    , cast(snapshot.consignor_id AS string) AS snapshot_value
  FROM `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`stadium_serials` AS live
  INNER JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_serials_20231002` AS snapshot
    USING (serial_number)
  WHERE live.consignor_id <> snapshot.consignor_id
    OR (live.consignor_id IS NULL) <> (snapshot.consignor_id IS NULL)

  UNION ALL
  SELECT
      serial_number
    , cast('original_intake_date' AS string) AS check_column
    , cast(live.original_intake_date AS string) AS live_value
    , cast(snapshot.original_intake_date AS string) AS snapshot_value
  FROM `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`stadium_serials` AS live
  INNER JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_serials_20231002` AS snapshot
    USING (serial_number)
  WHERE live.original_intake_date <> snapshot.original_intake_date
    OR (live.original_intake_date IS NULL) <> (snapshot.original_intake_date IS NULL)


)

SELECT * FROM final
)select count(*) from dbt__CTE__INTERNAL_test