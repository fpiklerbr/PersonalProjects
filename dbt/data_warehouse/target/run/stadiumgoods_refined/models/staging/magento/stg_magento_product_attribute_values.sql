

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_product_attribute_values`
  
  
  OPTIONS()
  as (
    -- depends_on: `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity_int`
-- depends_on: `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity_varchar`
-- depends_on: `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity_text`
-- depends_on: `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__eav_attribute_option_value`
-- depends_on: `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__eav_attribute`

WITH products AS (

  SELECT product_id FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity`

)
, product_status AS (

            
                    SELECT DISTINCT
                        product_id
                      , attribute_value AS status_value
                    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity_int`
                    WHERE attribute_id = 96
                      AND attribute_value IS NOT NULL
                      AND product_id IS NOT NULL
                      AND store_id IN (0, 1)
                

        )

, product_brand AS (

            
                    SELECT DISTINCT
                        entity_option.product_id
                      , option_value.option_value AS brand_value
                    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity_int` AS entity_option
                    INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__eav_attribute_option_value` AS option_value
                      ON entity_option.attribute_value = option_value.option_id
                      AND entity_option.store_id = option_value.store_id
                    WHERE entity_option.attribute_id = 139
                      AND option_value.option_value IS NOT NULL
                      AND entity_option.product_id IS NOT NULL
                      AND entity_option.store_id IN (0, 1)
                

        )

, product_gender AS (

            
                    SELECT DISTINCT
                        entity_option.product_id
                      , option_value.option_value AS gender_value
                    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity_int` AS entity_option
                    INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__eav_attribute_option_value` AS option_value
                      ON entity_option.attribute_value = option_value.option_id
                      AND entity_option.store_id = option_value.store_id
                    WHERE entity_option.attribute_id = 141
                      AND option_value.option_value IS NOT NULL
                      AND entity_option.product_id IS NOT NULL
                      AND entity_option.store_id IN (0, 1)
                

        )

, product_size AS (

            
                    SELECT DISTINCT
                        entity_option.product_id
                      , option_value.option_value AS size_value
                    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity_int` AS entity_option
                    INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__eav_attribute_option_value` AS option_value
                      ON entity_option.attribute_value = option_value.option_id
                      AND entity_option.store_id = option_value.store_id
                    WHERE entity_option.attribute_id = 132
                      AND option_value.option_value IS NOT NULL
                      AND entity_option.product_id IS NOT NULL
                      AND entity_option.store_id IN (0, 1)
                

        )

, product_name AS (

            
                SELECT DISTINCT
                    product_id
                  , attribute_value AS name_value
                FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity_varchar`
                WHERE attribute_id = 71
                  AND attribute_value IS NOT NULL
                  AND product_id IS NOT NULL
                  AND store_id IN (0, 1)
            

        )

, product_manufacturer_sku AS (

            
                SELECT DISTINCT
                    product_id
                  , attribute_value AS manufacturer_sku_value
                FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity_varchar`
                WHERE attribute_id = 143
                  AND attribute_value IS NOT NULL
                  AND product_id IS NOT NULL
                  AND store_id IN (0, 1)
            

        )

, product_colorway AS (

            
                SELECT DISTINCT
                    product_id
                  , attribute_value AS colorway_value
                FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity_varchar`
                WHERE attribute_id = 140
                  AND attribute_value IS NOT NULL
                  AND product_id IS NOT NULL
                  AND store_id IN (0, 1)
            

        )

, product_nickname AS (

            
                SELECT DISTINCT
                    product_id
                  , attribute_value AS nickname_value
                FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity_varchar`
                WHERE attribute_id = 142
                  AND attribute_value IS NOT NULL
                  AND product_id IS NOT NULL
                  AND store_id IN (0, 1)
            

        )

, product_upc AS (

            
                SELECT DISTINCT
                    product_id
                  , attribute_value AS upc_value
                FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity_varchar`
                WHERE attribute_id = 188
                  AND attribute_value IS NOT NULL
                  AND product_id IS NOT NULL
                  AND store_id IN (0, 1)
            

        )

