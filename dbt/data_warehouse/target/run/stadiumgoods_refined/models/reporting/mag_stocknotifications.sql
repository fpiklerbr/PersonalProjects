

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_stocknotifications`
  
  
  OPTIONS()
  as (
    

SELECT DISTINCT
    stocknotifications.*
  , product_relations.simple_sku
, DATETIME(SAFE_CAST(stocknotifications.created_at AS timestamp), 'America/New_York') AS notification_creation_nyc
  , current_timestamp AS rebuild_timestamp
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sumoheavy_stocknotifications` AS stocknotifications
INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_product_relations` AS product_relations
  ON stocknotifications.configurable_product_id = product_relations.configurable_product_id
INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_product_attribute_values` AS product_attributes
  ON product_relations.simple_product_id = product_attributes.product_id
  AND stocknotifications.size_value = product_attributes.size_value
  );
    