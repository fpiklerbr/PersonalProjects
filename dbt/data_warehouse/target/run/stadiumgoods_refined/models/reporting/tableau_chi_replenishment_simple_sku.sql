

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`tableau_chi_replenishment_simple_sku`
  
  
  OPTIONS()
  as (
    


WITH sales_fulfill AS (

  SELECT
    fol.simple_sku
  , fol.inventory_relationship
  , CAST(NULL AS date) AS `order_date`
  , CAST(null AS float64) AS `chi_sales`
  , cast(null AS float64) AS `chi_sales_dollar`
  , dispatch_date
  , count(serial_number) fulfill_units
  , sum(gmv_total) fulfill_dollar
  , CAST(null AS int64) AS  caw_qty_in_stock
  , CAST(null AS int64) AS  chi_qty_in_stock
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines` AS fol
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials` AS ss USING (serial_number)
  WHERE fol.reporting_status = 'Dispatched'
  AND ss.warehouse = 'CHI'
  AND dispatch_date >= 

        datetime_add(
            cast( 
    timestamp_trunc(
        cast(
safe_cast(datetime(safe_cast(current_timestamp AS timestamp), 'Etc/UTC') AS datetime)
 as timestamp),
        month
    )

 as datetime),
        interval -1 month
        )


  GROUP BY 1, 2, 6
  UNION ALL
  SELECT
   simple_sku
  , inventory_relationship 
  , stadium_finance_lines.order_date AS `order_date`
  , sum(stadium_finance_lines.gmv_qty) AS `chi_sales`
  , sum(stadium_finance_lines.gmv_total) `chi_sales_dollar`
  , CAST(NULL AS date  ) AS disptach_date
  , CAST(NULL AS float64 ) AS fulfill_units
  , CAST(NULL AS float64 ) AS fulfill_dollar
  , CAST(null AS int64   ) AS caw_qty_in_stock
  , CAST(null AS int64   ) AS chi_qty_in_stock
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines` AS stadium_finance_lines
  WHERE stadium_finance_lines.gmv_qty > 0
  AND stadium_finance_lines.sales_channel = 'Chicago Store'
  AND stadium_finance_lines.order_date >= 

        datetime_add(
            cast( 
    timestamp_trunc(
        cast(
safe_cast(datetime(safe_cast(current_timestamp AS timestamp), 'Etc/UTC') AS datetime)
 as timestamp),
        month
    )

 as datetime),
        interval -1 month
        )


  GROUP BY 1, 2, 3

) , inventory AS (

  SELECT
   simple_sku
  , serial_relationship AS inventory_relationship
  , CAST(NULL AS date ) AS `order_date`
  , CAST(null AS float64 ) AS `chi_sales`
  , CAST(null AS float64 ) AS `chi_sales_dollar`
  , CAST(NULL AS date  ) AS disptach_date
  , CAST(NULL AS float64 ) AS fulfill_units
  , CAST(NULL AS float64 ) AS fulfill_dollar
  , COUNT( CASE WHEN warehouse = 'CHW' and yseristatus_consignment_status = 'In Stock' THEN serial_number END ) caw_qty_in_stock
  , COUNT( CASE WHEN warehouse = 'CHI' and yseristatus_consignment_status = 'In Stock' THEN serial_number END ) chi_qty_in_stock
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials`
  GROUP BY 1, 2

), unioned AS (

  SELECT *
  FROM sales_fulfill
  UNION ALL
  SELECT *
  FROM inventory

), sz_share_mfg AS (

  SELECT
    pp.mfg_sku AS `mfg_sku`
  , pp.simple_sku
  , coalesce(pp.nickname, pp.colorway) AS colorway
  , pp.brand
  , pp.size
  , pp.name AS `product_name`
  , pp.size_uom
  , coalesce(sgd_name_size.name_size_sgd_qty,0) AS name_size_sgd_qty
  , sgd_name.name_sgd_qty
  , (CAST(coalesce(sgd_name_size.name_size_sgd_qty, 0) AS float64) / sgd_name.name_sgd_qty) AS `size_share`
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products` AS pp
  LEFT JOIN
  (
      SELECT
        stadium_products.name
      , sum(fol.gmv_qty) AS name_sgd_qty
      FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines` AS fol
      INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products` AS stadium_products USING (simple_sku)
      WHERE gmv_qty > 0
      AND sales_channel = 'Chicago Store'
      GROUP BY 1

  ) sgd_name USING (name)
  LEFT JOIN
  (
      SELECT stadium_products.name
          , stadium_products.size
          , sum(fol.gmv_qty) AS name_size_sgd_qty
      FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines` AS fol
      INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products` AS stadium_products USING (simple_sku)
      WHERE gmv_qty > 0
      AND sales_channel = 'Chicago Store'
      GROUP BY 1, 2

  ) sgd_name_size USING (name, size)

), final AS (

  SELECT
    sz_share_mfg.*
  , caw_qty_in_stock
  , chi_qty_in_stock
  , unioned.`order_date`
  , unioned.`chi_sales`
  , unioned.`chi_sales_dollar`
  , unioned.dispatch_date
  , unioned.fulfill_units
  , unioned.fulfill_dollar
  , unioned.inventory_relationship
  FROM sz_share_mfg
  LEFT JOIN unioned USING (simple_sku)

)

SELECT * FROM final
  );
    