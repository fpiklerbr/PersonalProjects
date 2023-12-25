WITH joined AS (

  SELECT DISTINCT
    ether.`ether_pricing_price_history_id`,
  ether.`mfg_sku`,
  ether.`scrape_source`,
  ether.`product_name`,
  ether.`scrape_site_price`,
  ether.`created_at`,
  ether.`updated_at`
  , CASE scrape_site WHEN 'FLIGHT CLUB' THEN 'FLIGHTCLUB'
      ELSE UPPER(scrape_site)
        END AS scrape_site
  , CAST(ether.scraped_at AS date) AS scrape_date
  , coalesce(mapping.sg_size
        , CASE
  WHEN 


  regexp_contains(ether.product_name, r'GS')

 AND 


  not regexp_contains(ether.product_size, r'[A-Z]')


    THEN concat(ether.product_size, 'Y')
  WHEN 


  regexp_contains(ether.product_name, r'\(W\)')

 AND 


  not regexp_contains(ether.product_size, r'[A-Z]')


    THEN concat(ether.product_size, 'W')
  WHEN 


  regexp_contains(ether.product_name, r'\(TD\)')

 AND 


  not regexp_contains(ether.product_size, r'[A-Z]')


    THEN concat(ether.product_size, 'C')
  WHEN 


  regexp_contains(ether.product_name, r'\(PS\)')

 AND 


  not regexp_contains(ether.product_size, r'[A-Z]')


    THEN concat(ether.product_size, 'C')
  WHEN 


  regexp_contains(ether.product_name, r'\(Kids\)')

 AND 


  not regexp_contains(ether.product_size, r'[A-Z]')


    THEN concat(ether.product_size, 'K')
  ELSE ether.product_size
END
  ) AS product_size
  , mapping.ff_mapping_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_pricing_price_histories` AS ether
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_seller_portal_ff_size_mapping` AS mapping
    ON ether.product_size = mapping.ether_size
    AND ether.mfg_sku = mapping.mfg_sku
  WHERE ether.scrape_source = 'Suplexed'

), agg AS (

  SELECT
    scrape_source
  , scrape_site
  , product_name
  , mfg_sku
  , scrape_date
  , product_size
  , scrape_site_price
  , ff_mapping_id
  , MAX(updated_at) AS updated_at
  FROM joined
  group by 1,2,3,4,5,6,7,8

)

SELECT * FROM agg