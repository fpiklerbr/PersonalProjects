

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_tmall_b2c_invoiced_tracking_numbers`
  
  
  OPTIONS()
  as (
    WITH daily_exchange_rates AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_forex_daily_exchange_rates`

), b2c_shipping AS (

  SELECT
      
  CAST(regexp_replace(ship_reference, substr(
    concat(
    
      coalesce('^'|| '' , '')
    
      , coalesce(chr(39)|| '' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce('^'|| '' , '')
    
      , coalesce(chr(39)|| '' , '')
    
  )) - length('')
      , 0
    )
), '') AS string)


 AS tracking_number
    , ship_date
    , file_name AS invoice_id
    , cast( safe_cast(datetime(safe_cast(file_time AS timestamp), 'America/New_York') AS datetime) AS date) AS invoice_date
    , currency AS base_currency
    , ship_cost AS base_total_cost
    , ship_cost AS base_ship_cost
    , cast(NULL AS float64 ) AS base_duties_cost
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`tmall__b2c_shipping`

), b2c_duties AS (

  SELECT
      
  CAST(regexp_replace(ship_reference, substr(
    concat(
    
      coalesce('^'|| '' , '')
    
      , coalesce(chr(39)|| '' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce('^'|| '' , '')
    
      , coalesce(chr(39)|| '' , '')
    
  )) - length('')
      , 0
    )
), '') AS string)


 AS tracking_number
    , ship_date
    , file_name AS invoice_id
    , cast( safe_cast(datetime(safe_cast(file_time AS timestamp), 'America/New_York') AS datetime) AS date) AS invoice_date
    , currency AS base_currency
    , duties_cost AS base_total_cost
    , cast(NULL AS float64 ) AS base_ship_cost
    , duties_cost AS base_duties_cost
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`tmall__b2c_duties`

), alipay_shipping AS (

  SELECT
      crossdock_reference AS tracking_number
    , cast(NULL AS date) AS ship_date
    , file_name AS invoice_id
    , cast( safe_cast(datetime(safe_cast(file_time AS timestamp), 'America/New_York') AS datetime) AS date) AS invoice_date
    , cast('CNY' AS string ) AS base_currency
    , (-1 * payment_shipping_fee_rmb) AS base_total_cost
    , (-1 * payment_shipping_fee_rmb) AS base_ship_cost
    , cast(NULL AS float64 ) AS base_duties_cost
    , (-1 * payment_shipping_fee) AS total_cost
    , (-1 * payment_shipping_fee) AS ship_cost
    , cast(NULL AS float64 ) AS duties_cost
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_alipay_transaction_fees` AS alipay
  WHERE payment_shipping_fee IS NOT NULL
    AND NOT EXISTS (SELECT * FROM b2c_shipping WHERE tracking_number = alipay.crossdock_reference)

), alipay_duties AS (

  SELECT
      crossdock_reference AS tracking_number
    , cast(NULL AS date) AS ship_date
    , file_name AS invoice_id
    , cast( safe_cast(datetime(safe_cast(file_time AS timestamp), 'America/New_York') AS datetime) AS date) AS invoice_date
    , cast('CNY' AS string ) AS base_currency
    , (-1 * payment_duties_fee_rmb) AS base_total_cost
    , cast(NULL AS float64 ) AS base_ship_cost
    , (-1 * payment_duties_fee_rmb) AS base_duties_cost
    , (-1 * payment_duties_fee) AS total_cost
    , cast(NULL AS float64 ) AS ship_cost
    , (-1 * payment_duties_fee) AS duties_cost
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_alipay_transaction_fees` AS alipay
  WHERE payment_duties_fee IS NOT NULL
  AND NOT EXISTS (SELECT * FROM b2c_duties WHERE tracking_number = alipay.crossdock_reference)

), b2c_union AS (

  SELECT *
  FROM b2c_shipping
  UNION ALL
  SELECT *
  FROM b2c_duties

), b2c_converted AS (

  SELECT
      b2c_union.tracking_number
    , b2c_union.ship_date
    , b2c_union.invoice_id
    , b2c_union.invoice_date
    , b2c_union.base_currency
    , b2c_union.base_total_cost
    , b2c_union.base_ship_cost
    , b2c_union.base_duties_cost
    , (b2c_union.base_total_cost * daily_exchange_rates.in_usd) AS total_cost
    , (b2c_union.base_ship_cost * daily_exchange_rates.in_usd) AS ship_cost
    , (b2c_union.base_duties_cost * daily_exchange_rates.in_usd) AS duties_cost
  FROM b2c_union
  INNER JOIN daily_exchange_rates
    ON b2c_union.ship_date = daily_exchange_rates.transaction_date
    AND b2c_union.base_currency = daily_exchange_rates.currency

), b2c_alipay_union AS (

  SELECT *
  FROM b2c_converted
  UNION ALL
  SELECT *
  FROM alipay_shipping
  UNION ALL
  SELECT *
  FROM alipay_duties

), final AS (

  SELECT
      *
    , cast('Tmall B2C' AS string ) AS invoice_type
    , cast('Order Fulfillment' AS string ) AS operations_category
  FROM b2c_alipay_union

)

SELECT * FROM final
  );
    