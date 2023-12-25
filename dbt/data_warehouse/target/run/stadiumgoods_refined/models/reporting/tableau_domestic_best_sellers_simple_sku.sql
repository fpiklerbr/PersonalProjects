

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`tableau_domestic_best_sellers_simple_sku`
  
  
  OPTIONS()
  as (
    


WITH sold_info AS (

  SELECT
    geography
  , simple_sku
  , sales_channel
  , order_date
  , avg(net_sales) AS avg_sales_sfl
  , max(net_sales) AS max_sales_sfl
  , min(net_sales) AS min_sales_sfl
  , count(*) qty_sold_sfl
  , sum(net_sales) sold_dollars_sfl
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  WHERE sales_channel IN ('SG Store','eBay','SG Web','SG App','Amazon', 'FPS DTC')
  AND geography_type = 'Domestic'
  AND geography IS NOT NULL
  AND (reporting_status = 'Dispatched' OR reporting_status = 'Deferred' AND serial_order_match = TRUE)
  GROUP BY  1,2,3,4

), inventory_info AS (

  SELECT
    simple_sku
  , max(price) AS max_price
  , min(price) AS min_price
  , avg(price) AS avg_price
  , count(serial_number) AS qty_available
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials`
  WHERE yseristatus_consignment_status IN ('In Stock')
  AND warehouse IN ('CAP','SGD')
  GROUP BY 1

), final AS (

  SELECT
    sold_info.*
  , products.mfg_sku
  , coalesce(products.nickname,products.colorway) AS colorway
  , products.name AS `product_name`
  , products.brand
  , products.size
  , inventory_info.qty_available
  , inventory_info.avg_price
  , inventory_info.min_price
  , inventory_info.max_price
  FROM sold_info
  LEFT JOIN inventory_info ON inventory_info.simple_sku = sold_info.simple_sku
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products` AS products ON products.simple_sku = sold_info.simple_sku

)

SELECT * FROM final
  );
    