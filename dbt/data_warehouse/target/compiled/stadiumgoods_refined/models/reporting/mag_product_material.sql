

WITH products AS (

  SELECT * FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_product_relations`

), material_ids AS (

  SELECT
      product_id
    , store_id
    , option_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity_varchar`, UNNEST(SPLIT(attribute_value,
  ','
)) AS option_id
  WHERE attribute_id = 209
    AND store_id IN (0, 1)

), product_materials AS (

  SELECT
      material_ids.product_id
    , material_names.option_id AS material_id
    , material_names.option_value AS material_name
  FROM material_ids
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__eav_attribute_option_value` AS material_names
    ON material_ids.option_id = CAST(material_names.option_id AS string)
    AND material_ids.store_id = material_names.store_id

), products_union AS (

  SELECT
      products.simple_sku
    , product_materials.material_id
    , product_materials.material_name
  FROM products
  INNER JOIN product_materials
    ON products.simple_product_id = product_materials.product_id
  UNION DISTINCT
  SELECT
      products.simple_sku
    , product_materials.material_id
    , product_materials.material_name
  FROM products
  INNER JOIN product_materials
    ON products.configurable_product_id = product_materials.product_id

), final AS (

  SELECT *
    , current_timestamp AS rebuild_timestamp
  FROM products_union

)

SELECT * FROM final