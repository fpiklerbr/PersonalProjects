

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_product_color`
  
  
  OPTIONS()
  as (
    

WITH products AS (

  SELECT * FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_product_relations`

), colors AS (

  SELECT
      color_ids.product_id
    , color_ids.option_id AS color_id
    , color_names.option_value AS color_name
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_index_eav` AS color_ids
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__eav_attribute_option_value` AS color_names
    ON color_ids.option_id = color_names.option_id
  WHERE color_ids.attribute_id = 144
    AND color_ids.store_id IN (0, 1)
    AND color_names.store_id IN (0, 1)

), product_colors AS (

  SELECT
      products.simple_sku
    , colors.color_id
    , colors.color_name
  FROM products
  INNER JOIN colors
    ON products.simple_product_id = colors.product_id
  UNION DISTINCT
  SELECT
      products.simple_sku
    , colors.color_id
    , colors.color_name
  FROM products
  INNER JOIN colors
    ON products.configurable_product_id = colors.product_id

), final AS (

  SELECT *
    , current_timestamp rebuild_timestamp
  FROM product_colors

)

SELECT * FROM final
  );
    