WITH products AS (

  SELECT
    cp.scrape_site
  , cp.mfg_sku  --designer_style_id
  , cp.scrape_market -- US/EU/RU/FR etc
  , cp.site_product_id
  , cp.product_color
  , CASE WHEN cp.product_brand = 'AIR JORDAN' THEN 'JORDAN'
      ELSE cp.product_brand
      END AS product_brand
  , cp.product_name
  , CASE
      WHEN cp.scrape_site IN ('GOAT','FLIGHTCLUB','STOCKX')
    THEN 
  CAST(regexp_extract(UPPER((JSON_EXTRACT_SCALAR(stock_summary, '$.size'
  ))
), 
  r'^[A-Z ]*(\d+\.?\d*)[A-Z ]*$'
) AS string)

      WHEN 
  CAST(regexp_extract(UPPER((JSON_EXTRACT_SCALAR(stock_summary, '$.size'
  ))
), 
  r'^\d+\.?\d[A-Z]* (\D+$)'
) AS string)
 IN ('FR','IT','DE')
    THEN CONCAT(
  CAST(regexp_extract(UPPER((JSON_EXTRACT_SCALAR(stock_summary, '$.size'
  ))
), 
  r'^(\d+\.?\d[A-Z]*) \D+$'
) AS string)
,' EU')
      ELSE UPPER((JSON_EXTRACT_SCALAR(stock_summary, '$.size'
  ))
)
    END AS product_size
  , 
    safe_cast(JSON_EXTRACT_SCALAR(stock_summary, '$.scrape_date'
  ) as date)
 AS scrape_date
  , 
    safe_cast(JSON_EXTRACT_SCALAR(stock_summary, '$.price'
  ) as float64)
 AS scrape_site_price
  , 
    safe_cast(JSON_EXTRACT_SCALAR(stock_summary, '$.in_stock'
  ) as boolean)
 AS in_stock
  , (JSON_EXTRACT_SCALAR(stock_summary, '$.currency'
  ))
 AS currency
  , (JSON_EXTRACT_SCALAR(canonical_category, '$.gender'
  ))
 AS gender
  , (JSON_EXTRACT_SCALAR(canonical_category, '$.category'
  ))
 AS category
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`ff_product_matching__canonical_products_snapshot` AS cp
  , UNNEST(JSON_EXTRACT_ARRAY(stock_summary)) AS stock_summary
  WHERE cp.site_product_id IS NOT NULL
  AND cp.scrape_site IN ('GOAT','STOCKX','FLIGHTCLUB','STADIUMGOODS','FARFETCH')
  AND 
    safe_cast(JSON_EXTRACT_SCALAR(stock_summary, '$.price'
  ) as float64)
 IS NOT NULL


), products_sz AS (

  SELECT DISTINCT
    products.*
  , coalesce(chart.size, chart_1.size, chart_2.size, chart_3.size, products.product_size) AS us_size
  FROM products
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ff_product_size_conversion` AS chart
  ON  
  CAST(regexp_extract(chart.us_size, 
  r'^[A-Z ]*(\d+\.?\d*)[A-Z ]*$'
) AS string)
 = products.product_size
  /* product_size is stripped for (Y|W|C) */
  AND chart.mfg_sku = products.mfg_sku
  --AND products.product_brand = chart.brand
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ff_product_size_conversion` AS chart_1
  ON  chart_1.uk_size = products.product_size
  AND chart_1.mfg_sku = products.mfg_sku
  --AND products.product_brand = chart_1.brand
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ff_product_size_conversion` AS chart_2
  ON  chart_2.eu_size = products.product_size
  AND chart_2.mfg_sku = products.mfg_sku
  --AND products.product_brand = chart_2.brand
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_ff_product_size_conversion` AS chart_3
  ON  chart_3.jp_size = products.product_size
  AND chart_3.mfg_sku = products.mfg_sku
  --AND products.product_brand = chart_3.brand

)
SELECT * FROM products_sz