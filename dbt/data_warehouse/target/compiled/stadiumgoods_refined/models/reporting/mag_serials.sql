

WITH simple_products AS (

  SELECT
      sku AS simple_sku
    , array_agg(product_id) AS simple_product_ids
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity`
  WHERE sku IS NOT NULL
    AND product_type = 'simple'
  GROUP BY 1

), conditions AS (

  SELECT
      serial_conditions.serializedproduct_product_serial_id
    , string_agg(
        conditions.condition_name, ', ' ORDER BY conditions.condition_name
      ) AS conditions
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__serializedproduct_product_serial_condition` AS serial_conditions
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__serializedproduct_product_condition` AS conditions
    ON serial_conditions.serializedproduct_product_condition_id = conditions.serializedproduct_product_condition_id
    AND conditions.condition_name <> 'Good'
  GROUP BY 1

), final AS (

  SELECT
      serials.serial_number
    , serials.serializedproduct_product_serial_id AS serial_id
    , serials.simple_sku
    , serials.price
, DATETIME(SAFE_CAST(serials.created_at AS timestamp), 'America/New_York') AS serial_creation_nyc
    , coalesce(statuses.status_name, cast(serials.status_id AS string)) AS status
    , coalesce(warehouses.warehouse_name, CAST(serials.warehouse_id AS string)) AS warehouse
    , serials.mag_order_id
    , conditions.conditions
    , CASE
        WHEN sources.is_dropshipped THEN sources.source_code
        WHEN substr(serial_number,1,2) = 'd-' THEN 'dsco'
        WHEN substr(serial_number,1,4) = 'dss-' THEN 'dss'
      END AS dropshipper_type
    , suppliers.dropshipper_id
    , suppliers.name AS dropshipper_name
    , serials.dropshipper_item_id
    , dropshippers.commission_rate AS dropshipper_commission_rate
    , simple_products.simple_product_ids
    , CASE
        WHEN sources.is_dropshipped THEN substr(
    concat(
    
      coalesce(sources.source_name|| '-' , '')
    
      , coalesce(serials.supplier_acronym|| '-' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(sources.source_name|| '-' , '')
    
      , coalesce(serials.supplier_acronym|| '-' , '')
    
  )) - length('-')
      , 0
    )
)
      END AS serial_source
    , CAST((CASE WHEN sources.is_dropshipped THEN '3P' END) AS string) AS serial_relationship
    , CAST((CASE WHEN sources.is_dropshipped THEN 'Dropship' END) AS string) AS serial_inventory
    , serials.supplier_acronym
, DATETIME(SAFE_CAST(serials.updated_at AS timestamp), 'America/New_York') AS serial_update_nyc
    , current_timestamp AS rebuild_timestamp
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__serializedproduct_product_serial` AS serials
  LEFT JOIN simple_products
    ON serials.simple_sku = simple_products.simple_sku
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__serializedproduct_product_serial_warehouse` AS warehouses
    ON serials.warehouse_id = warehouses.warehouse_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__serializedproduct_product_serial_status` AS statuses
    ON serials.status_id = statuses.status_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__serializedproduct_product_serial_source` AS sources
    ON serials.source_id = sources.source_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sg_dsco_supplier` AS suppliers
    ON serials.supplier_acronym = suppliers.supplier_acronym
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_dropshippers` AS dropshippers
    ON suppliers.dropshipper_id = dropshippers.dropshipper_id
  LEFT JOIN conditions
    ON serials.serializedproduct_product_serial_id = conditions.serializedproduct_product_serial_id

)

SELECT * FROM final