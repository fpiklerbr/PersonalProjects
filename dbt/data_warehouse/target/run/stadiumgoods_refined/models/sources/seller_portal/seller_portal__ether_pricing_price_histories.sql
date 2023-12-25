
        
    

    

    merge into `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_pricing_price_histories` as DBT_INTERNAL_DEST
        using (
           

















 

SELECT   `ether_pricing_price_history_id`,  `mfg_sku`,  `scrape_source`,  `scrape_site`,  `product_name`,  `product_size`,  `scrape_site_price`,  `created_at`,  `updated_at`,  `scraped_at`,  `_synched_from_source_at`
  FROM ( 

SELECT
    *

  , 
    safe_cast(UPPER(_sql_mfg_sku) as string)
 AS `mfg_sku`
  , 
    safe_cast((_raw_price_cents/100) as numeric)
 AS `scrape_site_price` 
FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_pricing_price_history_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sku` AS string)), '') AS string) END as string)
 AS `_sql_mfg_sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`source` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`source` AS string)), '') AS string) END as string)
 AS `scrape_source`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`merchant` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`merchant` AS string)), '') AS string) END as string)
 AS `scrape_site`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`name` AS string)), '') AS string) END as string)
 AS `product_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`size` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`size` AS string)), '') AS string) END as string)
 AS `product_size`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price_cents` AS string)), '') AS string) END as numeric)
 AS `_raw_price_cents`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`taken_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`taken_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `scraped_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`



FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_pricing_price_histories` AS source_table

WHERE 
    safe_cast(
    safe_cast(id as float64)
 as int64)
 > (SELECT max(ether_pricing_price_history_id) FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_pricing_price_histories` )


 ) AS source_select_statement

 ) AS un_ordered


         ) as DBT_INTERNAL_SOURCE
        on FALSE

    

    when not matched then insert
        (`ether_pricing_price_history_id`, `mfg_sku`, `scrape_source`, `scrape_site`, `product_name`, `product_size`, `scrape_site_price`, `created_at`, `updated_at`, `scraped_at`, `_synched_from_source_at`)
    values
        (`ether_pricing_price_history_id`, `mfg_sku`, `scrape_source`, `scrape_site`, `product_name`, `product_size`, `scrape_site_price`, `created_at`, `updated_at`, `scraped_at`, `_synched_from_source_at`)


  