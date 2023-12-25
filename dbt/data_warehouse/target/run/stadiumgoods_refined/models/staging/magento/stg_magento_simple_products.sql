

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_simple_products`
  OPTIONS()
  as SELECT
    simple_products.product_id AS simple_product_id
  , simple_products.sku AS simple_sku
  , simple_products.x3_sku AS product_number
  , simple_products.sku_size AS variant_size
  , catalog_product_relation.configurable_product_id
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity` AS simple_products
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_relation` AS catalog_product_relation
  ON simple_products.product_id = catalog_product_relation.simple_product_id
WHERE simple_products.product_type = 'simple';

