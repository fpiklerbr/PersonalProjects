SELECT
    file_name
  , count(DISTINCT settlement_id) AS settlement_count
FROM {{ ref('stg_amazon_marketplace_settlement_reports_spapi') }}
GROUP BY 1
HAVING count(DISTINCT settlement_id) > 1
