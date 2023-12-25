

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`tableau_product_health`
  
  
  OPTIONS()
  as (
    WITH serials AS ( -- serial-level: ALL inventory

  SELECT
    ss.serial_number
  , ss.mfg_sku
  , ss.simple_sku
  , ss.price
  , COALESCE(ss.yseristatus_intake_date, ss.first_available_date) intake_date
  -- cause DSS serials won't have yseristatus_intake_date info
  , CAST(

    datetime_diff(
        cast(CURRENT_DATE as datetime),
        cast(COALESCE(ss.yseristatus_intake_date, ss.first_available_date) as datetime),
        day
    )

 AS int64) AS inventory_age
  , ss.serial_relationship
  , ss.mag_status
  , ss.yseristatus_consignment_status
  , ss.serial_inventory
  , ss.warehouse
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials` ss

), sales AS ( -- serial-level: sales

  SELECT
    sfl.serial_number
  , sfl.product_sku
  , MIN(sfl.order_date) first_order_date
  , SUM(sfl.gmv_total) gmv_total
  , SUM(sfl.gmv_qty) gmv_qty
  , SUM(sfl.gtv_total) AS gtv_total
  , CAST(1 AS int64) AS gtv_qty
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines` sfl
  WHERE sfl.order_date BETWEEN CAST(current_date-7 AS date) AND CAST(current_date-1 AS date)
  GROUP BY 1,2

), products AS ( -- mfg-level: products info

  SELECT DISTINCT
    sp.mfg_sku
  , FIRST_VALUE(sp.brand) OVER (PARTITION BY sp.mfg_sku ORDER BY COALESCE(sp.configurable_product_creation_nyc, sp.simple_product_creation_nyc)) AS brand
  , FIRST_VALUE(sp.gender) OVER (PARTITION BY sp.mfg_sku ORDER BY COALESCE(sp.configurable_product_creation_nyc, sp.simple_product_creation_nyc)) AS gender
  , FIRST_VALUE(sp.name) OVER (PARTITION BY sp.mfg_sku ORDER BY COALESCE(sp.configurable_product_creation_nyc, sp.simple_product_creation_nyc)) AS `name`
  , FIRST_VALUE(sp.nickname) OVER (PARTITION BY sp.mfg_sku ORDER BY COALESCE(sp.configurable_product_creation_nyc, sp.simple_product_creation_nyc)) AS nickname
  , FIRST_VALUE(sp.x3_category) OVER (PARTITION BY sp.mfg_sku ORDER BY COALESCE(sp.configurable_product_creation_nyc, sp.simple_product_creation_nyc)) AS category
  , FIRST_VALUE(COALESCE(sp.brand_subcategory, sp.x3_subcategory, sp.mag_subcategories)) OVER (PARTITION BY sp.mfg_sku ORDER BY COALESCE(sp.configurable_product_creation_nyc, sp.simple_product_creation_nyc)) AS `subcategory`
  , FIRST_VALUE(sp.attribute_set) OVER (PARTITION BY sp.mfg_sku ORDER BY COALESCE(sp.configurable_product_creation_nyc, sp.simple_product_creation_nyc)) AS attribute_set
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products` sp

), ffid AS ( -- mfg-level: FF_ID

  SELECT DISTINCT
    sflss.sku
  , sflss.item_id AS ff_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_farfetch_listing_simple_sku` sflss

), ga_data AS (

  SELECT
    product_sku AS ff_id
  , SUM(CAST(product_detail_views AS numeric)) AS ga_pdp_views
  , SUM(CAST(unique_purchases AS numeric)) AS ga_transaction
  , CASE
    WHEN SUM(CAST(product_detail_views AS numeric)) <=0 THEN NULL
    ELSE ROUND(SUM(CAST(unique_purchases AS numeric))/SUM(product_detail_views), 4)
    END AS cal_cvr
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`google_analytics__product_data`
  WHERE source_date BETWEEN CAST(current_date-7 AS date) AND CAST(current_date-1 AS date)
-- to match same definition of "last 7 days" as GA
  GROUP BY 1

), price_data AS ( -- mfg-level: competitor price

  SELECT
  mfg_sku
  , competitor_price
  , stockx_competitor_price
  , goat_competitor_price
  FROM (  SELECT
      mfg_sku
    , AVG(bspepph.scrape_site_price) AS competitor_price
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_pricing_price_histories` AS bspepph
    WHERE CAST(scraped_at AS date) BETWEEN CAST(current_date-7 AS date) AND CAST(current_date-1 AS date) -- to match same definition of "last 7 days" as GA
    AND bspepph.scrape_site IN ( 'GOAT' ,'STOCKX' )
    GROUP BY 1  ) agg_all
  LEFT JOIN (  SELECT
      mfg_sku
    , AVG(bspepph.scrape_site_price) AS stockx_competitor_price
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_pricing_price_histories` AS bspepph
    WHERE CAST(scraped_at AS date) BETWEEN CAST(current_date-7 AS date) AND CAST(current_date-1 AS date) -- to match same definition of "last 7 days" as GA
    AND bspepph.scrape_site IN ( 'STOCKX' )
    GROUP BY 1  ) agg_stockx USING (mfg_sku)
  LEFT JOIN (  SELECT
      mfg_sku
    , AVG(bspepph.scrape_site_price) AS goat_competitor_price
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_pricing_price_histories` AS bspepph
    WHERE CAST(scraped_at AS date) BETWEEN CAST(current_date-7 AS date) AND CAST(current_date-1 AS date) -- to match same definition of "last 7 days" as GA
    AND bspepph.scrape_site IN ( 'GOAT' )
    GROUP BY 1  ) agg_goat USING (mfg_sku)

), inventory_agg AS ( -- mfg-level: inventory

  SELECT
    mfg_sku
  , COUNT(DISTINCT CASE WHEN serials.serial_relationship = '1P' THEN serials.serial_number ELSE NULL END) AS house_inventory
  , COUNT(DISTINCT CASE WHEN serials.serial_relationship = '3P' THEN serials.serial_number ELSE NULL END) AS consignor_inventory
  , CAST(COUNT(DISTINCT serials.serial_number) AS numeric) AS inventory_depth
  , CAST(COUNT(DISTINCT serials.simple_sku) AS numeric) AS inventory_width
  , SUM(serials.price) AS inventory_value
  , ROUND(CAST(AVG(serials.price) AS numeric),4) AS avg_price
  , ROUND(CAST(AVG(serials.inventory_age) AS numeric),4) AS avg_inventory_age
  FROM serials
  WHERE serials.mag_status = 'Available'
  AND (serials.yseristatus_consignment_status = 'In Stock' OR serials.serial_inventory = 'Dropship')
  AND (serials.warehouse IN ('SGD','NYR','CHI','CHR','BAR','CHX','BAM','DSS') OR serials.warehouse LIKE 'DSS%')
  GROUP BY 1

), sales_agg AS ( -- mfg-level: sales

  SELECT
    sales.product_sku
  , ROUND(CAST(
        AVG(

    datetime_diff(
        cast(sales.first_order_date as datetime),
        cast(serials.intake_date as datetime),
        day
    )

)
        AS numeric
        )
    , 4) avg_speed_of_sale
  , SUM(sales.gmv_total) gmv_total
  , SUM(sales.gmv_qty) gmv_qty
  , SUM(sales.gtv_total) gtv_total
  , SUM(sales.gtv_qty) gtv_qty
  FROM sales
  LEFT JOIN serials
  ON sales.serial_number = serials.serial_number
  GROUP BY 1

), joined AS ( -- mfg-level: inventory, sales, products, FF_ID

  SELECT
    inventory_agg.mfg_sku
  , ffid.ff_id
  , products.brand
  , products.gender
  , products.name
  , products.nickname
  , products.category
  , products.subcategory
  , products.attribute_set
  , inventory_agg.house_inventory
  , inventory_agg.consignor_inventory
  , inventory_agg.inventory_depth
  , inventory_agg.inventory_width
  , inventory_agg.inventory_value
  , inventory_agg.avg_price
  , inventory_agg.avg_inventory_age
  , sales_agg.avg_speed_of_sale
  , sales_agg.gmv_total
  , sales_agg.gmv_qty
  , sales_agg.gtv_total
  , sales_agg.gtv_qty
  , ga_data.ga_pdp_views
  , ga_data.ga_transaction
  , ga_data.cal_cvr
  , price_data.goat_competitor_price
  , price_data.stockx_competitor_price
  , price_data.competitor_price
  , CASE
    WHEN COALESCE(price_data.competitor_price, 0) = 0 THEN NULL
	ELSE CAST((inventory_agg.avg_price - price_data.competitor_price) AS numeric)/price_data.competitor_price
	END AS price_competitiveness
  FROM inventory_agg
  LEFT JOIN sales_agg
  ON inventory_agg.mfg_sku = sales_agg.product_sku
  LEFT JOIN products
  ON inventory_agg.mfg_sku = products.mfg_sku
  LEFT JOIN ffid
  ON inventory_agg.mfg_sku = ffid.sku
  LEFT JOIN ga_data
  ON ffid.ff_id = ga_data.ff_id
  LEFT JOIN price_data
  ON inventory_agg.mfg_sku = price_data.mfg_sku

), percentile AS (
  SELECT DISTINCT
    PERCENTILE_DISC(ga_pdp_views, 0.25) OVER() AS pdp_views_lower
  , PERCENTILE_DISC(ga_pdp_views, 0.75) OVER() AS pdp_views_upper
  , CAST('0' AS numeric) AS conversion_rate_lower
  , avgs.conversion_rate_upper
  , PERCENTILE_DISC(inventory_depth, 0.25) OVER() AS inventory_depth_lower
  , PERCENTILE_DISC(inventory_depth, 0.75) OVER() AS inventory_depth_upper
  FROM joined
  CROSS JOIN (SELECT AVG(cal_cvr) AS conversion_rate_upper FROM joined) AS avgs

), final AS (

  SELECT DISTINCT
    joined.*
  , percentile.pdp_views_lower
  , percentile.pdp_views_upper
  , percentile.conversion_rate_lower
  , percentile.conversion_rate_upper
  , percentile.inventory_depth_upper
  , percentile.inventory_depth_lower
  FROM joined
  CROSS JOIN percentile

)

SELECT * FROM final
  );
    