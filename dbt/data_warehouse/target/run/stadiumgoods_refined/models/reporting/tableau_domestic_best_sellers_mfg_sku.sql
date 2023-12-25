

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`tableau_domestic_best_sellers_mfg_sku`
  
  
  OPTIONS()
  as (
    

  SELECT
    products.mfg_sku
  , count(serial_number) AS qty_available_mfg
  , max(serials.price) AS max_price
  , min(serials.price) AS min_price
  , avg(serials.price) AS avg_price
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials` AS serials
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products` AS products
  ON serials.simple_sku = products.simple_sku
  WHERE yseristatus_consignment_status IN ('In Stock') AND warehouse IN ('CAP','SGD')
  GROUP BY 1
  );
    