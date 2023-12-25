

WITH order_items AS (

  SELECT
      sales_flat_order_id
    , sales_flat_order_item_id
    , parent_sales_flat_order_item_id
    , product_id
    , sku
    , CASE WHEN product_type = 'simple' THEN sales_flat_order_item_id END AS simple_item_id
    , CASE WHEN product_type = 'simple' THEN product_id END AS simple_product_id
    , CASE WHEN product_type = 'simple' THEN sku END AS simple_sku
    , CASE WHEN product_type = 'configurable' THEN sales_flat_order_item_id END AS configurable_item_id
    , CASE WHEN product_type = 'configurable' THEN product_id END AS configurable_product_id
    , CASE
        WHEN product_type = 'configurable' AND 


  regexp_contains(sku, r'\|')


        THEN 

    split(
        sku,
        '|'
        )[safe_offset(0)]


      END AS configurable_x3_sku_from_sku
    , CASE WHEN 


  regexp_contains(sku, r'\|')

 THEN 

    split(
        sku,
        '|'
        )[safe_offset(0)]

 END AS x3_sku_from_sku
    , nullif(qty_ordered, 0) AS qty_ordered
    , nullif(base_original_price, 0) AS base_original_price
    , nullif(base_price, 0) AS base_price
    , nullif(base_discount_amount, 0) AS base_discount_amount
    , nullif(base_tax_amount, 0) AS base_tax_amount
    , nullif(qty_canceled, 0) AS qty_canceled
    , nullif(qty_refunded, 0) AS qty_refunded
    , nullif(qty_shipped, 0) AS qty_shipped
    , serializedproduct_product_serial_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order_item`

), product_attributes AS (

  SELECT
      product_id
    , string_agg(DISTINCT x3_size_code_value, ', ') AS x3_size_code_value
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_product_attribute_values`
  GROUP BY 1

), products AS (

  SELECT
      product_entities.product_id
    , CASE WHEN product_entities.product_type = 'simple' THEN product_entities.sku END AS simple_sku
    , CASE WHEN product_entities.product_type = 'configurable' THEN product_entities.x3_sku END AS configurable_x3_sku
    , product_entities.x3_sku
    , CASE
        WHEN product_entities.product_type = 'configurable' AND 


  regexp_contains(product_entities.sku, r'\|')


        THEN 

    split(
        product_entities.sku,
        '|'
        )[safe_offset(0)]


      END AS configurable_x3_sku_from_sku
    , CASE WHEN 


  regexp_contains(sku, r'\|')

 THEN 

    split(
        sku,
        '|'
        )[safe_offset(0)]

 END AS x3_sku_from_sku
    , CASE WHEN product_entities.product_type = 'simple' THEN product_attributes.x3_size_code_value END AS simple_x3_size_code
    , product_attributes.x3_size_code_value AS x3_size_code
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity` AS product_entities
  INNER JOIN product_attributes
    ON product_entities.product_id = product_attributes.product_id

), serials AS (

  SELECT
      serializedproduct_product_serial_id
    , serial_number
    , dropshipper_item_id
    , upper(
  CAST(regexp_extract(serial_number, 
  r'^d.*?-'
) AS string)
) || supplier_acronym AS dropship_source
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__serializedproduct_product_serial`

), final AS (

  SELECT
      parent_item.sales_flat_order_id
    , coalesce(
          child_item.simple_item_id
        , parent_item.simple_item_id
        , parent_item.configurable_item_id
        , child_item.configurable_item_id
      ) AS order_item_id
    , coalesce(child_item.simple_item_id, parent_item.simple_item_id) AS simple_item_id
    , coalesce(child_item.simple_product_id, parent_item.simple_product_id) AS simple_product_id
    , coalesce(parent_item.configurable_item_id, child_item.configurable_item_id) AS configurable_item_id
    , coalesce(parent_item.configurable_product_id, child_item.configurable_product_id) AS configurable_product_id
    , coalesce(
          child_product.simple_sku
        , parent_product.simple_sku
        , child_item.simple_sku
        , parent_item.simple_sku
        , child_item.sku
        , parent_item.sku
      ) AS simple_sku
    , coalesce(
          parent_product.configurable_x3_sku
        , child_product.configurable_x3_sku
        , parent_product.x3_sku
        , child_product.x3_sku
        , parent_product.configurable_x3_sku_from_sku
        , child_product.configurable_x3_sku_from_sku
        , parent_product.x3_sku_from_sku
        , child_product.x3_sku_from_sku
        , parent_item.configurable_x3_sku_from_sku
        , child_item.configurable_x3_sku_from_sku
        , parent_item.x3_sku_from_sku
        , child_item.x3_sku_from_sku
      ) AS x3_sku
    , substr(coalesce(child_product.simple_x3_size_code, parent_product.simple_x3_size_code
                    , child_product.x3_size_code, parent_product.x3_size_code)
        , char_length(coalesce(
                      child_product.simple_x3_size_code, parent_product.simple_x3_size_code
                    , child_product.x3_size_code, parent_product.x3_size_code))- (3-1)
        , 3) AS x3_size_code
    , coalesce(parent_item.qty_ordered, child_item.qty_ordered, 0) AS item_qty_ordered
    , coalesce(parent_item.base_original_price, child_item.base_original_price, 0) AS item_base_original_price
    , coalesce(parent_item.base_price, child_item.base_price, 0) AS item_base_price
    , coalesce(parent_item.base_discount_amount, 0) AS item_base_discount_amount
    , coalesce(parent_item.base_tax_amount, 0) AS item_base_tax_amount
    , coalesce(parent_item.qty_canceled, 0) AS item_qty_canceled
    , coalesce(parent_item.qty_refunded, child_item.qty_refunded, 0) AS item_qty_refunded
    , coalesce(parent_item.qty_shipped, child_item.qty_shipped, 0) AS item_qty_shipped
    , coalesce(parent_serial.serial_number, child_serial.serial_number) AS item_serial_number
    , CASE
        WHEN parent_serial.serial_number <> child_serial.serial_number
        THEN child_serial.serial_number
      END AS item_alt_serial_number
    , coalesce(parent_serial.dropshipper_item_id, child_serial.dropshipper_item_id) AS dsco_item_id
    , coalesce(parent_serial.dropship_source, child_serial.dropship_source) AS dropship_source
  FROM order_items AS parent_item
  LEFT JOIN order_items AS child_item
    ON parent_item.sales_flat_order_item_id = child_item.parent_sales_flat_order_item_id
  LEFT JOIN products AS parent_product
    ON parent_item.product_id = parent_product.product_id
  LEFT JOIN products AS child_product
    ON child_item.product_id = child_product.product_id
  LEFT JOIN serials AS parent_serial
    ON parent_item.serializedproduct_product_serial_id = parent_serial.serializedproduct_product_serial_id
  LEFT JOIN serials AS child_serial
    ON child_item.serializedproduct_product_serial_id = child_serial.serializedproduct_product_serial_id
  WHERE parent_item.parent_sales_flat_order_item_id IS NULL

)

SELECT * FROM final