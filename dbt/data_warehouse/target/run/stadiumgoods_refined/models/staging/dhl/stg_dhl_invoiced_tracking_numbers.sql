

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_dhl_invoiced_tracking_numbers`
  
  
  OPTIONS()
  as (
    WITH standard_invoices AS (

  SELECT
      tracking_number
    , ship_date
    , invoice_id
    , invoice_date
    , CASE WHEN product_code = 'Z' THEN 'Duties' ELSE 'Order Fulfillment' END AS operations_category
    , currency AS base_currency
    , total_cost AS base_total_cost
    , cast(NULL AS float64 ) AS base_customs_cost
    , CASE
        WHEN product_code = 'Z'
        THEN total_cost
      END AS base_duties_cost
    , CASE
        WHEN product_code <> 'Z'
        THEN total_cost
      END AS base_ship_cost
    , CASE
        WHEN product_code <> 'Z'
        THEN weight_charge + weight_tax_vat
      END AS base_ship_cost_shipping
    , CASE
        WHEN product_code <> 'Z'
        THEN (
              CASE WHEN xc1_code = 'FF' THEN xc1_total ELSE 0 END
            + CASE WHEN xc2_code = 'FF' THEN xc2_total ELSE 0 END
            + CASE WHEN xc3_code = 'FF' THEN xc3_total ELSE 0 END
            + CASE WHEN xc4_code = 'FF' THEN xc4_total ELSE 0 END
            + CASE WHEN xc5_code = 'FF' THEN xc5_total ELSE 0 END
            + CASE WHEN xc6_code = 'FF' THEN xc6_total ELSE 0 END
            + CASE WHEN xc7_code = 'FF' THEN xc7_total ELSE 0 END
            + CASE WHEN xc8_code = 'FF' THEN xc8_total ELSE 0 END
            + CASE WHEN xc9_code = 'FF' THEN xc9_total ELSE 0 END
        )
      END AS base_ship_cost_fuel_surcharge
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`dhl__standard_invoices`
  WHERE line_type = 'S'

), customs_invoices AS (

  SELECT
      tracking_number
    , ship_date
    , invoice_id
    , invoice_date
    , cast('Customs' AS string ) AS operations_category
    , currency AS base_currency
    , total_cost AS base_total_cost
    , total_cost AS base_customs_cost
    , cast(NULL AS float64 ) AS base_duties_cost
    , cast(NULL AS float64 ) AS base_ship_cost
    , cast(NULL AS float64 ) AS base_ship_cost_shipping
    , cast(NULL AS float64 ) AS base_ship_cost_fuel_surcharge
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`dhl__customs_invoices`
  WHERE line_type = 'S'

), all_invoices AS (

  SELECT *
  FROM standard_invoices
  UNION ALL
  SELECT *
  FROM customs_invoices

), all_charges AS (

  SELECT
      *
    , cast(round(cast((
          base_ship_cost
        - base_ship_cost_shipping
        - base_ship_cost_fuel_surcharge
      ) AS numeric ), 2) AS float64 ) AS base_ship_cost_other_charges
  FROM all_invoices

), final AS (

  SELECT
      all_charges.*

    , (all_charges.base_total_cost * daily_exchange_rates.in_usd) AS total_cost

    , (all_charges.base_customs_cost * daily_exchange_rates.in_usd) AS customs_cost

    , (all_charges.base_duties_cost * daily_exchange_rates.in_usd) AS duties_cost

    , (all_charges.base_ship_cost * daily_exchange_rates.in_usd) AS ship_cost

    , (all_charges.base_ship_cost_shipping * daily_exchange_rates.in_usd) AS ship_cost_shipping

    , (all_charges.base_ship_cost_fuel_surcharge * daily_exchange_rates.in_usd) AS ship_cost_fuel_surcharge

    , (all_charges.base_ship_cost_other_charges * daily_exchange_rates.in_usd) AS ship_cost_other_charges

    , cast('DHL Invoice' AS string ) AS invoice_type
  FROM all_charges
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_forex_daily_exchange_rates` AS daily_exchange_rates
    ON all_charges.invoice_date = daily_exchange_rates.transaction_date
    AND all_charges.base_currency = daily_exchange_rates.currency

)

SELECT * FROM final
  );
    