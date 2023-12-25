
with dbt__CTE__INTERNAL_test as (
WITH ether AS (

  SELECT
      x3_order_id
    , x3_order_line
    , string_agg(allocated_serial, ', ') AS ether_serial
  FROM `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_ether_fulfillment_allocations`
  GROUP BY 1, 2

), x3 AS (

  SELECT
      x3_order_id
    , order_line AS x3_order_line
    , string_agg(coalesce(returned_serial, issued_serial, allocated_serial), ', ') AS x3_serial
  FROM `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_x3_order_lines`
  GROUP BY 1, 2

)

SELECT *
FROM ether
INNER JOIN x3
  USING (x3_order_id, x3_order_line)
WHERE ether_serial <> x3_serial
  OR (ether_serial IS NULL) <> (x3_serial IS NULL)
;
)select count(*) from dbt__CTE__INTERNAL_test