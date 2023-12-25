

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_simple_product_metrics`
  
  
  OPTIONS()
  as (
    WITH serials AS (

  SELECT
    products.brand
  , products.mfg_sku
  , products.size
  , count(DISTINCT CASE WHEN serials.last_available_date >= 

        datetime_add(
            cast( CAST(safe_cast(datetime(safe_cast(current_timestamp AS timestamp), 'America/New_York') AS datetime) AS date) as datetime),
        interval -14 day
        )

 THEN serials.serial_number END) AS last_14_serial_qty
  , sum( CASE WHEN serials.last_available_date >= 

        datetime_add(
            cast( CAST(safe_cast(datetime(safe_cast(current_timestamp AS timestamp), 'America/New_York') AS datetime) AS date) as datetime),
        interval -14 day
        )

 THEN 

    datetime_diff(
        cast(serials.last_available_date as datetime),
        cast(CAST(coalesce(serials.original_intake_creation_nyc, serials.mag_creation_nyc) AS date) as datetime),
        day
    )

 + 1 END) AS last_14_serial_days
  , count(DISTINCT serials.serial_number) AS all_time_serial_qty
  , sum(

    datetime_diff(
        cast(serials.last_available_date as datetime),
        cast(CAST(coalesce(serials.original_intake_creation_nyc, serials.mag_creation_nyc) AS date) as datetime),
        day
    )

 + 1) AS all_time_serial_days
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products` AS products
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials` AS serials
  ON products.simple_sku = serials.simple_sku
  WHERE serials.last_available_date IS NOT NULL
  AND products.brand IS NOT NULL
  AND products.mfg_sku IS NOT NULL
  AND products.size IS NOT NULL
  GROUP BY 1, 2, 3

), sales AS (

  SELECT
    products.brand
  , products.mfg_sku
  , products.size, SUM( CASE WHEN CAST(sol.order_creation_nyc AS date) >= 

        datetime_add(
            cast( CAST(safe_cast(datetime(safe_cast(current_timestamp AS timestamp), 'America/New_York') AS datetime) AS date) as datetime),
        interval -14 day
        )

 THEN sol.qty_ordered END ) AS last_14_sales_qty
    , round(sum( CASE WHEN CAST(sol.order_creation_nyc AS date) >= 

        datetime_add(
            cast( CAST(safe_cast(datetime(safe_cast(current_timestamp AS timestamp), 'America/New_York') AS datetime) AS date) as datetime),
        interval -14 day
        )

 THEN CAST(sol.revenue AS numeric) END), 2) AS last_14_sales_revenue, SUM( CASE WHEN CAST(sol.order_creation_nyc AS date) >= 

        datetime_add(
            cast( CAST(safe_cast(datetime(safe_cast(current_timestamp AS timestamp), 'America/New_York') AS datetime) AS date) as datetime),
        interval -30 day
        )

 THEN sol.qty_ordered END ) AS last_30_sales_qty
    , round(sum( CASE WHEN CAST(sol.order_creation_nyc AS date) >= 

        datetime_add(
            cast( CAST(safe_cast(datetime(safe_cast(current_timestamp AS timestamp), 'America/New_York') AS datetime) AS date) as datetime),
        interval -30 day
        )

 THEN CAST(sol.revenue AS numeric) END), 2) AS last_30_sales_revenue, SUM( CASE WHEN CAST(sol.order_creation_nyc AS date) >= 

        datetime_add(
            cast( CAST(safe_cast(datetime(safe_cast(current_timestamp AS timestamp), 'America/New_York') AS datetime) AS date) as datetime),
        interval -180 day
        )

 THEN sol.qty_ordered END ) AS last_180_sales_qty
    , round(sum( CASE WHEN CAST(sol.order_creation_nyc AS date) >= 

        datetime_add(
            cast( CAST(safe_cast(datetime(safe_cast(current_timestamp AS timestamp), 'America/New_York') AS datetime) AS date) as datetime),
        interval -180 day
        )

 THEN CAST(sol.revenue AS numeric) END), 2) AS last_180_sales_revenue
  , sum(sol.qty_ordered) AS all_time_sales_qty
  , round(sum( CAST(sol.revenue AS numeric)), 2) AS all_time_sales_revenue
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_order_lines` AS sol
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products` AS products
  ON products.simple_sku = sol.simple_sku
  WHERE sol.gmv = 1
  AND sol.sales = 1
  AND products.brand IS NOT NULL
  AND products.mfg_sku IS NOT NULL
  AND products.size IS NOT NULL
  GROUP BY 1, 2, 3

), notifications AS (

  SELECT
    products.brand
  , products.mfg_sku
  , products.size
  , COUNT( CASE WHEN CAST(notif.notification_creation_nyc AS date) >= 

        datetime_add(
            cast( CAST(safe_cast(datetime(safe_cast(current_timestamp AS timestamp), 'America/New_York') AS datetime) AS date) as datetime),
        interval -14 day
        )

 THEN notification_id END) AS last_14_notification_requests
  , count(*) AS all_time_notification_requests
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products` AS products
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_stocknotifications` AS notif
  ON products.simple_sku = notif.simple_sku
  WHERE products.brand IS NOT NULL
  AND products.mfg_sku IS NOT NULL
  AND products.size IS NOT NULL
  GROUP BY 1, 2, 3

), final AS (

  SELECT *
   , current_timestamp rebuild_timestamp
  FROM serials
  FULL JOIN sales USING (brand, mfg_sku, size)
  FULL JOIN notifications USING (brand, mfg_sku, size)

)
SELECT * FROM final
  );
    