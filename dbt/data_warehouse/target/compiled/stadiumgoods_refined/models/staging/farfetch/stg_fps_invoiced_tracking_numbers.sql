WITH converted AS (

  SELECT
      fps_order_id AS tracking_number
    , fps_shipping.file_name AS invoice_id
    , fps_shipping.invoice_date
    , fps_shipping.line_type_invoice
    , fps_shipping.base_currency
    , fps_shipping.base_cost
    , (fps_shipping.base_cost * daily_exchange_rates.in_usd) AS cost
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__fps_shipping` AS fps_shipping
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_forex_daily_exchange_rates` AS daily_exchange_rates
    ON fps_shipping.invoice_date = daily_exchange_rates.transaction_date
    AND fps_shipping.base_currency = daily_exchange_rates.currency

), grouped AS (

  SELECT
      tracking_number
    , invoice_id
    , invoice_date
    , string_agg(DISTINCT base_currency, ', ') AS base_currency
    , sum(base_cost) AS base_ship_cost
    , sum(CASE WHEN line_type_invoice = 'Shipping' THEN base_cost END) AS base_ship_cost_shipping
    , sum(CASE WHEN line_type_invoice = 'Return' THEN base_cost END) AS base_ship_cost_return
    , sum(CASE WHEN coalesce(line_type_invoice, '') NOT IN ('Shipping', 'Return') THEN base_cost END) AS base_ship_cost_other
    , sum(cost) AS ship_cost
    , sum(CASE WHEN line_type_invoice = 'Shipping' THEN cost END) AS ship_cost_shipping
    , sum(CASE WHEN line_type_invoice = 'Return' THEN cost END) AS ship_cost_return
    , sum(CASE WHEN coalesce(line_type_invoice, '') NOT IN ('Shipping', 'Return') THEN cost END) AS ship_cost_other
  FROM converted
  GROUP BY 1, 2, 3

), final AS (

  SELECT
      tracking_number
    , invoice_id
    , invoice_date
    , base_currency
    , base_ship_cost AS base_total_cost
    , base_ship_cost
    , base_ship_cost_shipping
    , base_ship_cost_return
    , base_ship_cost_other
    , ship_cost AS total_cost
    , ship_cost
    , ship_cost_shipping
    , ship_cost_return
    , ship_cost_other
    , cast('FPS Shipping' AS string ) AS invoice_type
    , cast('Order Fulfillment' AS string ) AS operations_category
  FROM grouped

)

SELECT * FROM final