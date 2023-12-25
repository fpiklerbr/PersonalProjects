WITH sg_farfetch_product_from_simple AS (

  SELECT
      catalog_product_relation.simple_product_id
    , string_agg(DISTINCT sg_farfetch_product.fps_parent_product_id, ', ') AS fps_parent_product_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_relation` AS catalog_product_relation
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sg_farfetch_product` AS sg_farfetch_product
    ON catalog_product_relation.configurable_product_id = sg_farfetch_product.configurable_product_id
  WHERE catalog_product_relation.simple_product_id IS NOT NULL
    AND sg_farfetch_product.fps_parent_product_id IS NOT NULL
  GROUP BY 1

), order_lines_with_dupes AS (

  SELECT DISTINCT
      sg_farfetch_order_item.farfetch_order_line_id
    , fps_orders.fps_stock_point_id
    , fps_orders.fps_order_id
    , coalesce(
          sg_farfetch_product_from_configurable.fps_parent_product_id
        , sg_farfetch_product_from_simple.fps_parent_product_id
      ) AS fps_parent_product_id
    , sg_farfetch_order_item.fps_product_size
    , sg_farfetch_order_item.item_quantity
    , sg_farfetch_order_item.item_price_base_amount
    , sg_farfetch_order_item.item_discount_base_amount
    , sg_farfetch_order_item.item_tax_base_amount
    , sg_farfetch_order_item.item_duties_base_amount
    , sg_farfetch_order_item.store_tax_value_base_amount
    , sg_farfetch_order_item.customer_tax_value_base_amount
    , sg_farfetch_order_item.store_us_tax_base_amount
    , fps_orders.farfetch_order_status_id
    , sg_farfetch_order_item.configurable_product_id
    , sg_farfetch_order_item.simple_product_id
    , product_relations.simple_sku
    , sg_farfetch_order_item.order_item_status
    , sg_farfetch_order_item.sg_no_stock_type
    , serializedproduct_product_serial.serial_number
    , sg_farfetch_order_item.updated_at AS file_time
    , row_number() OVER (
        PARTITION BY fps_orders.fps_stock_point_id, sg_farfetch_order_item.farfetch_order_line_id
        ORDER BY
            CASE WHEN serializedproduct_product_serial.serial_number IS NOT NULL THEN 0 ELSE 1 END
          , CASE WHEN sg_farfetch_order_item.simple_product_id <> 0 THEN 0 ELSE 1 END
          , sg_farfetch_order_item.updated_at DESC
      ) AS dedupe_rank
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sg_farfetch_order_item` AS sg_farfetch_order_item
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_fps_orders` AS fps_orders
    ON sg_farfetch_order_item.sg_farfetch_order_id = fps_orders.sg_farfetch_order_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__serializedproduct_product_serial` AS serializedproduct_product_serial
    ON sg_farfetch_order_item.serializedproduct_product_serial_id = serializedproduct_product_serial.serializedproduct_product_serial_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sg_farfetch_product` AS sg_farfetch_product_from_configurable
    ON sg_farfetch_order_item.configurable_product_id = sg_farfetch_product_from_configurable.configurable_product_id
  LEFT JOIN sg_farfetch_product_from_simple
    ON sg_farfetch_order_item.simple_product_id = sg_farfetch_product_from_simple.simple_product_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_product_relations` as product_relations
    ON sg_farfetch_order_item.simple_product_id = product_relations.simple_product_id

), final AS (

  SELECT
    *
  FROM order_lines_with_dupes
  WHERE dedupe_rank = 1

)

SELECT * FROM final