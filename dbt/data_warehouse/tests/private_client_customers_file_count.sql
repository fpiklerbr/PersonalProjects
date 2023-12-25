SELECT *
FROM (
  SELECT
    count(DISTINCT file_name) AS file_count
  FROM {{ source('private_client', 'customers') }}
) AS private_client_customers_file_count
WHERE file_count > 1
