

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_products`
  
  
  OPTIONS()
  as (
    -- depends_on: `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity_int`
-- depends_on: `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity_varchar`
-- depends_on: `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity_text`
-- depends_on: `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__eav_attribute_option_value`
-- depends_on: `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__eav_attribute`
WITH product_relations AS (

  SELECT * FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_product_relations`

), final AS (

  SELECT
      product_relations.sku
    , product_relations.product_type
    , string_agg(DISTINCT product_relations.simple_sku, ', ') AS simple_sku
    , count(DISTINCT product_relations.simple_product_id) = 1 AS simple_sku_has_unique_id
    , array_agg(DISTINCT product_relations.simple_product_id
        IGNORE NULLS) AS simple_product_id
    , count(DISTINCT product_relations.configurable_product_id) = 1 AS simple_has_unique_configurable
    , string_agg(DISTINCT product_relations.configurable_sku, ', ') AS configurable_sku
    , count(DISTINCT product_relations.configurable_product_id) = count(DISTINCT product_relations.configurable_sku) AS configurable_sku_has_unique_id
    , array_agg(DISTINCT product_relations.configurable_product_id
        IGNORE NULLS) AS configurable_product_id
    , min(product_relations.simple_product_creation_nyc) AS simple_product_creation_nyc
    , min(product_relations.configurable_product_creation_nyc) AS configurable_product_creation_nyc
    
          , count( CASE WHEN coalesce(simple_attributes.status_value, 0) = 1
            THEN 1 END
            ) > 0 AS simple_is_enabled
        
          , count( CASE WHEN coalesce(configurable_attributes.status_value, 0) = 1
            THEN 1 END
            ) > 0 AS configurable_is_enabled
        
          , string_agg(
              DISTINCT simple_attributes.brand_value, ', '
            ) AS simple_brand
        
          , string_agg(
              DISTINCT configurable_attributes.brand_value, ', '
            ) AS configurable_brand
        
          , string_agg(
              DISTINCT simple_attributes.gender_value, ', '
            ) AS simple_gender
        
          , string_agg(
              DISTINCT configurable_attributes.gender_value, ', '
            ) AS configurable_gender
        
          , string_agg(
              DISTINCT simple_attributes.size_value, ', '
            ) AS simple_size
        
          , string_agg(
              DISTINCT configurable_attributes.size_value, ', '
            ) AS configurable_size
        
          , string_agg(
              DISTINCT simple_attributes.name_value, ', '
            ) AS simple_name
        
          , string_agg(
              DISTINCT configurable_attributes.name_value, ', '
            ) AS configurable_name
        
          , string_agg(
              DISTINCT simple_attributes.manufacturer_sku_value, ', '
            ) AS simple_mfg_sku
        
          , string_agg(
              DISTINCT configurable_attributes.manufacturer_sku_value, ', '
            ) AS configurable_mfg_sku
        
          , string_agg(
              DISTINCT simple_attributes.colorway_value, ', '
            ) AS simple_colorway
        
          , string_agg(
              DISTINCT configurable_attributes.colorway_value, ', '
            ) AS configurable_colorway
        
          , string_agg(
              DISTINCT simple_attributes.nickname_value, ', '
            ) AS simple_nickname
        
          , string_agg(
              DISTINCT configurable_attributes.nickname_value, ', '
            ) AS configurable_nickname
        
          , string_agg(
              DISTINCT simple_attributes.upc_value, ', '
            ) AS simple_upc
        
          , string_agg(
              DISTINCT configurable_attributes.upc_value, ', '
            ) AS configurable_upc
        
          , string_agg(
              DISTINCT simple_attributes.url_key_value, ', '
            ) AS simple_url_key
        
          , string_agg(
              DISTINCT configurable_attributes.url_key_value, ', '
            ) AS configurable_url_key
        
          , string_agg(
              DISTINCT simple_attributes.url_path_value, ', '
            ) AS simple_url_path
        
          , string_agg(
              DISTINCT configurable_attributes.url_path_value, ', '
            ) AS configurable_url_path
        
          , string_agg(
              DISTINCT simple_attributes.country_of_origin_value, ', '
            ) AS simple_country_of_origin
        
          , string_agg(
              DISTINCT configurable_attributes.country_of_origin_value, ', '
            ) AS configurable_country_of_origin
        
          , string_agg(
              DISTINCT simple_attributes.x3_product_type_value, ', '
            ) AS simple_x3_product_type
        
          , string_agg(
              DISTINCT configurable_attributes.x3_product_type_value, ', '
            ) AS configurable_x3_product_type
        
          , string_agg(
              DISTINCT simple_attributes.description_value, ', '
            ) AS simple_description
        
          , string_agg(
              DISTINCT configurable_attributes.description_value, ', '
            ) AS configurable_description
        
          , string_agg(
              DISTINCT simple_attributes.short_description_value, ', '
            ) AS simple_short_description
        
          , string_agg(
              DISTINCT configurable_attributes.short_description_value, ', '
            ) AS configurable_short_description
        
    , string_agg(DISTINCT sg_farfetch_product.fps_parent_product_id, ', ') AS fps_parent_product_id
    , string_agg(DISTINCT size_scales.sg_size_scale_name, ', ') AS sg_size_scale_name
    , current_timestamp AS rebuild_timestamp
    , min(sg_farfetch_product.created_at) as mag_fps_parent_product_id_created_at
  FROM product_relations
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sg_farfetch_product` AS sg_farfetch_product
    ON product_relations.configurable_product_id = sg_farfetch_product.configurable_product_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`sales_channel__farfetch_sg_size_scales` size_scales
    ON sg_farfetch_product.sg_size_scale_id = size_scales.sg_size_scale_id
  
    LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_product_attribute_values` AS simple_attributes
      ON simple_attributes.product_id = product_relations.simple_product_id
  
    LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_product_attribute_values` AS configurable_attributes
      ON configurable_attributes.product_id = product_relations.configurable_product_id
  
  GROUP BY 1, 2

)

SELECT * FROM final
  );
    