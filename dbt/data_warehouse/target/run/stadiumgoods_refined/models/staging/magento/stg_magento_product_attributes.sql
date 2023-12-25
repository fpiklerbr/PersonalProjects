

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_product_attributes`
  OPTIONS()
  as /*
depends on:
  ref('catalog_product_entity_datetime')
  ref('catalog_product_entity_decimal')
  ref('catalog_product_entity_int')
  ref('catalog_product_entity_media_gallery')
  ref('catalog_product_entity_text')
  ref('catalog_product_entity_varchar')
*/WITH products AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity`

), attributes AS (

  
  SELECT
      'catalog_product_entity_datetime' AS catalog_table
    , products.entity_type_id
    , attribute_values.attribute_id
    , products.product_type
    , COUNT(DISTINCT attribute_values.attribute_value) AS value_count
    , COUNT(DISTINCT attribute_values.product_id) AS product_count
    , COUNT(attribute_values.attribute_value) AS product_value_count
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity_datetime` AS attribute_values
  INNER JOIN products
    ON attribute_values.product_id = products.product_id
    AND attribute_values.entity_type_id = products.entity_type_id
  GROUP BY 1, 2, 3, 4
  UNION ALL
  
  SELECT
      'catalog_product_entity_decimal' AS catalog_table
    , products.entity_type_id
    , attribute_values.attribute_id
    , products.product_type
    , COUNT(DISTINCT attribute_values.attribute_value) AS value_count
    , COUNT(DISTINCT attribute_values.product_id) AS product_count
    , COUNT(attribute_values.attribute_value) AS product_value_count
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity_decimal` AS attribute_values
  INNER JOIN products
    ON attribute_values.product_id = products.product_id
    AND attribute_values.entity_type_id = products.entity_type_id
  GROUP BY 1, 2, 3, 4
  UNION ALL
  
  SELECT
      'catalog_product_entity_int' AS catalog_table
    , products.entity_type_id
    , attribute_values.attribute_id
    , products.product_type
    , COUNT(DISTINCT attribute_values.attribute_value) AS value_count
    , COUNT(DISTINCT attribute_values.product_id) AS product_count
    , COUNT(attribute_values.attribute_value) AS product_value_count
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity_int` AS attribute_values
  INNER JOIN products
    ON attribute_values.product_id = products.product_id
    AND attribute_values.entity_type_id = products.entity_type_id
  GROUP BY 1, 2, 3, 4
  UNION ALL
  
  SELECT
      'catalog_product_entity_media_gallery' AS catalog_table
    , products.entity_type_id
    , attribute_values.attribute_id
    , products.product_type
    , COUNT(DISTINCT attribute_values.attribute_value) AS value_count
    , COUNT(DISTINCT attribute_values.product_id) AS product_count
    , COUNT(attribute_values.attribute_value) AS product_value_count
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity_media_gallery` AS attribute_values
  INNER JOIN products
    ON attribute_values.product_id = products.product_id
    
  GROUP BY 1, 2, 3, 4
  UNION ALL
  
  SELECT
      'catalog_product_entity_text' AS catalog_table
    , products.entity_type_id
    , attribute_values.attribute_id
    , products.product_type
    , COUNT(DISTINCT attribute_values.attribute_value) AS value_count
    , COUNT(DISTINCT attribute_values.product_id) AS product_count
    , COUNT(attribute_values.attribute_value) AS product_value_count
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity_text` AS attribute_values
  INNER JOIN products
    ON attribute_values.product_id = products.product_id
    AND attribute_values.entity_type_id = products.entity_type_id
  GROUP BY 1, 2, 3, 4
  UNION ALL
  
  SELECT
      'catalog_product_entity_varchar' AS catalog_table
    , products.entity_type_id
    , attribute_values.attribute_id
    , products.product_type
    , COUNT(DISTINCT attribute_values.attribute_value) AS value_count
    , COUNT(DISTINCT attribute_values.product_id) AS product_count
    , COUNT(attribute_values.attribute_value) AS product_value_count
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity_varchar` AS attribute_values
  INNER JOIN products
    ON attribute_values.product_id = products.product_id
    AND attribute_values.entity_type_id = products.entity_type_id
  GROUP BY 1, 2, 3, 4
  
  

), final AS (

  SELECT
      attributes.*
    , catalog_eav_attribute.apply_to
    , eav_attribute.backend_type
    , eav_attribute.frontend_input
    , eav_attribute.attribute_code
    , eav_attribute.frontend_label
    , eav_attribute.is_unique
    , eav_attribute.is_required
  FROM attributes
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_eav_attribute` AS catalog_eav_attribute
    ON attributes.attribute_id = catalog_eav_attribute.attribute_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__eav_attribute` AS eav_attribute
    ON attributes.entity_type_id = eav_attribute.entity_type_id
    AND attributes.attribute_id = eav_attribute.attribute_id

)

SELECT * FROM final;

