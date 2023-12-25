

WITH active_categories AS (

  SELECT
      category_id
    , category_name
    , category_path
    , p_id
    , path_length
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_active_categories`, UNNEST(category_path) as p_id

), assigned_categories AS (

  SELECT
      configurable_product_id
    , category_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_category_product`

), product_relations AS (

  SELECT
      simple_sku
    , simple_product_id
    , configurable_product_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_product_relations`
  WHERE simple_sku IS NOT NULL
    AND configurable_product_id IS NOT NULL

), product_brands AS (

  SELECT
      product_id
    , brand_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_product_attribute_values`
  WHERE brand_value IS NOT NULL

), products AS (

  SELECT
      product_relations.simple_sku
    , upper(coalesce(configurable_brands.brand_value, simple_brands.brand_value)) AS product_brand_name
    , product_relations.configurable_product_id
  FROM product_relations
  LEFT JOIN product_brands AS configurable_brands
    ON product_relations.configurable_product_id = configurable_brands.product_id
  LEFT JOIN product_brands AS simple_brands
    ON product_relations.simple_product_id = simple_brands.product_id

), brand_categories AS (

  SELECT
      category_id AS brand_category_id
    , upper(category_name) AS brand_category_name
  FROM active_categories
  WHERE EXISTS (
    SELECT *
    FROM products
    WHERE product_brand_name = upper(active_categories.category_name)
  )

), parent_child_join AS (

-- BQ doesnt support DISTINCT apply to array col
  SELECT
      parent_categories.category_id AS parent_category_id
    , parent_categories.category_name AS parent_category_name
    , ARRAY_AGG(parent_categories.p_id ORDER BY parent_categories.p_id ASC) AS parent_category_path
    , child_categories.category_id AS child_category_id
    , child_categories.category_name AS child_category_name
    , child_categories.path_length AS child_category_path_length
    , max(child_categories.path_length)
        OVER (PARTITION BY parent_categories.category_id)
      AS max_child_category_path_length_within_parent_category
  FROM active_categories AS parent_categories
  INNER JOIN active_categories AS child_categories
    ON CAST(parent_categories.category_id AS string) = child_categories.p_id
  GROUP BY 1,2,4,5,6

), inherited_categories AS (

 -- additional join, because in BQ the array cannot be in the group by position
  SELECT
    parent_child_join.*
  , source_category.category_path AS child_category_path
  FROM parent_child_join
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_active_categories` AS source_category
  ON source_category.category_id = parent_child_join.child_category_id

), product_categories AS (

  SELECT DISTINCT
      products.simple_sku
    , products.product_brand_name
    , inherited_categories.parent_category_id AS category_id
    , inherited_categories.parent_category_name AS category_name
  FROM products
  INNER JOIN assigned_categories
    ON products.configurable_product_id = assigned_categories.configurable_product_id
  INNER JOIN inherited_categories
    ON assigned_categories.category_id = inherited_categories.child_category_id

), brand_subcategories AS (

  SELECT
      brand_categories.brand_category_id
    , brand_categories.brand_category_name
    , inherited_categories.child_category_id AS subcategory_id
    , inherited_categories.child_category_name AS subcategory_name
    , inherited_categories.child_category_path AS subcategory_path
  FROM brand_categories
  INNER JOIN inherited_categories
    ON brand_categories.brand_category_id = inherited_categories.parent_category_id
  WHERE inherited_categories.parent_category_id <> inherited_categories.child_category_id
    AND inherited_categories.child_category_path_length = inherited_categories.max_child_category_path_length_within_parent_category

), final AS (

  SELECT
      product_categories.simple_sku
    , product_categories.category_id
    , product_categories.category_name
    , CASE
        WHEN brand_categories.brand_category_id IS NOT NULL
          THEN CAST('Brand' AS string)
        WHEN brand_subcategories.subcategory_id IS NOT NULL
          THEN CAST('Subcategory' AS string)
        ELSE
          CAST('Other' AS string)
      END AS category_type
  FROM product_categories
  LEFT JOIN brand_categories
    ON product_categories.category_id = brand_categories.brand_category_id
    AND product_categories.product_brand_name = brand_categories.brand_category_name
  LEFT JOIN brand_subcategories
    ON product_categories.category_id = brand_subcategories.subcategory_id
    AND product_categories.product_brand_name = brand_subcategories.brand_category_name

)

SELECT * FROM final