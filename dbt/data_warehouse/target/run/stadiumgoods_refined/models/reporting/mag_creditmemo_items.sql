

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_creditmemo_items`
  
  
  OPTIONS()
  as (
    WITH creditmemo_items AS (

  SELECT
  CASE
    WHEN coalesce(parent_order_item.product_type, '') = 'simple' THEN parent_order_item.sales_flat_order_item_id
    WHEN coalesce(child_order_item.product_type, '') = 'simple' THEN child_order_item.sales_flat_order_item_id
    WHEN coalesce(parent_order_item.product_type, '') = 'configurable' THEN parent_order_item.sales_flat_order_item_id
    WHEN coalesce(child_order_item.product_type, '') = 'configurable' THEN child_order_item.sales_flat_order_item_id
    END AS order_item_id
  , creditmemo.sales_flat_creditmemo_id AS creditmemo_entity_id
  , parent_creditmemo_item.sales_flat_creditmemo_item_id AS parent_sales_flat_creditmemo_item_id
  , parent_creditmemo_item.base_price AS parent_base_price
  , parent_creditmemo_item.qty AS parent_qty
  , parent_creditmemo_item.base_discount_amount AS parent_base_discount_amount
  , parent_creditmemo_item.base_tax_amount AS parent_base_tax_amount
  , child_creditmemo_item.sales_flat_creditmemo_item_id AS child_sales_flat_creditmemo_item_id
  , child_creditmemo_item.base_price AS child_base_price
  , child_creditmemo_item.qty AS child_qty
  , child_creditmemo_item.base_discount_amount AS child_base_discount_amount
  , child_creditmemo_item.base_tax_amount AS child_base_tax_amount
  
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_creditmemo_item` AS parent_creditmemo_item
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_creditmemo` AS creditmemo
  ON creditmemo.sales_flat_creditmemo_id = parent_creditmemo_item.sales_flat_creditmemo_id
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order_item` AS parent_order_item
  ON parent_order_item.sales_flat_order_item_id = parent_creditmemo_item.sales_flat_order_item_id AND parent_order_item.parent_sales_flat_order_item_id IS NULL
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order` AS sfo
  ON sfo.sales_flat_order_id = parent_order_item.sales_flat_order_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order_item` AS child_order_item
  ON child_order_item.parent_sales_flat_order_item_id = parent_order_item.sales_flat_order_item_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_creditmemo_item` AS child_creditmemo_item
  ON child_creditmemo_item.sales_flat_order_item_id = child_order_item.sales_flat_order_item_id AND child_creditmemo_item.sales_flat_creditmemo_id = parent_creditmemo_item.sales_flat_creditmemo_id

), orphan_creditmemo_items AS (

  SELECT
  CASE
    WHEN coalesce(parent_order_item.product_type, '') = 'simple' THEN parent_order_item.sales_flat_order_item_id
    WHEN coalesce(child_order_item.product_type, '') = 'simple' THEN child_order_item.sales_flat_order_item_id
    WHEN coalesce(parent_order_item.product_type, '') = 'configurable' THEN parent_order_item.sales_flat_order_item_id
    WHEN coalesce(child_order_item.product_type, '') = 'configurable' THEN child_order_item.sales_flat_order_item_id
    END AS order_item_id
  , creditmemo.sales_flat_creditmemo_id AS creditmemo_entity_id
  , parent_creditmemo_item.sales_flat_creditmemo_item_id AS parent_sales_flat_creditmemo_item_id
  , parent_creditmemo_item.base_price AS parent_base_price
  , parent_creditmemo_item.qty AS parent_qty
  , parent_creditmemo_item.base_discount_amount AS parent_base_discount_amount
  , parent_creditmemo_item.base_tax_amount AS parent_base_tax_amount
  , child_creditmemo_item.sales_flat_creditmemo_item_id AS child_sales_flat_creditmemo_item_id
  , child_creditmemo_item.base_price AS child_base_price
  , child_creditmemo_item.qty AS child_qty
  , child_creditmemo_item.base_discount_amount AS child_base_discount_amount
  , child_creditmemo_item.base_tax_amount AS child_base_tax_amount
  
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_creditmemo_item` AS child_creditmemo_item
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_creditmemo` AS creditmemo
  ON creditmemo.sales_flat_creditmemo_id = child_creditmemo_item.sales_flat_creditmemo_id
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order_item` AS child_order_item
  ON child_order_item.sales_flat_order_item_id = child_creditmemo_item.sales_flat_order_item_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order_item` AS parent_order_item
  ON parent_order_item.sales_flat_order_item_id = child_order_item.parent_sales_flat_order_item_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_creditmemo_item` AS parent_creditmemo_item
  ON parent_creditmemo_item.sales_flat_order_item_id = parent_order_item.sales_flat_order_item_id AND parent_creditmemo_item.sales_flat_creditmemo_id = child_creditmemo_item.sales_flat_creditmemo_id
  WHERE NOT EXISTS (SELECT * FROM creditmemo_items WHERE creditmemo_items.parent_sales_flat_creditmemo_item_id = child_creditmemo_item.sales_flat_creditmemo_item_id)
  AND NOT EXISTS (SELECT * FROM creditmemo_items WHERE creditmemo_items.child_sales_flat_creditmemo_item_id = child_creditmemo_item.sales_flat_creditmemo_item_id)

), all_creditmemo_items AS (

  SELECT *
  FROM creditmemo_items
  UNION ALL
  SELECT *
  FROM orphan_creditmemo_items

), creditmemo_creditmemo_items AS (

  SELECT
    creditmemo.sales_flat_order_id AS mag_order_entity_id
  , order_item_id
  , CAST(nullif(
     greatest(
      coalesce(coalesce(parent_base_price, 0), CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      ,coalesce(coalesce(child_base_price, 0), CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      
      )
     , CAST('-9.9999999999999999999999999999999999999E+28' AS float64)
  ) AS float64) AS creditmemo_item_price
  , CAST(nullif(
     greatest(
      coalesce(coalesce(parent_qty, 0), CAST('-9223372036854775808' AS int64))
      ,coalesce(coalesce(child_qty, 0), CAST('-9223372036854775808' AS int64))
      
      )
     , CAST('-9223372036854775808' AS int64)
  ) AS int64) AS creditmemo_item_qty
  , CAST(nullif(
     greatest(
      coalesce(coalesce(parent_base_discount_amount, 0), CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      ,coalesce(coalesce(child_base_discount_amount, 0), CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      
      )
     , CAST('-9.9999999999999999999999999999999999999E+28' AS float64)
  ) AS float64) as creditmemo_item_discount
  , CAST(nullif(
     greatest(
      coalesce(coalesce(parent_base_tax_amount, 0), CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      ,coalesce(coalesce(child_base_tax_amount, 0), CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      
      )
     , CAST('-9.9999999999999999999999999999999999999E+28' AS float64)
  ) AS float64) AS creditmemo_item_tax
  , creditmemo.mag_creditmemo_id
  , creditmemo.base_shipping_amount AS creditmemo_shipping
  , creditmemo.base_shipping_tax_amount AS creditmemo_shipping_tax
  , creditmemo.base_discount_amount AS creditmemo_discount
  , creditmemo.base_tax_amount AS creditmemo_tax
  , creditmemo.base_adjustment AS creditmemo_adjustment
  , creditmemo.base_grand_total AS creditmemo_grand_total
  , creditmemo.base_credit_amount AS creditmemo_credit
  , creditmemo.base_credit_total_refunded AS creditmemo_credit_refunded
  , creditmemo.transaction_id
, DATETIME(SAFE_CAST(creditmemo.created_at AS timestamp), 'America/New_York') AS creditmemo_creation_nyc
, DATETIME(SAFE_CAST(creditmemo.updated_at AS timestamp), 'America/New_York') AS creditmemo_update_nyc
  , coalesce(lookup_refund_reason.cancel_and_refund_reason, creditmemo.refund_reason) AS cancel_and_refund_reason
  FROM all_creditmemo_items
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_creditmemo` AS creditmemo ON creditmemo.sales_flat_creditmemo_id = all_creditmemo_items.creditmemo_entity_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_magento_cancel_and_refund_reasons` AS lookup_refund_reason ON lookup_refund_reason.refund_reason = creditmemo.refund_reason

), creditmemo_only AS (

  SELECT
    creditmemo.sales_flat_order_id AS mag_order_entity_id
  , CAST(NULL AS int64 ) AS order_item_id
  , CAST(NULL AS float64 ) AS creditmemo_item_price
  , CAST(NULL AS float64 ) AS creditmemo_item_qty
  , CAST(NULL AS float64 ) AS creditmemo_item_discount
  , CAST(NULL AS float64 ) AS creditmemo_item_tax
  , creditmemo.mag_creditmemo_id
  , creditmemo.base_shipping_amount AS creditmemo_shipping
  , creditmemo.base_shipping_tax_amount AS creditmemo_shipping_tax
  , creditmemo.base_discount_amount AS creditmemo_discount
  , creditmemo.base_tax_amount AS creditmemo_tax
  , creditmemo.base_adjustment AS creditmemo_adjustment
  , creditmemo.base_grand_total AS creditmemo_grand_total
  , creditmemo.base_credit_amount AS creditmemo_credit
  , creditmemo.base_credit_total_refunded AS creditmemo_credit_refunded
  , creditmemo.transaction_id
, DATETIME(SAFE_CAST(creditmemo.created_at AS timestamp), 'America/New_York') AS creditmemo_creation_nyc
, DATETIME(SAFE_CAST(creditmemo.updated_at AS timestamp), 'America/New_York') AS creditmemo_update_nyc
  , coalesce(lookup_refund_reason.cancel_and_refund_reason, creditmemo.refund_reason) AS cancel_and_refund_reason
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_creditmemo` AS creditmemo
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_magento_cancel_and_refund_reasons` AS lookup_refund_reason ON lookup_refund_reason.refund_reason = creditmemo.refund_reason
  LEFT JOIN all_creditmemo_items ON all_creditmemo_items.creditmemo_entity_id = creditmemo.sales_flat_creditmemo_id
  WHERE all_creditmemo_items.creditmemo_entity_id IS NULL

), unioned AS (

  SELECT *
  FROM creditmemo_creditmemo_items
  UNION ALL
  SELECT *
  FROM creditmemo_only

), final AS (

  SELECT *
  , current_timestamp rebuild_timestamp
  FROM unioned

)
SELECT * FROM final
  );
    