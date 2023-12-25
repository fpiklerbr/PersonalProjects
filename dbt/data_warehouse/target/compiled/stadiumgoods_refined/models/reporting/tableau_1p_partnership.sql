WITH order_raw AS ( -- Order and Serial Level: transactions

  SELECT DISTINCT
    stadium_order_id
  , unique_email
  , CAST(order_date AS date) AS order_date
  , product_sku
  , serial_number
  , gtv_total
  , gmv_total
  , gmv_qty
  , gross_profit
  , DENSE_RANK() OVER (PARTITION BY unique_email ORDER BY order_creation_nyc) AS order_rank
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`

), order_agg AS ( -- MFG Level: transactions & new customers

  SELECT
    product_sku
  , CAST(order_date AS date) AS order_date
  , COUNT(DISTINCT stadium_order_id) AS order_count
  , COUNT(DISTINCT serial_number) AS gtv_qty
  , SUM(gtv_total) AS gtv_total
  , SUM(gmv_total) AS gmv_total
  , SUM(gmv_qty) AS gmv_qty
  , SUM(gross_profit) AS gross_profit
  , CASE WHEN (SUM(gtv_total) IS NULL OR SUM(gtv_total) = 0) THEN 0
      ELSE CAST(SUM(gross_profit) AS numeric)/SUM(gtv_total)
      END AS profit_margin
  , COUNT(DISTINCT unique_email) total_customer_count
  FROM order_raw
  GROUP BY 1,2

), customer_agg AS (

  SELECT
    product_sku
  , CAST(order_date AS date) AS order_date
  , COUNT(DISTINCT unique_email) AS new_customer_count
  FROM order_raw
  WHERE order_rank = 1
  GROUP BY 1,2

), combined_order_agg AS (

  SELECT
    order_agg.*
  , new_customer_count
  , (total_customer_count - COALESCE(new_customer_count, 0)) AS existing_customer_count
  FROM order_agg
  LEFT JOIN customer_agg USING (product_sku, order_date)
  WHERE order_agg.product_sku IS NOT NULL

), ffid AS (-- MFG Level: FF ID

  SELECT DISTINCT
    sku
  , item_id AS ff_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_farfetch_listing_simple_sku`

), traffic AS ( -- MFG Level: traffic data

  SELECT
    product_sku -- It is actually ff_id after we switch to FPS
  , CAST(source_date AS date) AS source_date
  , SUM(CAST(product_detail_views AS numeric)) AS pdp_views
  , SUM(CAST(product_adds_to_cart AS numeric)) AS add_to_cart
  , SUM(CAST(unique_purchases AS numeric)) AS unique_purchases
  , SUM(CAST(item_revenue AS numeric)) AS item_revenue
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`google_analytics__product_data`
  GROUP BY 1,2

), final AS (

  SELECT DISTINCT
    combined_order_agg.product_sku
  , ffid.ff_id
  , CAST(combined_order_agg.order_date AS date) AS order_date
  , combined_order_agg.order_count
  , combined_order_agg.gtv_qty
  , combined_order_agg.gtv_total
  , combined_order_agg.gmv_total
  , combined_order_agg.gmv_qty
  , combined_order_agg.gross_profit
  , ROUND(CAST(combined_order_agg.profit_margin AS numeric), 3) AS profit_margin
  , COALESCE(combined_order_agg.new_customer_count,0) AS new_customer_count
  , COALESCE(combined_order_agg.existing_customer_count,0) AS existing_customer_count
  , COALESCE(traffic.pdp_views,0) AS pdp_views
  , COALESCE(traffic.add_to_cart,0) AS add_to_cart
  , COALESCE(traffic.unique_purchases,0) AS unique_purchases
  , COALESCE(traffic.item_revenue,0) AS item_revenue
  FROM combined_order_agg
  LEFT JOIN ffid
  ON  combined_order_agg.product_sku = ffid.sku
  LEFT JOIN traffic
  ON  ffid.ff_id = traffic.product_sku
  AND combined_order_agg.order_date = traffic.source_date

)

SELECT * FROM final