

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`dss_order_lines`
  
  
  OPTIONS()
  as (
    WITH all_shipment_item_rows AS (

  SELECT
      shipment_id
    , order_item_id
    , quantity AS shipment_quantity
    , tracking_number
    , max(shipment_id) OVER (PARTITION BY order_item_id) AS max_shipment_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`dss__shipments`

), shipment_items AS (

  SELECT *
  FROM all_shipment_item_rows
  WHERE shipment_id = max_shipment_id

), all_order_rows AS (

  SELECT *
    , row_number() OVER (
        PARTITION BY mag_order_id, third_party_id, third_party_order_number
        ORDER BY CAST(is_paid_out AS int64) DESC,  CAST(is_cancelled AS int64), fulfillment_status, created_at
      ) AS third_party_order_row
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`dss__orders`

), orders AS (

  SELECT *
  FROM all_order_rows
  WHERE third_party_order_row = 1

), products AS (

  SELECT
      product_id
    , upper(trim(manufacturer_sku)) AS manufacturer_sku
    , brand
    , title
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`dss__products`

), variants AS (

  SELECT
      variant_id
    , product_id
    , upper(trim(variant_size)) AS variant_size
    , variant_size AS variant_size_raw
    , item_number
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`dss__variants`

), dss_sellers AS (

  SELECT
      third_party_id
    , name AS third_party_name
    , serial_source
    , supplier_acronym AS seller_id
    , parent_company
    , commission_rate
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`dss_sellers`

), order_items AS (

  SELECT
      order_item_id
    , order_id
    , variant_id
    , third_party_id
    , order_item_state
    , fulfillable_quantity
    , fulfilled_at
    , serial_price
    , payout_amount
    , quantity
    , nullif(CAST((payout_amount / nullif(quantity, 0)) AS float64), 0) AS line_payout_amount
    , paid_out_at
    , safe_cast(datetime(safe_cast(paid_out_at AS timestamp), 'America/New_York') AS datetime) AS paid_out_at_nyc
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`dss__order_items`

), max_qty AS (

  SELECT *
  FROM 
  UNNEST( generate_array(1,  (SELECT max(quantity) FROM order_items), 1) )
 AS order_item_line

), mag_orders AS (

  SELECT
      mag_order_id
    , channel
, safe_cast(datetime(safe_cast(created_at AS timestamp), 'America/New_York') AS datetime) AS mag_order_creation_nyc
    , customer_email
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order`

), email_channel AS (

  SELECT
    email_address
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_email_addresses`
  WHERE is_order_channel = TRUE

), lookup_channel AS (

  SELECT
      order_channel
    , business_unit
    , sales_channel
    , channel_or_gateway
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_channels`

), order_lines AS (

  SELECT
      orders.mag_order_id AS stadium_order_id
    , CAST(orders.is_paid_out AS int64) AS order_paid_out
    , CAST(orders.is_cancelled AS int64) AS order_cancelled
    , orders.fulfillment_status AS order_fulfillment_status
    , products.manufacturer_sku AS product_sku
    , order_items.variant_id
    , variants.item_number
    , variants.variant_size
    , order_items.third_party_id
    , dss_sellers.third_party_name
    , dss_sellers.seller_id
    , dss_sellers.parent_company
    , order_items.order_item_id AS dss_order_item_id
    , order_items.order_item_state
    , row_number() OVER (
        PARTITION BY orders.mag_order_id, products.manufacturer_sku, variants.variant_size, dss_sellers.serial_source
        ORDER BY order_items.order_item_id, max_qty.order_item_line
      ) AS order_sku_size_source_line
    , CASE WHEN max_qty.order_item_line <= order_items.fulfillable_quantity THEN order_items.fulfilled_at END AS line_fulfilled_at
    , order_items.serial_price
    , CAST('3P' AS string) AS serial_relationship
    , CAST('Dropship' AS string) serial_inventory
    , dss_sellers.serial_source
    , coalesce(
          order_items.line_payout_amount
        , (1 - dss_sellers.commission_rate) * order_items.serial_price
      ) AS serial_cost
    , max_qty.order_item_line
    , products.brand AS product_brand
    , substr(
    concat(
    
      coalesce(products.title|| ' - ' , '')
    
      , coalesce(variants.variant_size_raw|| ' - ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(products.title|| ' - ' , '')
    
      , coalesce(variants.variant_size_raw|| ' - ' , '')
    
  )) - length(' - ')
      , 0
    )
) AS product_title
    , orders.third_party_order_number
    , cast(coalesce(orders.shipping_amount, 0) AS float64) / count(*) OVER (PARTITION BY orders.order_id) AS line_shipping_amount
    , mag_orders.mag_order_creation_nyc
    , CASE
        WHEN max_qty.order_item_line <= order_items.fulfillable_quantity
          THEN safe_cast(datetime(safe_cast(order_items.fulfilled_at AS timestamp), 'America/New_York') AS datetime)
      END AS line_fulfilled_at_nyc
    , lookup_channel.business_unit
    , lookup_channel.sales_channel
    , lookup_channel.channel_or_gateway
    , order_items.paid_out_at
    , order_items.paid_out_at_nyc
  FROM order_items
  INNER JOIN orders
    ON order_items.order_id = orders.order_id
  INNER JOIN max_qty
    ON max_qty.order_item_line <= order_items.quantity
  INNER JOIN variants
    ON order_items.variant_id = variants.variant_id
  INNER JOIN products
    ON variants.product_id = products.product_id
  INNER JOIN dss_sellers
    ON order_items.third_party_id = dss_sellers.third_party_id
  LEFT JOIN mag_orders
    ON orders.mag_order_id = mag_orders.mag_order_id
  LEFT JOIN email_channel
    ON email_channel.email_address = mag_orders.customer_email
  LEFT JOIN lookup_channel
    ON coalesce(email_channel.email_address, mag_orders.channel) = lookup_channel.order_channel

), final AS (

  SELECT order_lines.*
    , CASE
        WHEN shipment_items.shipment_quantity <= order_lines.order_item_line
          THEN shipment_items.tracking_number
      END AS tracking_number
    , current_timestamp AS rebuild_timestamp
  FROM order_lines
  LEFT JOIN shipment_items
    ON order_lines.dss_order_item_id = shipment_items.order_item_id

)

SELECT * FROM final
  );
    