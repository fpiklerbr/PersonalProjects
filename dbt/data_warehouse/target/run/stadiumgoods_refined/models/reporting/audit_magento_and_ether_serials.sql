

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`audit_magento_and_ether_serials`
  OPTIONS()
  as WITH serials AS (

  SELECT serial_number
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`ether__vw_zserialupds_dss`
  UNION DISTINCT
  SELECT serial_number
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__serializedproduct_product_serial`

)

SELECT
    serials.serial_number
  , ( 
magento.serial_number IS NOT NULL
AND ether.serial_number IS NOT NULL
AND TIMESTAMP_DIFF(ether._synched_from_source_at, ether.last_modified_at, MINUTE) > 30
AND magento_sources.source_name IN ('X3', 'DSS', 'Ether')
AND magento_statuses.status_name NOT IN ('Offline', 'Reserved')
AND NOT (ether.comment = 'withdrawn' AND magento_statuses.status_name IN ('Purchased', 'Dss Withdrawn'))
 ) AS is_expected_to_be_in_sync
  , (
      
magento.serial_number IS NOT NULL
AND ether.serial_number IS NOT NULL
AND TIMESTAMP_DIFF(ether._synched_from_source_at, ether.last_modified_at, MINUTE) > 30
AND magento_sources.source_name IN ('X3', 'DSS', 'Ether')
AND magento_statuses.status_name NOT IN ('Offline', 'Reserved')
AND NOT (ether.comment = 'withdrawn' AND magento_statuses.status_name IN ('Purchased', 'Dss Withdrawn'))

      AND (
        magento_warehouses.warehouse_name <> ether.warehouse_code
        OR magento.simple_sku <> ether.simple_sku
        OR magento.price <> ether.price_base_amount
        OR magento.status_id <> ether.magento__serializedproduct_product_serial_status_id
      )
    ) AS is_out_of_sync
  , CASE
      WHEN magento_warehouses.warehouse_name <> ether.warehouse_code
      THEN concat(magento_warehouses.warehouse_name, ':', ether.warehouse_code)
      ELSE cast('match' AS string)
    END AS warehouse
  , CASE
      WHEN magento.location <> ether.location_0
      THEN concat(magento.location, ':', ether.location_0)
      ELSE cast('match' AS string)
    END AS warehouse_code_location
  , ether.location_0 as ether_warehouse_code_location
  , ether.warehouse_code AS physical_location
  , CASE
      WHEN magento.simple_sku <> ether.simple_sku
      THEN concat(magento.simple_sku, ':', ether.simple_sku)
      ELSE cast('match' AS string)
    END AS sku
  , CASE
      WHEN magento.price <> ether.price_base_amount
      THEN concat(magento.price, ':', ether.price_base_amount)
      ELSE cast('match' AS string)
    END AS price
  , CASE
      WHEN magento.price <> ether.price_base_amount
      THEN ((magento.price - ether.price_base_amount) / ether.price_base_amount)
    END AS variance
  , CASE
      WHEN magento.status_id <> ether.magento__serializedproduct_product_serial_status_id
      THEN concat(magento_statuses.status_name, ':', ether_statuses.status_name)
      ELSE cast('match' AS string)
    END AS status
  , ether.serial_number AS ether_serial_number
  , ether_statuses.status_name AS ether_status
  , ether.last_modified_at AS ether_last_modified_at
  , ether._synched_from_source_at AS ether_synced_from_source_at
  , magento.serial_number AS magento_serial_number
  , magento.updated_at AS magento_updated_at
  , magento._synched_from_source_at AS magento_synced_from_source_at
FROM serials
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__serializedproduct_product_serial` AS magento
  ON serials.serial_number = magento.serial_number
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__serializedproduct_product_serial_warehouse` AS magento_warehouses
  ON magento.warehouse_id = magento_warehouses.warehouse_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__serializedproduct_product_serial_source` AS magento_sources
  ON magento.source_id = magento_sources.source_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__serializedproduct_product_serial_status` AS magento_statuses
  ON magento.status_id = magento_statuses.status_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`ether__vw_zserialupds_dss` AS ether
  ON serials.serial_number = ether.serial_number
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__serializedproduct_product_serial_status` AS ether_statuses
  ON ether.magento__serializedproduct_product_serial_status_id = ether_statuses.status_id;

