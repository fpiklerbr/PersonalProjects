WITH mag_orders AS (

  SELECT *
    , substr(mag_order_id, CHAR_LENGTH(mag_order_id) - (6 - 1), 6) AS last_six_digits_of_mag_order_id
    , lower(nullif(trim(customer_email), '')) AS mag_order_customer_email
    , upper(nullif(
  CAST(regexp_replace(customer_email, r'[^a-zA-Z0-9]+', '') AS string)


, '')) AS clean_email
    , substr(
    concat(
    
      coalesce(nullif(trim(customer_prefix), '')|| ' ' , '')
    
      , coalesce(nullif(trim(customer_firstname), '')|| ' ' , '')
    
      , coalesce(nullif(trim(customer_middlename), '')|| ' ' , '')
    
      , coalesce(nullif(trim(customer_lastname), '')|| ' ' , '')
    
      , coalesce(nullif(trim(customer_suffix), '')|| ' ' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(nullif(trim(customer_prefix), '')|| ' ' , '')
    
      , coalesce(nullif(trim(customer_firstname), '')|| ' ' , '')
    
      , coalesce(nullif(trim(customer_middlename), '')|| ' ' , '')
    
      , coalesce(nullif(trim(customer_lastname), '')|| ' ' , '')
    
      , coalesce(nullif(trim(customer_suffix), '')|| ' ' , '')
    
  )) - length(' ')
      , 0
    )
) AS customer_name
    , CAST(coalesce(base_shipping_amount, 0) AS float64) AS total_shipping_price
    , CAST(coalesce(base_shipping_tax_amount, 0) AS float64) AS total_shipping_tax
    , CAST(coalesce(base_shipping_discount_amount, 0) AS float64) AS total_shipping_discount
    , CAST(coalesce(base_grand_total, 0) AS float64) AS total_payment_amount
    , CAST(coalesce(base_credit_amount, 0) AS float64) AS total_credit_amount
    , (
          CAST(coalesce(base_total_refunded, 0) AS float64)
        - CAST(coalesce(base_credit_total_refunded, 0) AS float64)
      ) AS total_payment_refunded
    , CAST(coalesce(base_credit_total_refunded, 0) AS float64) AS total_credit_refunded
    , CAST(coalesce(base_total_invoiced, 0) AS float64) AS total_invoiced_amount
    , SAFE_CAST(created_at AS timestamp) AS mag_order_created_at
    , SAFE_CAST(updated_at AS timestamp) AS mag_order_updated_at
    , DATETIME(SAFE_CAST(created_at AS timestamp), 'America/New_York') AS order_creation_nyc
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order`

), mercaux_orders AS (

  SELECT
      sales_flat_order.sales_flat_order_id
    , mercaux_transactions.channel_or_gateway
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order` AS sales_flat_order
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_mercaux_transactions` AS mercaux_transactions
    ON sales_flat_order.mag_order_id = mercaux_transactions.mag_order_id
  WHERE sales_flat_order.channel = 'mercaux'

), x3_orders AS (

  SELECT
      mag_order_id
    , string_agg(DISTINCT x3_order_id, ', ') AS mag_x3_order_id
    , string_agg(DISTINCT x3_status, ', ') AS mag_x3_status
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__smv_x3_order`
  GROUP BY 1

), final AS (

  SELECT
      mag_orders.*
    , coalesce(mercaux_orders.channel_or_gateway, nullif(mag_orders.channel, 'dsco')) AS order_channel
    , x3_orders.mag_x3_order_id
    , x3_orders.mag_x3_status
  FROM mag_orders
  LEFT JOIN x3_orders
    ON mag_orders.mag_order_id = x3_orders.mag_order_id
  LEFT JOIN mercaux_orders
    ON mag_orders.sales_flat_order_id = mercaux_orders.sales_flat_order_id

)

SELECT * FROM final