WITH all_orders AS (

  SELECT fps_order_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__api_orders_headers`
  UNION DISTINCT
  SELECT fps_order_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_farfetch_financial_order_items`
  UNION DISTINCT
  SELECT fps_order_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_fps_orders`
  UNION DISTINCT
  SELECT fps_order_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_farfetch_fps_order_lines`

), orders_headers_with_dedupe_window AS (

  SELECT
      *
    , row_number() OVER (PARTITION BY fps_order_id ORDER BY file_time DESC, selected_step DESC) AS dedupe_filter
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__api_orders_headers`

), orders_headers AS (

  SELECT
      *
  FROM orders_headers_with_dedupe_window
  WHERE dedupe_filter = 1

), financial_orders AS (

  SELECT
      fps_order_id
    , string_agg(DISTINCT fps_stock_point_id, ', ') AS fps_stock_point_id
    , string_agg(DISTINCT fps_tenant_id, ', ') AS fps_tenant_id
    , string_agg(DISTINCT fps_channel_id, ', ') AS fps_channel_id
    , string_agg(DISTINCT customer_country, ', ') AS customer_country
    , min(payment_processed_at) AS farfetch_order_created_at
    , sum(payment_shipping_price_base_amount) AS order_shipping_price_base_amount
    , nullif(
     greatest(
      coalesce(max(payment_file_time), CAST('0001-01-01 00:00:00' AS timestamp))
      ,coalesce(max(refund_file_time), CAST('0001-01-01 00:00:00' AS timestamp))
      
      )
     , CAST('0001-01-01 00:00:00' AS timestamp)
  ) AS file_time
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_farfetch_financial_order_items`
  GROUP BY 1

), orders_by_date AS (

  SELECT
      fps_order_id
    , string_agg(DISTINCT fps_stock_point_id, ', ') AS fps_stock_point_id
    , string_agg(DISTINCT farfetch_order_id, ', ') AS farfetch_order_id
    , SAFE_CAST(TIMESTAMP(SAFE_CAST(

        datetime_add(
            cast( min(order_date) as datetime),
        interval 1439 minute
        )

 AS datetime), 'Etc/UTC') AS timestamp) AS farfetch_order_created_at
    , string_agg(DISTINCT customer_country, ', ') AS customer_country
    , max(file_time) AS file_time
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_farfetch_fps_order_lines`
  GROUP BY 1

), fps_orders AS (

  SELECT
      all_orders.fps_order_id
    , coalesce(
          orders_headers.fps_stock_point_id
        , financial_orders.fps_stock_point_id
        , magento_fps_orders.fps_stock_point_id
        , orders_by_date.fps_stock_point_id
      ) AS fps_stock_point_id
    , coalesce(
          orders_headers.farfetch_order_id
        , magento_fps_orders.farfetch_order_id
        , orders_by_date.farfetch_order_id
      ) AS farfetch_order_id
    , coalesce(
          orders_headers.fps_tenant_id
        , financial_orders.fps_tenant_id
        , magento_fps_orders.fps_tenant_id
      ) AS fps_tenant_id
    , financial_orders.fps_channel_id
    , coalesce(
          orders_headers.fps_order_code
        , magento_fps_orders.fps_order_code
      ) AS fps_order_code
    , coalesce(
          orders_headers.farfetch_order_created_at
        , financial_orders.farfetch_order_created_at
        , magento_fps_orders.farfetch_order_created_at
        , orders_by_date.farfetch_order_created_at
      ) AS farfetch_order_created_at
    , coalesce(
          orders_headers.customer_email
        , magento_fps_orders.customer_email
      ) AS customer_email
    , coalesce(
          orders_headers.customer_country
        , financial_orders.customer_country
        , magento_fps_orders.customer_country
        , orders_by_date.customer_country
      ) AS customer_country
    , coalesce(
          orders_headers.customer_country_id
        , magento_fps_orders.customer_country_id
      ) AS customer_country_id
    , coalesce(
          orders_headers.promo_code
        , magento_fps_orders.promo_code
      ) AS promo_code
    , coalesce(
          orders_headers.order_shipping_price_base_amount
        , financial_orders.order_shipping_price_base_amount
        , magento_fps_orders.order_shipping_price_base_amount
        , magento_fps_orders.magento_order_shipping_price_base_amount
      ) AS order_shipping_price_base_amount
    , coalesce(
          orders_headers.order_shipping_tax_base_amount
        , magento_fps_orders.order_shipping_tax_base_amount
        , magento_fps_orders.magento_order_shipping_tax_base_amount
      ) AS order_shipping_tax_base_amount
    , magento_fps_orders.sales_flat_order_id
    , magento_fps_orders.mag_order_id
    , coalesce(
          base_currency_by_order.base_currency
        , magento_fps_orders.base_currency
      ) AS order_base_currency
  FROM all_orders
  LEFT JOIN orders_headers
    ON all_orders.fps_order_id = orders_headers.fps_order_id
  LEFT JOIN financial_orders
    ON all_orders.fps_order_id = financial_orders.fps_order_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_fps_orders` AS magento_fps_orders
    ON all_orders.fps_order_id = magento_fps_orders.fps_order_id
  LEFT JOIN orders_by_date
    ON all_orders.fps_order_id = orders_by_date.fps_order_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_farfetch_financial_base_currency_by_order` AS base_currency_by_order
    ON all_orders.fps_order_id = base_currency_by_order.fps_order_id

), lookup_geographies AS (

  SELECT
      farfetch_countries.farfetch_country_id AS customer_country_id
    , farfetch_countries.farfetch_country_name AS customer_country
    , shipping_countries.geography_type
    , shipping_countries.geography
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sg_farfetch_country` AS farfetch_countries
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_shipping_countries` AS shipping_countries
    ON farfetch_countries.magento_country_id = shipping_countries.shipping_country

), final AS (

  SELECT
      fps_orders.*
    , coalesce(
          fps_orders.order_base_currency
        , fps_stock_points.base_currency
        , 'USD'
      ) AS base_currency
    , (
        fps_stock_points.is_excluded_from_financial_reporting
        OR fps_tenants.is_excluded_from_financial_reporting
      ) AS is_excluded_from_financial_reporting
    , fps_stock_points.fps_merchant_name
    , coalesce(fps_tenants.business_unit, 'Omnichannel') AS business_unit
    , coalesce(fps_tenants.sales_channel, 'Farfetch') AS sales_channel
    , coalesce(
          nullif(substr(
    concat(
    
      coalesce(coalesce(fps_tenants.channel_or_gateway_header,'Farfetch')|| ' ' , '')
    
      , coalesce(fps_stock_points.channel_or_gateway_footer|| ' ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(coalesce(fps_tenants.channel_or_gateway_header,'Farfetch')|| ' ' , '')
    
      , coalesce(fps_stock_points.channel_or_gateway_footer|| ' ' , '')
    
  )) - length(' ')
      , 0
    )
), '')
        , 'Farfetch'
      ) AS channel_or_gateway
    , coalesce(fps_tenants.shipping_is_withheld, TRUE) AS shipping_is_withheld
    , cast(TRUE AS boolean) AS duties_are_withheld
    , coalesce(lookup_country_ids.geography_type, lookup_countries.geography_type) AS geography_type
    , coalesce(lookup_country_ids.geography, lookup_countries.geography) AS geography
  FROM fps_orders
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`fps_stock_points` AS fps_stock_points
    ON fps_orders.fps_stock_point_id = fps_stock_points.fps_stock_point_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`fps_tenants` AS fps_tenants
    ON fps_orders.fps_tenant_id = fps_tenants.fps_tenant_id
  LEFT JOIN lookup_geographies AS lookup_country_ids
    ON fps_orders.customer_country_id = lookup_country_ids.customer_country_id
  LEFT JOIN lookup_geographies AS lookup_countries
    ON fps_orders.customer_country = lookup_countries.customer_country

)

SELECT * FROM final