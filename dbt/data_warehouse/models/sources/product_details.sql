-- models/transform_my_source.sql
{{ config(materialized='table', schema='sources') }}

SELECT
      CAST(id as string) AS product_id
    , CAST(sku as string) AS sku
    , CAST(product_size as string) AS product_size
    , CAST(product_name as string) AS product_name
    , CAST(avg_price as decimal) AS avg_price
FROM {{ source('sources', 'product_details') }}
