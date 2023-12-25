
with dbt__CTE__INTERNAL_test as (


-- depends_on: `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_stadium_finance_snapshots_close_dates`
WITH final as (


  
  SELECT
      order_line_id
    , cast('stadium_order_id' AS string) AS check_column
    , cast(live.stadium_order_id AS string) AS live_value
    , cast(snapshot.stadium_order_id AS string) AS snapshot_value
  FROM `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`stadium_finance_lines` AS live
  INNER JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20230905` AS snapshot
    USING (order_line_id)
  WHERE live.stadium_order_id <> snapshot.stadium_order_id
    OR (live.stadium_order_id IS NULL) <> (snapshot.stadium_order_id IS NULL)

  UNION ALL
  SELECT
      order_line_id
    , cast('serial_number' AS string) AS check_column
    , cast(live.serial_number AS string) AS live_value
    , cast(snapshot.serial_number AS string) AS snapshot_value
  FROM `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`stadium_finance_lines` AS live
  INNER JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20230905` AS snapshot
    USING (order_line_id)
  WHERE live.serial_number <> snapshot.serial_number
    OR (live.serial_number IS NULL) <> (snapshot.serial_number IS NULL)

  UNION ALL
  SELECT
      order_line_id
    , cast('simple_sku' AS string) AS check_column
    , cast(live.simple_sku AS string) AS live_value
    , cast(snapshot.simple_sku AS string) AS snapshot_value
  FROM `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`stadium_finance_lines` AS live
  INNER JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20230905` AS snapshot
    USING (order_line_id)
  WHERE live.simple_sku <> snapshot.simple_sku
    OR (live.simple_sku IS NULL) <> (snapshot.simple_sku IS NULL)

  UNION ALL
  SELECT
      order_line_id
    , cast('order_date' AS string) AS check_column
    , cast(live.order_date AS string) AS live_value
    , cast(snapshot.order_date AS string) AS snapshot_value
  FROM `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`stadium_finance_lines` AS live
  INNER JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20230905` AS snapshot
    USING (order_line_id)
  WHERE live.order_date <> snapshot.order_date
    OR (live.order_date IS NULL) <> (snapshot.order_date IS NULL)

  UNION ALL
  SELECT
      order_line_id
    , cast('sales_channel' AS string) AS check_column
    , cast(live.sales_channel AS string) AS live_value
    , cast(snapshot.sales_channel AS string) AS snapshot_value
  FROM `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`stadium_finance_lines` AS live
  INNER JOIN `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20230905` AS snapshot
    USING (order_line_id)
  WHERE live.sales_channel <> snapshot.sales_channel
    OR (live.sales_channel IS NULL) <> (snapshot.sales_channel IS NULL)


)

SELECT * FROM final
)select count(*) from dbt__CTE__INTERNAL_test