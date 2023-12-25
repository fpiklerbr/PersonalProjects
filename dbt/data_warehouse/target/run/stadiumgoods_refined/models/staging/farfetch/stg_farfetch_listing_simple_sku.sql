

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_farfetch_listing_simple_sku`
  
  
  OPTIONS()
  as (
    

WITH most_recent_file AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_farfetch_listing_last_file_by_stockpoint_id`

), current_listing AS (

  SELECT
    relations.simple_product_id
  , relations.configurable_product_id
  , relations.product_type
  , relations.simple_sku
  , relations.configurable_sku
  , listing.*
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__api_listings` AS listing
  INNER JOIN most_recent_file
  /* -- get the most recent listing, cuz ff_api_listings tbl is a log table */
  ON most_recent_file.fps_stock_point_id = listing.fps_stock_point_id
  AND most_recent_file.file_time = listing.file_time
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_product_relations` AS relations
  ON listing.store_barcode = COALESCE(CAST(simple_product_id AS string), CAST(configurable_product_id AS string))

)

SELECT * FROM current_listing
  );
    