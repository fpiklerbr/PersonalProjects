

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products`
  
  
  OPTIONS()
  as (
    

WITH intake AS (

  SELECT
      simple_sku
    , serial_number
    , row_number() OVER (PARTITION BY simple_sku ORDER BY original_intake_creation_nyc) AS simple_sku_intake_row
    , original_intake_creation_nyc
    , original_intake_warehouse
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_serial_tmp_info`
  WHERE original_intake_creation_nyc IS NOT NULL

), final AS (

  SELECT
      product_attributes.*
    , image_import_products.`image_import_imported_at`,
  image_import_products.`image_import_imported_image_count`,
  image_import_products.`image_import_imported_error_count`,
  image_import_products.`image_import_failed_missing_at`,
  image_import_products.`image_import_failed_missing_image_count`,
  image_import_products.`image_import_failed_missing_error_count`,
  image_import_products.`image_import_reimported_at`,
  image_import_products.`image_import_reimported_image_count`,
  image_import_products.`image_import_reimported_error_count`,
  image_import_products.`image_import_failed_multiple_at`,
  image_import_products.`image_import_failed_multiple_image_count`,
  image_import_products.`image_import_failed_multiple_error_count`,
  image_import_products.`image_import_imported_incomplete_at`,
  image_import_products.`image_import_imported_incomplete_image_count`,
  image_import_products.`image_import_imported_incomplete_error_count`
    , intake.original_intake_warehouse AS x3_first_intake_warehouse
    , intake.original_intake_creation_nyc AS x3_first_intake_creation_nyc
    , current_timestamp AS rebuild_timestamp
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_products` AS product_attributes
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_image_import_products` AS image_import_products
    ON product_attributes.mfg_sku = image_import_products.mfg_sku
  LEFT JOIN intake
    ON product_attributes.simple_sku = intake.simple_sku
    AND intake.simple_sku_intake_row = 1

)

SELECT * FROM final
  );
    