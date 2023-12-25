

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`productsup_serial_price_changes`
  
  
  OPTIONS()
  as (
    SELECT
  ff_products.mag_farfetch_product_id
, serials.mfg_sku
, products.size_uom
, serials.serial_number
, serials.brand
, serials.brand_subcategory
, serials.name
, serials.seller_id
, serial_prices.previous_price AS old_price
, serial_prices.price AS new_price
, round( CAST((serial_prices.price/nullif(serial_prices.previous_price,0)) AS numeric),4 ) -1  AS percent_delta_price
, serial_prices.price - serial_prices.previous_price AS dollar_delta_price
, CAST(serial_prices.valid_from AS date) AS start_date
, serial_prices.log_entry_type AS log_type
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`serial_price_history` AS serial_prices
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials` AS serials
  ON serials.serial_number = serial_prices.serial_number
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_farfetch_products` AS ff_products
  ON ff_products.mfg_sku = serials.mfg_sku
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products` AS products
  ON products.simple_sku = serials.simple_sku
WHERE serial_prices.is_price_change IS TRUE
-- AND reporting.serial_price_history.price < reporting.serial_price_history.old_price
AND   CAST(serial_prices.valid_from AS date) >= current_date - 7
ORDER BY 13 DESC
  );
    