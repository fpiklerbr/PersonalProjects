

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`competitive_pricing`
  
  
  OPTIONS()
  as (
    

WITH ether_products AS (

  SELECT DISTINCT
    ether.scrape_site
  , ether.scrape_date
  , 'US' AS scrape_market
  , ether.mfg_sku
  , ether.product_size
  , coalesce(ether.scrape_site_price, ff.scrape_site_price) AS scrape_site_price
  , ether.product_name
  , CAST(NULL AS string) AS product_color
  , CAST(NULL AS string) AS product_brand
  , COALESCE(ff.farfetch_product_id, mapping.ff_mapping_id) AS farfetch_product_id
  , ether.scrape_source
  , CAST(NULL AS string) AS gender
  , CAST(NULL AS string) AS category
  , CAST('USD' AS string) AS currency
  , ether.updated_at
  , COALESCE(serials.price, simples.price) AS sg_price
  , 'USD' AS sg_currency
  , ff.ff_price
  , ff.ff_currency
  , ff.in_stock
  , ff.ff_market
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_seller_portal_ether_pricing` AS ether
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ff_product_matching` AS ff
   ON  ff.farfetch_product_id = ether.ff_mapping_id  -- config level
   AND ff.mfg_sku = ether.mfg_sku
   AND ff.product_size = ether.product_size
   AND ff.scrape_site = ether.scrape_site
   AND ff.scrape_date = ether.scrape_date
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_seller_portal_ff_size_mapping` AS mapping
   ON ether.mfg_sku = mapping.mfg_sku
  LEFT JOIN (
    SELECT mfg_sku, size, last_available_date, round(AVG(price),0) AS price
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials`
    GROUP BY 1,2,3
  ) AS serials
   ON ether.mfg_sku = serials.mfg_sku
   AND ether.product_size = serials.size
   AND ether.scrape_date = serials.last_available_date
  LEFT JOIN (
    SELECT mfg_sku, size, round(AVG(price),0) AS price
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials`
    GROUP BY 1,2
  ) AS simples
   ON ether.mfg_sku = simples.mfg_sku
   AND ether.product_size = simples.size

), ff_products AS (

  SELECT DISTINCT
    ff.scrape_site
  , ff.scrape_date
  , ff.site_market AS scrape_market
  , ff.mfg_sku
  , ff.us_size AS product_size
  , ff.scrape_site_price
  , ff.product_name
  , ff.product_color
  , UPPER(ff.product_brand) AS product_brand
  , ff.farfetch_product_id
  , CAST('Farfetch' AS string) AS scrape_source
  , ff.gender
  , ff.category
  , ff.currency
  , CAST(ff.scrape_date AS timestamp) AS updated_at
  , COALESCE(ff.sg_price, serials.price, simples.price) AS sg_price
  , COALESCE(ff.sg_currency, 'USD') AS sg_currency
  , ff.ff_price
  , ff.ff_currency
  , ff.in_stock
  , ff.ff_market
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ff_product_matching` AS ff
  LEFT JOIN (
    SELECT mfg_sku, size, last_available_date, round(MIN(price),0) AS price
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials`
    GROUP BY 1,2,3
  ) AS serials
   ON  ff.mfg_sku = serials.mfg_sku
   AND ff.us_size = serials.size
   AND ff.scrape_date = serials.last_available_date
  LEFT JOIN (
    SELECT mfg_sku, size, round(MIN(price),0) AS price
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials`
    GROUP BY 1,2
  ) AS simples
   ON  ff.mfg_sku = simples.mfg_sku
   AND ff.us_size = 
  CAST(regexp_extract(simples.size, 
  r'\d+\.?\d*'
) AS string)

  WHERE NOT EXISTS (
    SELECT * FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_seller_portal_ether_pricing` AS ether
    WHERE ether.mfg_sku = ff.mfg_sku
    AND   ether.product_size = ff.product_size
    AND   ether.scrape_site = ff.scrape_site
    AND   ether.scrape_date = ff.scrape_date
  )

), unioned AS (

  SELECT *
  FROM ether_products
  UNION DISTINCT
  SELECT *
  FROM ff_products

), joined AS (

  SELECT DISTINCT
    farfetch_product_id
  , unioned.mfg_sku
  , COALESCE(pp.simple_sku
      , semi_pp.simple_sku
      , substr(
    concat(
    
      coalesce(config_pp.x3_sku|| '|' , '')
    
      , coalesce(config_pp.mfg_sku|| '|' , '')
    
      , coalesce(unioned.product_size|| '|' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(config_pp.x3_sku|| '|' , '')
    
      , coalesce(config_pp.mfg_sku|| '|' , '')
    
      , coalesce(unioned.product_size|| '|' , '')
    
  )) - length('|')
      , 0
    )
)
    ) AS simple_sku
  , COALESCE(unioned.gender, pp.gender, semi_pp.gender, config_pp.gender) AS product_gender
  , COALESCE(UPPER(unioned.product_brand), UPPER(pp.brand), UPPER(semi_pp.brand), UPPER(config_pp.brand)) AS product_brand
  , COALESCE(unioned.product_color,pp.colorway, semi_pp.colorway, config_pp.colorway) AS product_color
  , COALESCE(unioned.product_name, pp.name, semi_pp.name, config_pp.name) AS product_name
  , COALESCE(unioned.category, pp.attribute_set, semi_pp.attribute_set, config_pp.attribute_set) AS product_category
  , COALESCE(pp.brand_subcategory, semi_pp.brand_subcategory, config_pp.brand_subcategory) AS brand_subcategory
  , unioned.scrape_source
  , unioned.scrape_site
  , unioned.scrape_market
  , unioned.scrape_date
  , unioned.product_size
  , semi_pp.size AS semi_pp_size
  , pp.size AS pp_size
  , unioned.currency
  , unioned.scrape_site_price
  , unioned.updated_at
  , unioned.sg_price
  , unioned.sg_currency
  , unioned.ff_price
  , unioned.ff_currency
  , unioned.in_stock
  , unioned.ff_market
  FROM unioned
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products` AS pp
   ON pp.mfg_sku = unioned.mfg_sku
   AND pp.size = unioned.product_size
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products` AS semi_pp
   ON semi_pp.mfg_sku = unioned.mfg_sku
   AND 
  CAST(regexp_extract(semi_pp.size, 
  r'\d+\.?\d*'
) AS string)
 = unioned.product_size
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products` AS config_pp
   ON config_pp.mfg_sku = unioned.mfg_sku

), final AS (

  SELECT DISTINCT
    farfetch_product_id
  , mfg_sku
  , simple_sku
  , product_gender
  , product_brand
  , product_color
  , product_name
  , product_category
  , brand_subcategory
  , scrape_source
  , scrape_site
  , scrape_market
  , scrape_date
  , COALESCE(semi_pp_size, pp_size, product_size) AS product_size
  , currency
  , scrape_site_price
  , updated_at
  , sg_price
  , sg_currency
  , ff_price
  , ff_currency
  , in_stock
  , ff_market
  FROM joined

/* no 'order by' here to save memory */

)
SELECT * FROM final
  );
    