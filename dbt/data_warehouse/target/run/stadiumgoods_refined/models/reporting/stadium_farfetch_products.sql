

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_farfetch_products`
  
  
  OPTIONS()
  as (
    
/* rewrite the any(configurable_product_id) part , cuz time consuming */WITH mag_farfetch AS (

  SELECT DISTINCT
    unnest_products.mfg_sku
  , CAST(ff_product.fps_parent_product_id AS int64) AS mag_farfetch_product_id -- bigint in prod
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sg_farfetch_product` AS ff_product
  INNER JOIN (
    SELECT DISTINCT
    	mfg_sku
    	, unnest_configurable_product_id
    FROM  `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products`, UNNEST(configurable_product_id) AS unnest_configurable_product_id
   ) AS unnest_products
  ON ff_product.configurable_product_id = unnest_products.unnest_configurable_product_id

), farfetch AS (

  SELECT
    mfg_sku
  , farfetch_product_id
  , max(farfetch_date) AS farfetch_date
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`farfetch_products_current`
  GROUP BY 1, 2

), country_of_origins AS (

  SELECT
    mfg_sku
  , country_of_origin
  FROM
  (
  	SELECT mfg_sku
  		, array_concat(
    
       array_agg(x3_country_of_origin)
    
      ,  array_agg(mag_country_of_origin)
    
  ) coo_array
  	FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products` AS products
  	GROUP BY 1
  ) AS coo, unnest(coo_array) AS country_of_origin

), configurable_products AS (

  SELECT
    products.mfg_sku
  , products.brand
  , products.name AS product_name
  , coalesce(products.nickname, products.colorway) AS nickname_colorway
  , string_agg(DISTINCT materials.material_name, ', ') AS materials
  , string_agg(DISTINCT country_of_origins.country_of_origin, ', ') AS country_of_origin
  , nullif(substr(
    concat(
    
      coalesce(CASE WHEN string_agg(DISTINCT products.x3_country_of_origin, ', ') IS NULL THEN NULL ELSE 'X3' END|| ', ' , '')
    
      , coalesce(CASE WHEN string_agg(DISTINCT products.mag_country_of_origin, ', ') IS NULL THEN NULL ELSE 'Magento' END|| ', ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(CASE WHEN string_agg(DISTINCT products.x3_country_of_origin, ', ') IS NULL THEN NULL ELSE 'X3' END|| ', ' , '')
    
      , coalesce(CASE WHEN string_agg(DISTINCT products.mag_country_of_origin, ', ') IS NULL THEN NULL ELSE 'Magento' END|| ', ' , '')
    
  )) - length(', ')
      , 0
    )
)
  	, '') AS country_of_origin_source
  , string_agg(DISTINCT farfetch_image.image_path, ', ') AS farfetch_image
  , CAST(min(x3_product_creation_nyc) AS date) AS x3_product_creation_date
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products` AS products
  LEFT JOIN country_of_origins
  ON country_of_origins.mfg_sku = products.mfg_sku AND country_of_origins.country_of_origin IS NOT NULL
  LEFT JOIN (
  	SELECT
  	  simple_sku
  	, image_tag
  	, image_path
	FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_product_image`, unnest(image_tags) AS image_tag
	WHERE image_tag = 'Farfetch'
  ) AS farfetch_image
  ON farfetch_image.simple_sku = products.simple_sku
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_product_material` AS materials
  ON materials.simple_sku = products.simple_sku
  GROUP BY 1, 2, 3, 4

), configurable_sales AS (

  SELECT
    products.mfg_sku
  , coalesce( sum( CASE WHEN CAST(sol.order_creation_nyc AS date) >= 

        datetime_add(
            cast( CAST(safe_cast(datetime(safe_cast(current_timestamp AS timestamp), 'America/New_York') AS datetime) AS date) as datetime),
        interval -14 day
        )

 THEN sales * CAST(qty_ordered AS numeric) END ), 0) AS last_14_sales_qty
  , coalesce( round(sum( CASE WHEN CAST(sol.order_creation_nyc AS date) >= 

        datetime_add(
            cast( CAST(safe_cast(datetime(safe_cast(current_timestamp AS timestamp), 'America/New_York') AS datetime) AS date) as datetime),
        interval -14 day
        )

 THEN sales * CAST(revenue AS numeric) END ), 2), 0) AS last_14_sales_revenue
  , sum(sales * qty_ordered) all_time_sales_qty
  , round( sum(sales * CAST(revenue AS numeric)), 2) all_time_sales_revenue
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_order_lines` AS sol
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products` AS products USING (simple_sku)
  WHERE sol.sales = 1
  GROUP BY 1

), final AS (

  SELECT
    configurable_sales.*
  , configurable_products.brand
  , configurable_products.product_name
  , configurable_products.nickname_colorway
  , configurable_products.materials
  , configurable_products.country_of_origin
  , configurable_products.country_of_origin_source
  , configurable_products.farfetch_image
  , configurable_products.x3_product_creation_date
  , mag_farfetch.mag_farfetch_product_id
  , farfetch.farfetch_product_id
  , farfetch.farfetch_date
  , row_number() OVER (ORDER BY last_14_sales_qty DESC, last_14_sales_revenue DESC, all_time_sales_qty DESC, all_time_sales_revenue DESC) sales_rank
  FROM configurable_sales
  INNER JOIN configurable_products USING (mfg_sku)
  LEFT JOIN mag_farfetch USING (mfg_sku)
  LEFT JOIN farfetch USING (mfg_sku)

)

SELECT * FROM final
  );
    