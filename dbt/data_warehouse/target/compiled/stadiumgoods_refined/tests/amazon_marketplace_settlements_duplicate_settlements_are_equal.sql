
with dbt__CTE__INTERNAL_test as (
SELECT
    settlement_id
  , count(*) AS file_count
  , count(DISTINCT min_file_time) AS min_file_time_count
  , count(DISTINCT max_file_time) AS max_file_time_count
  , count(DISTINCT total_amount) AS total_amount_count
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_amazon_marketplace_settlement_files`
GROUP BY 1
HAVING count(DISTINCT min_file_time) > 1
  OR count(DISTINCT max_file_time) > 1
  OR count(DISTINCT total_amount) > 1
)select count(*) from dbt__CTE__INTERNAL_test