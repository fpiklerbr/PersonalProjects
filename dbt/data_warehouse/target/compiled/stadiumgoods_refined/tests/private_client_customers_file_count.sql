
with dbt__CTE__INTERNAL_test as (
SELECT *
FROM (
  SELECT
    count(DISTINCT file_name) AS file_count
  FROM `ff-stadiumgoods-raw-live`.`imports`.`private_client_customers`
) AS private_client_customers_file_count
WHERE file_count > 1
)select count(*) from dbt__CTE__INTERNAL_test