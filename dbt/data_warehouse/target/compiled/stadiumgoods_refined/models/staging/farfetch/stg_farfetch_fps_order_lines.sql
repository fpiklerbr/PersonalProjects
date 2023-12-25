WITH orders_rows AS (-- removing 2 duplicates from source models with completely identical rows

    SELECT DISTINCT
      *
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__api_orders_rows` AS api_orders_rows

  )

  SELECT
    coalesce(orders_rows.fps_stock_point_id, orders_by_date.fps_stock_point_id) AS fps_stock_point_id
  , coalesce(orders_rows.farfetch_order_line_id, orders_by_date.farfetch_order_line_id) AS farfetch_order_line_id
  , coalesce(orders_rows.farfetch_order_id, orders_by_date.farfetch_order_id) AS farfetch_order_id
  , stock_points.fps_stock_point_code || coalesce(orders_rows.farfetch_order_id, orders_by_date.farfetch_order_id) AS fps_order_id
  , coalesce(orders_rows.fps_child_product_id, orders_by_date.fps_child_product_id) AS fps_child_product_id
  , coalesce(orders_rows.fps_product_size, orders_by_date.fps_product_size) AS fps_product_size
  , coalesce(orders_rows.item_quantity, orders_by_date.item_quantity) AS item_quantity
  , coalesce(orders_rows.item_price_base_amount, orders_by_date.item_price_base_amount) AS item_price_base_amount
  , orders_rows.item_discount_base_amount
  , orders_rows.item_tax_base_amount
  , orders_rows.item_duties_base_amount
  , orders_rows.store_tax_value_base_amount
  , orders_rows.item_vat_base_amount
  , orders_rows.customer_tax_value_base_amount
  , orders_rows.store_us_tax_base_amount
  , orders_rows.tracking_number
  , orders_rows.line_status
  , orders_by_date.farfetch_order_status_id
  , orders_by_date.order_date
  , orders_by_date.customer_country
  , nullif(
     greatest(
      coalesce(orders_rows.file_time, CAST('0001-01-01 00:00:00' AS timestamp))
      ,coalesce(orders_by_date.file_time, CAST('0001-01-01 00:00:00' AS timestamp))
      
      )
     , CAST('0001-01-01 00:00:00' AS timestamp)
  ) AS file_time
  FROM orders_rows
  FULL JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__api_orders_by_date` AS orders_by_date
    ON orders_rows.farfetch_order_line_id = orders_by_date.farfetch_order_line_id
    AND orders_rows.fps_stock_point_id = orders_by_date.fps_stock_point_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`fps_stock_points` AS stock_points
    ON coalesce(orders_rows.fps_stock_point_id, orders_by_date.fps_stock_point_id) = stock_points.fps_stock_point_id