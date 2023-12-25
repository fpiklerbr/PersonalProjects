

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`dhl_costs_by_tracking_number`
  
  
  OPTIONS()
  as (
    

WITH final AS (

  SELECT
      tracking_number
    , min(CASE WHEN operations_category = 'Order Fulfillment' THEN ship_date END) AS ship_invoice_ship_date
    , min(CASE WHEN operations_category = 'Order Fulfillment' THEN invoice_date END) AS ship_invoice_date
    , string_agg(DISTINCT CASE WHEN operations_category = 'Order Fulfillment' THEN invoice_id END, ', ') AS ship_invoice_id
    , sum(ship_cost) AS ship_cost
    , min(CASE WHEN operations_category = 'Duties' THEN ship_date END) AS duties_invoice_ship_date
    , min(CASE WHEN operations_category = 'Duties' THEN invoice_date END) AS duties_invoice_date
    , string_agg(DISTINCT CASE WHEN operations_category = 'Duties' THEN invoice_id END, ', ') AS duties_invoice_id
    , sum(duties_cost) AS duties_cost
    , min(CASE WHEN operations_category = 'Customs' THEN ship_date END) AS customs_invoice_ship_date
    , min(CASE WHEN operations_category = 'Customs' THEN invoice_date END) AS customs_invoice_date
    , string_agg(DISTINCT CASE WHEN operations_category = 'Customs' THEN invoice_id END, ', ') AS customs_invoice_id
    , sum(customs_cost) AS customs_cost
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_dhl_invoiced_tracking_numbers`
  GROUP BY 1

)

SELECT * FROM final
  );
    