SELECT
    unique_email
  , string_agg(DISTINCT individual_email, ', ') AS individual_email
  , CAST(CAST(
    timestamp_trunc(
        cast(min(CASE WHEN business_unit = 'DTC' THEN order_creation_nyc END) as timestamp),
        month
    )

 AS datetime) AS date) AS customer_gmv_cohort
  , CAST(CAST(
    timestamp_trunc(
        cast(min(CASE WHEN sales = 1 AND business_unit = 'DTC' THEN order_creation_nyc END) as timestamp),
        month
    )

 AS datetime) AS date) AS customer_sales_cohort
  , MIN( CASE WHEN customer_id IS NOT NULL THEN order_creation_nyc END ) AS first_order_with_id_nyc
  , count(DISTINCT CASE WHEN sales = 1 AND business_unit = 'DTC' THEN mag_order_id END) AS sg_sales_orders
  , count(CASE WHEN sales = 1 AND business_unit = 'DTC' THEN mag_order_id END) AS sg_sales_items
  , cast((sum(CASE WHEN sales = 1 AND business_unit = 'DTC' THEN price + tax + shipping - discount - store_credit END)) AS decimal) AS sg_sales_revenue
  , min(CASE WHEN sales = 1 AND business_unit = 'DTC' THEN order_creation_nyc END) AS sg_sales_first_order_nyc
  , max(CASE WHEN sales = 1 AND business_unit = 'DTC' THEN order_creation_nyc END) AS sg_sales_last_order_nyc
  , count(DISTINCT CASE WHEN sales = 1 AND business_unit = 'Omnichannel' THEN mag_order_id END) AS non_sg_sales_orders
  , count(CASE WHEN sales = 1 AND business_unit = 'Omnichannel' THEN mag_order_id END) AS non_sg_sales_items
  , cast((sum(CASE WHEN sales = 1 AND business_unit = 'Omnichannel' THEN price + tax + shipping - discount - store_credit END)) AS decimal) AS non_sg_sales_revenue
  , min(CASE WHEN sales = 1 AND business_unit = 'Omnichannel' THEN order_creation_nyc END) AS non_sg_sales_first_order_nyc
  , max(CASE WHEN sales = 1 AND business_unit = 'Omnichannel' THEN order_creation_nyc END) AS non_sg_sales_last_order_nyc
  , count(DISTINCT CASE WHEN sales <> 1 AND business_unit = 'DTC' THEN mag_order_id END) AS sg_non_sales_orders
  , count(CASE WHEN sales <> 1 AND business_unit = 'DTC' THEN mag_order_id END) AS sg_non_sales_items
  , cast((sum(CASE WHEN sales <> 1 AND business_unit = 'DTC' THEN price + tax + shipping - discount - store_credit END)) AS decimal) AS sg_non_sales_revenue
  , min(CASE WHEN sales <> 1 AND business_unit = 'DTC' THEN order_creation_nyc END) AS sg_non_sales_first_order_nyc
  , max(CASE WHEN sales <> 1 AND business_unit = 'DTC' THEN order_creation_nyc END) AS sg_non_sales_last_order_nyc
  , count(DISTINCT CASE WHEN sales <> 1 AND business_unit = 'Omnichannel' THEN mag_order_id END) AS non_sg_non_sales_orders
  , count(CASE WHEN sales <> 1 AND business_unit = 'Omnichannel' THEN mag_order_id END) AS non_sg_non_sales_items
  , cast((sum(CASE WHEN sales <> 1 AND business_unit = 'Omnichannel' THEN price + tax + shipping - discount - store_credit END)) AS decimal) AS non_sg_non_sales_revenue
  , min(CASE WHEN sales <> 1 AND business_unit = 'Omnichannel' THEN order_creation_nyc END) AS non_sg_non_sales_first_order_nyc
  , max(CASE WHEN sales <> 1 AND business_unit = 'Omnichannel' THEN order_creation_nyc END) AS non_sg_non_sales_last_order_nyc

  , current_timestamp rebuild_timestamp
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_order_lines`
  WHERE gmv = 1
  AND mag_order_id IS NOT NULL
  AND unique_email IS NOT NULL
  GROUP BY 1