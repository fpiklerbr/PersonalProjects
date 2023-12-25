WITH fps_lines AS (

  SELECT
      coalesce(
          farfetch.farfetch_order_line_id
        , magento.farfetch_order_line_id
      ) AS farfetch_order_line_id
    , coalesce(
          farfetch.fps_order_id
        , magento.fps_order_id
      ) AS fps_order_id
    , coalesce(
          api_parent_items.fps_parent_product_id
        , magento.fps_parent_product_id
        , '(N/A)'
      ) AS fps_parent_product_id
    , coalesce(
          farfetch.fps_product_size
        , magento.fps_product_size
        , '(N/A)'
      ) AS fps_product_size
    , coalesce(
          farfetch.item_quantity
        , magento.item_quantity
      ) AS item_quantity
    , coalesce(
          farfetch.item_price_base_amount
        , magento.item_price_base_amount
      ) AS item_price_base_amount
    , coalesce(
          farfetch.item_discount_base_amount
        , magento.item_discount_base_amount
      ) AS item_discount_base_amount
    , coalesce(
          farfetch.item_tax_base_amount
        , magento.item_tax_base_amount
      ) AS item_tax_base_amount
    , coalesce(
          farfetch.item_duties_base_amount
        , magento.item_duties_base_amount
      ) AS item_duties_base_amount
    , coalesce(
          farfetch.store_tax_value_base_amount
        , magento.store_tax_value_base_amount
      ) AS store_tax_value_base_amount
    , farfetch.item_vat_base_amount
    , coalesce(
          farfetch.customer_tax_value_base_amount
        , magento.customer_tax_value_base_amount
      ) AS customer_tax_value_base_amount
    , coalesce(
          farfetch.store_us_tax_base_amount
        , magento.store_us_tax_base_amount
      ) AS store_us_tax_base_amount
    , coalesce(
          farfetch.farfetch_order_status_id
        , magento.farfetch_order_status_id
      ) AS farfetch_order_status_id
    , farfetch.fps_child_product_id
    , farfetch.tracking_number
    , farfetch.line_status
    , coalesce(
          farfetch.fps_stock_point_id
        , magento.fps_stock_point_id
      ) AS fps_stock_point_id
    , magento.configurable_product_id
    , magento.simple_product_id
    , magento.simple_sku
    , magento.serial_number
    , magento.order_item_status
    , magento.sg_no_stock_type
    , coalesce(farfetch.file_time, magento.file_time) AS fps_order_line_file_time
    , magento.file_time as magento_fps_file_time -- need this for accurate dates for tableau_no_stock_orders
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_farfetch_fps_order_lines` AS farfetch
  FULL JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_fps_order_lines` AS magento
    ON farfetch.farfetch_order_line_id = magento.farfetch_order_line_id
    AND farfetch.fps_stock_point_id = magento.fps_stock_point_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__api_parent_items` AS api_parent_items
    ON farfetch.fps_child_product_id = api_parent_items.fps_child_product_id

), returned_lines AS (

  SELECT
      farfetch_order_line_id
    , fps_stock_point_id
    , min(farfetch_api_return_created_at) AS fps_return_created_at
    , string_agg(DISTINCT farfetch_return_id, ', ') AS fps_return_id
    , max(file_time) AS fps_return_file_time
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__api_returns`
  GROUP BY 1, 2

), final AS (

  SELECT
      fps_lines.*
    , coalesce(
          farfetch_order_statuses.farfetch_order_status
        , 'Status #' || fps_lines.farfetch_order_status_id
      ) AS farfetch_order_status
    , (farfetch_order_statuses.has_mag_order IS TRUE) AS mag_order_is_expected
    , (farfetch_order_statuses.has_payment IS NOT FALSE) AS has_payment
    , (
        bi_refunds.farfetch_order_id IS NOT NULL
        OR farfetch_order_statuses.has_refund IS TRUE
      ) AS has_refund
    , (
        returned_lines.fps_return_created_at IS NOT NULL
        OR returned_lines.fps_return_id IS NOT NULL
      ) AS is_fps_return
    , returned_lines.fps_return_created_at
    , returned_lines.fps_return_id
    , returned_lines.fps_return_file_time
    , substr(
    concat(
    
      coalesce(stock_points.fps_stock_point_code|| '-' , '')
    
      , coalesce(fps_lines.farfetch_order_line_id|| '-' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(stock_points.fps_stock_point_code|| '-' , '')
    
      , coalesce(fps_lines.farfetch_order_line_id|| '-' , '')
    
  )) - length('-')
      , 0
    )
) AS fps_order_line
  FROM fps_lines
  LEFT JOIN returned_lines
    ON fps_lines.farfetch_order_line_id = returned_lines.farfetch_order_line_id
    AND fps_lines.fps_stock_point_id = returned_lines.fps_stock_point_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`fps_stock_points` AS stock_points
    ON fps_lines.fps_stock_point_id = stock_points.fps_stock_point_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_farfetch_order_status` AS farfetch_order_statuses
    ON fps_lines.farfetch_order_status_id = farfetch_order_statuses.farfetch_order_status_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`exceptions_farfetch_bi_refunded_orders` AS bi_refunds
	  ON fps_lines.fps_order_id = 'SG9' || bi_refunds.farfetch_order_id

)

SELECT

    final.farfetch_order_line_id
  , final.fps_order_id
  , CASE WHEN magento.fps_parent_product_id IS NULL 
    THEN final.fps_parent_product_id
    WHEN magento.farfetch_order_line_id IS NOT NULL AND final.fps_parent_product_id = final.fps_child_product_id
    THEN magento.fps_parent_product_id 
    ELSE final.fps_parent_product_id END AS fps_parent_product_id
  , final.fps_product_size
  , final.item_quantity
  , final.item_price_base_amount
  , final.item_discount_base_amount
  , final.item_tax_base_amount
  , final.item_duties_base_amount
  , final.store_tax_value_base_amount
  , final.item_vat_base_amount
  , final.customer_tax_value_base_amount
  , final.store_us_tax_base_amount
  , final.farfetch_order_status_id
  , final.fps_child_product_id
  , final.tracking_number
  , final.line_status
  , final.fps_stock_point_id
  , final.configurable_product_id
  , final.simple_product_id
  , final.simple_sku
  , final.serial_number
  , final.order_item_status
  , final.sg_no_stock_type
  , final.fps_order_line_file_time
  , final.magento_fps_file_time
  , final.farfetch_order_status
  , final.mag_order_is_expected
  , final.has_payment
  , final.has_refund
  , final.is_fps_return
  , final.fps_return_created_at
  , final.fps_return_id
  , final.fps_return_file_time
  , final.fps_order_line 

FROM final
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_fps_order_lines` AS magento
  ON final.farfetch_order_line_id = magento.farfetch_order_line_id
  AND final.fps_stock_point_id = magento.fps_stock_point_id