

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ff_product_matching`
  
  
  OPTIONS()
  as (
    




WITH sg_matches AS (   --match with ff_product_id to find the site1_product_id

  SELECT DISTINCT
    site1
  , site1_market
  , site1_product_id     --product_id is not sku, it is internal
  , site1_color
  , site2_product_id AS match_site_product_id    --farfetch_product_id
  , site2_color AS match_color
  , site2 AS match_site
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`ff_product_matching__matches_flat`
  WHERE site2 IN ('FARFETCH', 'STADIUMGOODS')
  AND site1 IN ('FLIGHTCLUB', 'GOAT', 'STOCKX')
  --AND site1_market = 'US'

), products_sz AS (

  SELECT * FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ff_product_flatten`

), joined AS (

  SELECT DISTINCT
    UPPER(scraped_products.scrape_site) AS scrape_site
  , sg_matches.site1_market AS site_market
  , scraped_products.site_product_id
  , CAST(ff_key.match_site_product_id AS int64) AS farfetch_product_id
  , COALESCE(mag.fps_store_sku, scraped_products.mfg_sku) AS mfg_sku
  , scraped_products.product_color
  , scraped_products.product_brand
  , scraped_products.product_name
  , scraped_products.product_size
  , scraped_products.us_size
  , scraped_products.scrape_date
  , scraped_products.scrape_site_price
  , scraped_products.currency
  , scraped_products.in_stock
  , scraped_products.gender
  , scraped_products.category
  , sg_products.scrape_site_price AS sg_price
  , sg_products.currency AS sg_currency
  , ff_products.scrape_site_price AS ff_price
  , ff_products.currency AS ff_currency
  , ff_products.scrape_market AS ff_market
  FROM sg_matches
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sg_farfetch_product` AS mag
    ON mag.fps_parent_product_id = sg_matches.match_site_product_id
  INNER JOIN (SELECT * FROM products_sz WHERE scrape_site IN ('GOAT','STOCKX','FLIGHTCLUB')) AS scraped_products
    ON  scraped_products.scrape_site = sg_matches.site1
    AND scraped_products.site_product_id = sg_matches.site1_product_id  --join key
    AND scraped_products.product_color = sg_matches.site1_color
    AND scraped_products.scrape_market = sg_matches.site1_market
  LEFT JOIN (SELECT * FROM products_sz WHERE scrape_site IN ('STADIUMGOODS')) AS sg_products
    ON  sg_products.site_product_id = sg_matches.match_site_product_id
    AND sg_products.product_color = sg_matches.match_color
    AND sg_products.us_size = scraped_products.product_size
    AND sg_products.scrape_date = scraped_products.scrape_date
    AND sg_products.scrape_market = sg_matches.site1_market    -- only 'US'
    AND sg_matches.match_site = 'STADIUMGOODS'
  LEFT JOIN (SELECT * FROM products_sz WHERE scrape_site IN ('FARFETCH')) AS ff_products
    ON  ff_products.site_product_id = sg_matches.match_site_product_id
    AND ff_products.product_color = sg_matches.match_color
    AND ff_products.us_size = scraped_products.product_size
    AND ff_products.scrape_date = scraped_products.scrape_date
    AND sg_matches.match_site = 'FARFETCH'
  LEFT JOIN (SELECT * FROM sg_matches WHERE match_site = 'FARFETCH') AS ff_key
    ON sg_matches.site1 = ff_key.site1
    AND sg_matches.site1_product_id = ff_key.site1_product_id

)

SELECT * FROM joined
  );
    