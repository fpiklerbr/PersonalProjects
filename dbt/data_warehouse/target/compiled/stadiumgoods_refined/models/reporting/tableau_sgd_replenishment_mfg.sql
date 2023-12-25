

WITH inventory AS (

  SELECT
    simple_sku
  , serial_relationship AS inventory_relationship
  , COUNT( CASE WHEN warehouse = 'CAP' and yseristatus_consignment_status = 'In Stock' THEN serial_number END ) AS cap_qty_in_stock
  , COUNT( CASE WHEN warehouse = 'SGD' and yseristatus_consignment_status = 'In Stock' THEN serial_number END ) AS sgd_qty_in_stock
  , COUNT( CASE WHEN warehouse = 'CHI' and yseristatus_consignment_status = 'In Stock' THEN serial_number END ) AS chi_qty_in_stock
  , COUNT( CASE WHEN warehouse = 'CHW' and yseristatus_consignment_status = 'In Stock' THEN serial_number END ) AS chw_qty_in_stock
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials`
  GROUP BY 1,2

), final AS (

  SELECT
    products.mfg_sku
  ,  inventory.inventory_relationship
  , sum(inventory.cap_qty_in_stock) AS cap_qty_mfg
  , sum(inventory.sgd_qty_in_stock) AS sgd_qty_mfg
  , sum(inventory.chi_qty_in_stock) AS chi_qty_mfg
  , sum(inventory.chw_qty_in_stock) AS chw_qty_mfg

  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products` AS products
  INNER JOIN inventory ON inventory.simple_sku = products.simple_sku
  GROUP BY 1,2

)

SELECT * FROM final