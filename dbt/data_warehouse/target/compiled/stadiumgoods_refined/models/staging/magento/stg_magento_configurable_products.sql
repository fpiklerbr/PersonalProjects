SELECT
    configurable_products.product_id AS configurable_product_id
  , configurable_products.sku AS configurable_sku
  , configurable_products.x3_sku AS product_number
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity` AS configurable_products
WHERE configurable_products.product_type = 'configurable'