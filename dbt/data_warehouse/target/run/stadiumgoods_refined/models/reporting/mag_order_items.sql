

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`mag_order_items`
  
  
  OPTIONS()
  as (
    

WITH order_items AS (

  SELECT *
    , item_base_original_price AS line_item_original_price
    , item_base_price AS line_item_price
    , (item_base_tax_amount / item_qty_ordered) AS line_item_tax
    , (item_base_discount_amount / item_qty_ordered) AS line_item_discount_or_credit
    , sum(item_qty_ordered) OVER (PARTITION BY sales_flat_order_id) AS order_total_lines
    , sum(item_base_price * item_qty_ordered) OVER (PARTITION BY sales_flat_order_id) AS order_total_item_price
    , sum(item_base_tax_amount) OVER (PARTITION BY sales_flat_order_id) AS order_total_item_tax
    , sum(item_base_discount_amount) OVER (PARTITION BY sales_flat_order_id) AS order_total_item_discount_or_credit
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_order_items`

), orders AS (

  SELECT
      sales_flat_order_id
    , mag_order_id
    , mag_x3_order_id AS x3_order_id
    , total_shipping_price AS order_total_shipping_price
    , total_shipping_tax AS order_total_shipping_tax
    , total_shipping_discount AS order_total_shipping_discount
    , total_payment_amount AS order_total_payment_amount
    , total_credit_amount AS order_total_credit_amount
    , total_payment_refunded AS order_total_payment_refunded
    , total_credit_refunded AS order_total_credit_refunded
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_orders`

), joined AS (

  SELECT
      order_items.order_item_id
    , order_items.simple_item_id
    , order_items.simple_product_id
    , order_items.configurable_item_id
    , order_items.configurable_product_id
    , order_items.simple_sku
    , order_items.x3_sku
    , order_items.x3_size_code
    , order_items.item_qty_ordered
    , order_items.item_base_original_price
    , order_items.item_base_price
    , order_items.item_base_discount_amount
    , order_items.item_base_tax_amount
    , order_items.item_qty_canceled
    , order_items.item_qty_refunded
    , order_items.item_qty_shipped
    , order_items.item_serial_number
    , order_items.item_alt_serial_number
    , order_items.dsco_item_id
    , order_items.dropship_source
    , order_items.line_item_original_price
    , order_items.line_item_price
    , order_items.line_item_tax
    , order_items.line_item_discount_or_credit
    , CAST(1 AS float64) / order_items.order_total_lines AS line_share_of_order_total_lines
    , coalesce(
          order_items.line_item_discount_or_credit / nullif(order_items.order_total_item_discount_or_credit, 0)
        , CAST(1 AS float64) / order_items.order_total_lines
      ) AS line_share_of_order_total_item_discount_or_credit
    , order_items.sales_flat_order_id AS mag_order_entity_id
    , orders.mag_order_id
    , orders.x3_order_id
    , orders.order_total_shipping_price
    , orders.order_total_shipping_tax
    , orders.order_total_shipping_discount
    , orders.order_total_payment_amount
    , orders.order_total_credit_amount
    , orders.order_total_payment_refunded
    , orders.order_total_credit_refunded
    , order_items.order_total_lines
    , order_items.order_total_item_price
    , order_items.order_total_item_tax
    , order_items.order_total_item_discount_or_credit
    , (
          order_items.order_total_item_discount_or_credit
        + orders.order_total_shipping_discount
      ) AS order_total_discount_or_credit
    , nullif(
     greatest(
      coalesce((
              order_items.order_total_item_discount_or_credit
            + orders.order_total_shipping_discount
            - orders.order_total_credit_amount
          ), CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      ,coalesce(0, CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      
      )
     , CAST('-9.9999999999999999999999999999999999999E+28' AS float64)
  ) AS order_total_discount
  FROM order_items
  INNER JOIN orders
    ON order_items.sales_flat_order_id = orders.sales_flat_order_id

), final AS (

  SELECT *
    , CASE
        WHEN order_total_credit_amount = 0
        THEN line_item_discount_or_credit
        ELSE nullif(
     least(
      coalesce(round( CAST(order_total_discount AS numeric), 2) * line_share_of_order_total_item_discount_or_credit, CAST('9.9999999999999999999999999999999999999E+28' AS float64))
      ,coalesce(line_item_price, CAST('9.9999999999999999999999999999999999999E+28' AS float64))
      
      )
     , CAST('9.9999999999999999999999999999999999999E+28' AS float64)
  )
      END AS line_item_discount
    , CASE
        WHEN order_total_credit_amount = 0
          THEN 0
        WHEN order_total_discount_or_credit <= order_total_credit_amount
          THEN line_item_discount_or_credit
        ELSE
          (order_total_credit_amount - order_total_shipping_discount) * line_share_of_order_total_item_discount_or_credit
      END AS line_item_credit
    , order_total_shipping_price * line_share_of_order_total_lines AS line_shipping_price
    , order_total_shipping_tax * line_share_of_order_total_lines AS line_shipping_tax
    , CASE
        WHEN order_total_credit_amount = 0
        THEN order_total_shipping_discount * line_share_of_order_total_lines
        ELSE round(CAST(nullif(
     greatest(
      coalesce(order_total_discount - order_total_item_price, CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      ,coalesce(0, CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      
      )
     , CAST('-9.9999999999999999999999999999999999999E+28' AS float64)
  ) AS numeric), 2) * line_share_of_order_total_lines
      END AS line_shipping_discount
    , CASE
        WHEN order_total_credit_amount = 0
        THEN 0
        ELSE order_total_shipping_discount * line_share_of_order_total_lines
      END AS line_shipping_credit
    , current_timestamp AS rebuild_timestamp
  FROM joined

)

SELECT * FROM final
  );
    