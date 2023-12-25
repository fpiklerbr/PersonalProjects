

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_product_image`
  
  
  OPTIONS()
  as (
    

WITH products AS (

  SELECT * FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_product_relations`

), tagged_images AS (

  SELECT
      product_id
    , attribute_value AS image_path
    , string_agg(DISTINCT
        CASE attribute_id
          WHEN 87 THEN 'Thumbnail'
          WHEN 175 THEN 'Facebook'
          WHEN 178 THEN 'Twitter'
          WHEN 181 THEN 'eBay'
          WHEN 219 THEN 'Amazon'
          WHEN 239 THEN 'Zalando'
          WHEN 241 THEN 'Farfetch'
          WHEN 242 THEN 'Nordstrom'
          ELSE NULL
        END, ','
      ) AS image_tags
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity_varchar`
  WHERE attribute_id IN (87, 175, 178, 181, 219, 239, 241, 242)
  GROUP BY 1, 2

), images AS (

  SELECT
      media_gallery.product_id
    , media_gallery.attribute_value AS image_path
    , tagged_images.image_tags
    , max(media_gallery_value.image_is_disabled) AS image_is_disabled
    , min(media_gallery_value.image_position) AS image_position
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity_media_gallery` AS media_gallery
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity_media_gallery_value` AS media_gallery_value
    ON media_gallery.catalog_product_entity_media_gallery_id = media_gallery_value.catalog_product_entity_media_gallery_id
  LEFT JOIN tagged_images
    ON media_gallery.product_id = tagged_images.product_id
    AND media_gallery.attribute_value = tagged_images.image_path
    WHERE media_gallery_value.store_id IN (0, 1)
  GROUP BY 1, 2, 3

), product_images AS (

  SELECT
      products.simple_sku
    , images.image_position
    , images.image_path
    , images.image_is_disabled
    , images.image_tags
    , CAST('configurable' AS string) AS product_type
  FROM products
  INNER JOIN images
    ON images.product_id = products.configurable_product_id
  UNION ALL
  SELECT
      products.simple_sku
    , images.image_position
    , images.image_path
    , images.image_is_disabled
    , images.image_tags
    , CAST('simple' AS string) AS product_type
  FROM products
  INNER JOIN images
    ON images.product_id = products.simple_product_id

), final AS (

  SELECT
      simple_sku
    , image_position
    , image_path
    , image_is_disabled
    , image_tags
    , max(CASE WHEN product_type = 'configurable' THEN 1 ELSE 0 END) = 1 AS configurable_has_image
    , max(CASE WHEN product_type = 'simple' THEN 1 ELSE 0 END) = 1 AS simple_has_image
  FROM product_images
  GROUP BY 1, 2, 3, 4, 5

)

SELECT
   simple_sku
 , image_position
 , image_path
 , image_is_disabled
 , SPLIT(image_tags,
  ','
) AS image_tags
 , configurable_has_image
 , simple_has_image
 , current_timestamp AS rebuild_timestamp
FROM final
  );
    