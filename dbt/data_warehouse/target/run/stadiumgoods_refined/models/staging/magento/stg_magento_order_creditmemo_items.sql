

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_order_creditmemo_items`
  OPTIONS()
  as WITH creditmemo_items_union AS (

  SELECT
    creditmemo_items.order_item_id
  , creditmemo_items.mag_creditmemo_id
  , creditmemo_items.creditmemo_creation_nyc
  , creditmemo_items.creditmemo_update_nyc
  , creditmemo_items.transaction_id
  , creditmemo_items.cancel_and_refund_reason
  , creditmemo_items.creditmemo_item_price
  , creditmemo_items.creditmemo_item_qty
  , creditmemo_items.creditmemo_item_discount
  , creditmemo_items.creditmemo_item_tax
  , creditmemo_items.creditmemo_shipping
  , creditmemo_items.creditmemo_shipping_tax
  , creditmemo_items.creditmemo_discount
  , creditmemo_items.creditmemo_tax
  , creditmemo_items.creditmemo_adjustment
  , creditmemo_items.creditmemo_grand_total
  , creditmemo_items.creditmemo_credit
  , creditmemo_items.creditmemo_credit_refunded
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_creditmemo_items` AS creditmemo_items
  WHERE creditmemo_items.order_item_id IS NOT NULL
  UNION ALL
  SELECT
    creditmemo_items.order_item_id
  , semi_itemless.mag_creditmemo_id
  , semi_itemless.creditmemo_creation_nyc
  , semi_itemless.creditmemo_update_nyc
  , semi_itemless.transaction_id
  , semi_itemless.cancel_and_refund_reason
  , semi_itemless.creditmemo_item_price
  , semi_itemless.creditmemo_item_qty
  , semi_itemless.creditmemo_item_discount
  , semi_itemless.creditmemo_item_tax
  , semi_itemless.creditmemo_shipping
  , semi_itemless.creditmemo_shipping_tax
  , semi_itemless.creditmemo_discount
  , semi_itemless.creditmemo_tax
  , semi_itemless.creditmemo_adjustment
  , semi_itemless.creditmemo_grand_total
  , semi_itemless.creditmemo_credit
  , semi_itemless.creditmemo_credit_refunded
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_creditmemo_items` AS semi_itemless
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_creditmemo_items` AS creditmemo_items
  ON creditmemo_items.mag_order_entity_id = semi_itemless.mag_order_entity_id AND creditmemo_items.order_item_id IS NOT NULL
  WHERE semi_itemless.order_item_id IS NULL
  UNION ALL
  SELECT
    order_items.order_item_id
  , fully_itemless.mag_creditmemo_id
  , fully_itemless.creditmemo_creation_nyc
  , fully_itemless.creditmemo_update_nyc
  , fully_itemless.transaction_id
  , fully_itemless.cancel_and_refund_reason
  , fully_itemless.creditmemo_item_price
  , fully_itemless.creditmemo_item_qty
  , fully_itemless.creditmemo_item_discount
  , fully_itemless.creditmemo_item_tax
  , fully_itemless.creditmemo_shipping
  , fully_itemless.creditmemo_shipping_tax
  , fully_itemless.creditmemo_discount
  , fully_itemless.creditmemo_tax
  , fully_itemless.creditmemo_adjustment
  , fully_itemless.creditmemo_grand_total
  , fully_itemless.creditmemo_credit
  , fully_itemless.creditmemo_credit_refunded
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_creditmemo_items` AS fully_itemless
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_order_items` AS order_items ON order_items.mag_order_entity_id = fully_itemless.mag_order_entity_id
  WHERE fully_itemless.order_item_id IS NULL
  AND NOT EXISTS (
    SELECT * FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_creditmemo_items` AS creditmemo
    WHERE creditmemo.order_item_id IS NOT NULL AND creditmemo.mag_order_entity_id = fully_itemless.mag_order_entity_id
  )

), final AS (

  SELECT
    creditmemo_items_union.order_item_id
  , string_agg(DISTINCT creditmemo_items_union.mag_creditmemo_id, ', ') AS mag_creditmemo_ids
  , min(creditmemo_items_union.creditmemo_creation_nyc) AS first_creditmemo_creation_nyc
  , max(creditmemo_items_union.creditmemo_update_nyc) AS last_creditmemo_update_nyc
  , array_agg(DISTINCT creditmemo_items_union.transaction_id
        IGNORE NULLS) AS creditmemo_transaction_ids
  , string_agg(DISTINCT creditmemo_items_union.cancel_and_refund_reason, ', ') AS creditmemo_reason
  , coalesce(sum(creditmemo_items_union.creditmemo_item_price), 0) AS creditmemo_item_price
  , coalesce(sum(creditmemo_items_union.creditmemo_item_qty), 0) AS creditmemo_item_qty
  , coalesce(sum(creditmemo_items_union.creditmemo_item_discount), 0) AS creditmemo_item_discount
  , coalesce(sum(creditmemo_items_union.creditmemo_item_tax), 0) AS creditmemo_item_tax
  , sum(creditmemo_items_union.creditmemo_shipping) AS creditmemo_shipping
  , sum(creditmemo_items_union.creditmemo_shipping_tax) AS creditmemo_shipping_tax
  , sum(creditmemo_items_union.creditmemo_discount) AS creditmemo_discount
  , sum(creditmemo_items_union.creditmemo_tax) AS creditmemo_tax
  , sum(creditmemo_items_union.creditmemo_adjustment) AS creditmemo_adjustment
  , sum(creditmemo_items_union.creditmemo_grand_total) AS creditmemo_refunded
  , sum(creditmemo_items_union.creditmemo_credit) AS creditmemo_store_credit
  , sum(creditmemo_items_union.creditmemo_credit_refunded) AS creditmemo_store_credit_refunded
  FROM creditmemo_items_union
  GROUP BY 1

)

SELECT * FROM final;

