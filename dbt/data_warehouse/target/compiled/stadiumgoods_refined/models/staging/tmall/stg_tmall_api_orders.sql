

WITH orders AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`tmall__trades_sold`

), items AS (

  SELECT
      transaction_id
    , (JSON_EXTRACT_SCALAR(cast(item AS string), '$.sku_id'
  ))
 AS sku
    , 
    safe_cast(JSON_EXTRACT_SCALAR(cast(item AS string), '$.price'
  ) as float64)
 AS unit_price
    , 
    safe_cast(JSON_EXTRACT_SCALAR(cast(item AS string), '$.discount_fee'
  ) as float64)
 AS unit_discount
    , 
    safe_cast(
    safe_cast(JSON_EXTRACT_SCALAR(cast(item AS string), '$.num'
  ) as float64)
 as int64)
 AS qty
  FROM orders, UNNEST(JSON_EXTRACT_ARRAY(items)) AS item

), item_totals AS (

  SELECT
      transaction_id
    , count(*) AS total_item_count
    , sum(qty) AS total_item_qty
    , sum(unit_price * qty) AS total_item_price_rmb
    , sum(unit_discount * qty) AS total_item_discount_rmb
  FROM items
  GROUP BY 1

), orders_with_item_totals AS (

  SELECT
      orders.*
    , coalesce(item_totals.total_item_count, 1) AS total_item_count
    , coalesce(item_totals.total_item_qty, orders._raw_total_item_qty) AS total_item_qty
    , coalesce(item_totals.total_item_price_rmb, orders._raw_total_item_price_rmb) AS total_item_price_rmb
    , (
        coalesce(item_totals.total_item_discount_rmb, orders._raw_total_item_discount_rmb)
        + orders._raw_discount_rmb
      ) AS discount_rmb
  FROM orders
  LEFT JOIN item_totals
    ON orders.transaction_id = item_totals.transaction_id
  WHERE item_totals.transaction_id IS NOT NULL
    OR orders.num_iid IS NOT NULL

), final AS (

  SELECT
      *
    , nullif(
     least(
      coalesce(total_item_price_rmb, CAST('9.9999999999999999999999999999999999999E+28' AS float64))
      ,coalesce(discount_rmb, CAST('9.9999999999999999999999999999999999999E+28' AS float64))
      
      )
     , CAST('9.9999999999999999999999999999999999999E+28' AS float64)
  ) AS total_item_discount_rmb
    , nullif(
     greatest(
      coalesce(discount_rmb - total_item_price_rmb, CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      ,coalesce(0, CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      
      )
     , CAST('-9.9999999999999999999999999999999999999E+28' AS float64)
  ) AS shipping_discount_rmb
    , cast(0 AS float64) AS total_item_tax_rmb
    , cast(0 AS float64) AS shipping_tax_rmb
    , cast( nullif(
     greatest(
      coalesce(round(cast((payment_amount_rmb - (shipping_price_rmb + total_item_price_rmb - discount_rmb)) AS numeric), 2), CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      ,coalesce(0, CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      
      )
     , CAST('-9.9999999999999999999999999999999999999E+28' AS float64)
  ) AS float64
      ) AS duties_rmb
  FROM orders_with_item_totals

)

SELECT * FROM final