
with dbt__CTE__INTERNAL_test as (


-- depends_on: `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_stadium_finance_snapshots_close_dates`
WITH final AS (

  SELECT
      order_line_id
    , stadium_order_id
    , serial_number
    , channel_or_gateway
    , order_date
    , reporting_date
  FROM `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`stadium_finance_lines` AS live
  WHERE NOT EXISTS (
    SELECT *
    FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20230905` AS snapshot
    WHERE order_line_id = live.order_line_id
  )
  	AND (
      order_date < '2023-09-05'
      OR reporting_date <  '2023-09-05'
    )
)

SELECT * FROM final
)select count(*) from dbt__CTE__INTERNAL_test