, product_url_key AS (

            
                SELECT DISTINCT
                    product_id
                  , attribute_value AS url_key_value
                FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity_varchar`
                WHERE attribute_id = 97
                  AND attribute_value IS NOT NULL
                  AND product_id IS NOT NULL
                  AND store_id IN (0, 1)
            

        )

, product_url_path AS (

            
                SELECT DISTINCT
                    product_id
                  , attribute_value AS url_path_value
                FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity_varchar`
                WHERE attribute_id = 98
                  AND attribute_value IS NOT NULL
                  AND product_id IS NOT NULL
                  AND store_id IN (0, 1)
            

        )

, product_country_of_origin AS (

            
                SELECT DISTINCT
                    product_id
                  , attribute_value AS country_of_origin_value
                FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity_varchar`
                WHERE attribute_id = 244
                  AND attribute_value IS NOT NULL
                  AND product_id IS NOT NULL
                  AND store_id IN (0, 1)
            

        )

, product_x3_product_type AS (

            
                SELECT DISTINCT
                    product_id
                  , attribute_value AS x3_product_type_value
                FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity_varchar`
                WHERE attribute_id = 293
                  AND attribute_value IS NOT NULL
                  AND product_id IS NOT NULL
                  AND store_id IN (0, 1)
            

        )

, product_description AS (

            
                SELECT DISTINCT
                    product_id
                  , attribute_value AS description_value
                FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity_text`
                WHERE attribute_id = 72
                  AND attribute_value IS NOT NULL
                  AND product_id IS NOT NULL
                  AND store_id IN (0, 1)
            

        )

, product_short_description AS (

            
                SELECT DISTINCT
                    product_id
                  , attribute_value AS short_description_value
                FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity_text`
                WHERE attribute_id = 73
                  AND attribute_value IS NOT NULL
                  AND product_id IS NOT NULL
                  AND store_id IN (0, 1)
            

        )

, product_x3_size_code AS (

            
                SELECT DISTINCT
                    product_id
                  , attribute_value AS x3_size_code_value
                FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity_varchar`
                WHERE attribute_id = 200
                  AND attribute_value IS NOT NULL
                  AND product_id IS NOT NULL
                  AND store_id IN (0, 1)
            

        )
, final AS (

  SELECT
      products.product_id
    
    , product_status.status_value
    
    , product_brand.brand_value
    
    , product_gender.gender_value
    
    , product_size.size_value
    
    , product_name.name_value
    
    , product_manufacturer_sku.manufacturer_sku_value
    
    , product_colorway.colorway_value
    
    , product_nickname.nickname_value
    
    , product_upc.upc_value
    
    , product_url_key.url_key_value
    
    , product_url_path.url_path_value
    
    , product_country_of_origin.country_of_origin_value
    
    , product_x3_product_type.x3_product_type_value
    
    , product_description.description_value
    
    , product_short_description.short_description_value
    
    , product_x3_size_code.x3_size_code_value
    
    , current_timestamp AS rebuild_timestamp
  FROM products
  
  LEFT JOIN product_status
    ON product_status.product_id = products.product_id
  
  LEFT JOIN product_brand
    ON product_brand.product_id = products.product_id
  
  LEFT JOIN product_gender
    ON product_gender.product_id = products.product_id
  
  LEFT JOIN product_size
    ON product_size.product_id = products.product_id
  
  LEFT JOIN product_name
    ON product_name.product_id = products.product_id
  
  LEFT JOIN product_manufacturer_sku
    ON product_manufacturer_sku.product_id = products.product_id
  
  LEFT JOIN product_colorway
    ON product_colorway.product_id = products.product_id
  
  LEFT JOIN product_nickname
    ON product_nickname.product_id = products.product_id
  
  LEFT JOIN product_upc
    ON product_upc.product_id = products.product_id
  
  LEFT JOIN product_url_key
    ON product_url_key.product_id = products.product_id
  
  LEFT JOIN product_url_path
    ON product_url_path.product_id = products.product_id
  
  LEFT JOIN product_country_of_origin
    ON product_country_of_origin.product_id = products.product_id
  
  LEFT JOIN product_x3_product_type
    ON product_x3_product_type.product_id = products.product_id
  
  LEFT JOIN product_description
    ON product_description.product_id = products.product_id
  
  LEFT JOIN product_short_description
    ON product_short_description.product_id = products.product_id
  
  LEFT JOIN product_x3_size_code
    ON product_x3_size_code.product_id = products.product_id
  

)

SELECT * FROM final
  );
    