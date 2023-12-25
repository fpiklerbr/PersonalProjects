

WITH categories AS (

  SELECT
      category_id
    , category_path
    , array_length(category_path) AS path_length
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_category_entity`
  WHERE category_level > 1

), active_categories AS (

  SELECT
      category_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_category_entity_int`
  WHERE attribute_id = 42
    AND store_id IN (0, 1)
    AND attribute_value = 1

), category_names AS (

  SELECT
      category_id
    , attribute_value AS category_name
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_category_entity_varchar`
  WHERE attribute_id = 41
    AND store_id IN (0, 1)

), final AS (

  SELECT
      active_categories.category_id
    , category_names.category_name
    , categories.category_path
    , categories.path_length
    , current_timestamp AS rebuild_timestamp
  FROM active_categories
  INNER JOIN category_names
    ON active_categories.category_id = category_names.category_id
  INNER JOIN categories
    ON active_categories.category_id = categories.category_id

)

SELECT * FROM final