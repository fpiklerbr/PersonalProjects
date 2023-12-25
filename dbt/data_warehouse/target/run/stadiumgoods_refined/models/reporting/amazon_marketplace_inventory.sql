

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`amazon_marketplace_inventory`
  
  
  OPTIONS()
  as (
    

WITH daily_exchange_rates AS (

  SELECT
      substr(currency,1,2) AS region
    , transaction_date
    , in_usd
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_forex_daily_exchange_rates`
  WHERE currency in ('CAD', 'MXN')

)

SELECT
    sku AS simple_sku
  , asin
  , MIN(safe_cast(datetime(safe_cast(open_listings_data.file_time AS timestamp), 
  r'America/New_York'
) AS datetime)) AS amazon_inventory_time_nyc
  , MIN( CASE WHEN open_listings_data.region = 'US' THEN CAST(open_listings_data.price AS float64) END) AS amazon_us_price
  , MIN( CASE WHEN open_listings_data.region = 'US' THEN CAST(open_listings_data.quantity AS int64) END) AS amazon_us_qty
  , MIN( CASE WHEN open_listings_data.region = 'CA' THEN CAST(open_listings_data.price AS float64) * daily_exchange_rates.in_usd END ) AS amazon_ca_price
  , MIN( CASE WHEN open_listings_data.region = 'CA' THEN CAST(open_listings_data.quantity AS int64) END ) AS amazon_ca_qty
  , MIN( CASE WHEN open_listings_data.region = 'MX' THEN CAST(open_listings_data.price AS float64) * daily_exchange_rates.in_usd END ) AS amazon_mx_price
  , MIN( CASE WHEN open_listings_data.region = 'MX' THEN CAST(open_listings_data.quantity AS int64) END ) AS amazon_mx_qty
  , current_timestamp AS rebuild_timestamp
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`amazon_marketplace__open_listings_data_sp` AS open_listings_data
INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_amazon_open_listings_last_file_time_by_region` AS last_file_by_region
  ON open_listings_data.region = last_file_by_region.region
  AND open_listings_data.file_time = last_file_by_region.file_time
LEFT JOIN daily_exchange_rates
  ON last_file_by_region.region = daily_exchange_rates.region
  AND cast(last_file_by_region.file_time AS date) = daily_exchange_rates.transaction_date
GROUP BY 1, 2
  );
    