


 

































 

SELECT   `logged_at`,  `scrape_date`,  `product_key`,  `scrape_site`,  `scrape_market`,  `site_product_id`,  `product_color`,  `designer_product_id`,  `mfg_sku`,  `designer_colour_id`,  `product_name`,  `product_brand`,  `description`,  `has_colour_selection`,  `material`,  `made_in`,  `size_and_fit_description`,  `url`,  `url_path`,  `categories`,  `images`,  `canonical_brand`,  `canonical_category`,  `attributes`,  `image_shot_types`,  `stock_summary`,  `size_measurements`,  `tags`,  `colour_description`,  `release_date`,  `nickname`,  `retail_price`,  `retail_price_currency`
    , `_raw_is_preowned`
  FROM ( 

SELECT
    *

  , 
    safe_cast(UPPER(_raw_scrape_site) as string)
 AS `scrape_site`
  , 
    safe_cast(UPPER(_raw_product_color) as string)
 AS `product_color`
  , 
    safe_cast(UPPER(_raw_product_brand) as string)
 AS `product_brand` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`log_datetime` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`log_datetime` AS string)), '') AS string) END as timestamp)
 AS `logged_at`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`scrape_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`scrape_date` AS string)), '') AS string) END as timestamp)
 as date)
 AS `scrape_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_key` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_key` AS string)), '') AS string) END as string)
 AS `product_key`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`scrape_site` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`scrape_site` AS string)), '') AS string) END as string)
 AS `_raw_scrape_site`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`scrape_market` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`scrape_market` AS string)), '') AS string) END as string)
 AS `scrape_market`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`site_product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`site_product_id` AS string)), '') AS string) END as string)
 AS `site_product_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`colour` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`colour` AS string)), '') AS string) END as string)
 AS `_raw_product_color`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`designer_product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`designer_product_id` AS string)), '') AS string) END as string)
 AS `designer_product_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`designer_style_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`designer_style_id` AS string)), '') AS string) END as string)
 AS `mfg_sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`designer_colour_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`designer_colour_id` AS string)), '') AS string) END as string)
 AS `designer_colour_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`name` AS string)), '') AS string) END as string)
 AS `product_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`brand` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`brand` AS string)), '') AS string) END as string)
 AS `_raw_product_brand`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`description` AS string)), '') AS string) END as string)
 AS `description`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`has_colour_selection` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`has_colour_selection` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`has_colour_selection` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`has_colour_selection` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `has_colour_selection`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`material` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`material` AS string)), '') AS string) END as string)
 AS `material`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`made_in` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`made_in` AS string)), '') AS string) END as string)
 AS `made_in`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`size_and_fit_description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`size_and_fit_description` AS string)), '') AS string) END as string)
 AS `size_and_fit_description`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`url` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`url` AS string)), '') AS string) END as string)
 AS `url`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`url_path` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`url_path` AS string)), '') AS string) END as string)
 AS `url_path`

  , 
    safe_cast(CASE WHEN to_json_string(`categories`, True) IN ('nan','None','','NaT') THEN NULL ELSE to_json_string(`categories`, True) END as string)
 AS `categories`

  , 
    safe_cast(CASE WHEN to_json_string(`images`, True) IN ('nan','None','','NaT') THEN NULL ELSE to_json_string(`images`, True) END as string)
 AS `images`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`canonical_brand` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`canonical_brand` AS string)), '') AS string) END as string)
 AS `canonical_brand`

  , 
    safe_cast(CASE WHEN to_json_string(`canonical_category`, True) IN ('nan','None','','NaT') THEN NULL ELSE to_json_string(`canonical_category`, True) END as string)
 AS `canonical_category`

  , 
    safe_cast(CASE WHEN to_json_string(`attributes`, True) IN ('nan','None','','NaT') THEN NULL ELSE to_json_string(`attributes`, True) END as string)
 AS `attributes`

  , 
    safe_cast(CASE WHEN to_json_string(`image_shot_types`, True) IN ('nan','None','','NaT') THEN NULL ELSE to_json_string(`image_shot_types`, True) END as string)
 AS `image_shot_types`

  , 
    safe_cast(CASE WHEN to_json_string(`stock_summary`, True) IN ('nan','None','','NaT') THEN NULL ELSE to_json_string(`stock_summary`, True) END as string)
 AS `stock_summary`

  , 
    safe_cast(CASE WHEN to_json_string(`size_measurements`, True) IN ('nan','None','','NaT') THEN NULL ELSE to_json_string(`size_measurements`, True) END as string)
 AS `size_measurements`

  , 
    safe_cast(CASE WHEN to_json_string(`tags`, True) IN ('nan','None','','NaT') THEN NULL ELSE to_json_string(`tags`, True) END as string)
 AS `tags`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`colour_description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`colour_description` AS string)), '') AS string) END as string)
 AS `colour_description`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`release_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`release_date` AS string)), '') AS string) END as timestamp)
 as date)
 AS `release_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`nickname` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`nickname` AS string)), '') AS string) END as string)
 AS `nickname`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`retail_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`retail_price` AS string)), '') AS string) END as float64)
 AS `retail_price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`retail_price_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`retail_price_currency` AS string)), '') AS string) END as string)
 AS `retail_price_currency`


  , `is_preowned` AS `_raw_is_preowned`


FROM `pm-matching-production`.`live_product_matching`.`canonical_products_snapshot` AS source_table

 ) AS source_select_statement

 ) AS un_ordered

