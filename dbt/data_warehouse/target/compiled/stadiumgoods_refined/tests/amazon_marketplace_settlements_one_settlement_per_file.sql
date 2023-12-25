
with dbt__CTE__INTERNAL_test as (
SELECT
    file_name
  , count(DISTINCT settlement_id) AS settlement_count
FROM `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_amazon_marketplace_settlement_reports_spapi`
GROUP BY 1
HAVING count(DISTINCT settlement_id) > 1
)select count(*) from dbt__CTE__INTERNAL_test