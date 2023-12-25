WITH product_agg AS (

  SELECT
      snapshot_products.configurable_product_id
    , min(CASE WHEN snapshot_products.mag_pdp_status = 'success' THEN snapshots.created_at END) AS first_mag_pdp_success_at
    , max(CASE WHEN snapshot_products.mag_pdp_status = 'success' THEN snapshots.created_at END) AS last_mag_pdp_success_at
    , min(CASE WHEN snapshot_products.fps_pdp_status = 'success' THEN snapshots.created_at END) AS first_fps_pdp_success_at
    , max(CASE WHEN snapshot_products.fps_pdp_status = 'success' THEN snapshots.created_at END) AS last_fps_pdp_success_at
    , max(snapshot_products.fps_catalog_parity_snapshot_id) AS last_fps_catalog_parity_snapshot_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`sales_channel__fps_catalog_parity_snapshot_products` AS snapshot_products
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`sales_channel__fps_catalog_parity_snapshots` AS snapshots
    ON snapshot_products.fps_catalog_parity_snapshot_id = snapshots.fps_catalog_parity_snapshot_id
  GROUP BY 1

)

SELECT
    product_agg.*
  , last_snapshot.created_at AS last_fps_catalog_parity_snapshot_created_at
  , last_snapshot_product.mag_pdp_status AS last_mag_pdp_status
  , last_snapshot_product.fps_pdp_status AS last_fps_pdp_status
  , last_snapshot_product.size_scale_mapping_status AS last_size_scale_mapping_status
  , configurable_products.product_number
FROM product_agg
INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`sales_channel__fps_catalog_parity_snapshots` AS last_snapshot
  ON product_agg.last_fps_catalog_parity_snapshot_id = last_snapshot.fps_catalog_parity_snapshot_id
INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`sales_channel__fps_catalog_parity_snapshot_products` AS last_snapshot_product
  ON product_agg.last_fps_catalog_parity_snapshot_id = last_snapshot_product.fps_catalog_parity_snapshot_id
  and product_agg.configurable_product_id = last_snapshot_product.configurable_product_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_configurable_products` AS configurable_products
  ON product_agg.configurable_product_id = configurable_products.configurable_product_id