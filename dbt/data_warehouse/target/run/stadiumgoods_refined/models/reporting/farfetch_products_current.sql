

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`farfetch_products_current`
  
  
  OPTIONS()
  as (
    

WITH farfetch_products AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__storm_products`

), max_farfetch AS (

  SELECT
    max(farfetch_date) AS farfetch_date
  FROM farfetch_products

), final AS (

  SELECT DISTINCT
      farfetch_products.farfetch_date
    , farfetch_products.mfg_sku
    , CAST(
        coalesce(api_parent_items.fps_parent_product_id, farfetch_products.fps_child_product_id) AS int64
      ) AS farfetch_product_id
    , current_timestamp AS rebuild_timestamp
  FROM farfetch_products
  INNER JOIN max_farfetch
    ON farfetch_products.farfetch_date = max_farfetch.farfetch_date
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__api_parent_items` AS api_parent_items
    ON farfetch_products.fps_child_product_id = api_parent_items.fps_child_product_id

)

SELECT * FROM final
  );
    