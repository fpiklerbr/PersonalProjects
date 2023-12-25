

WITH final AS (

  SELECT
      tracking_number AS ship_reference
    , min(CASE WHEN ship_cost IS NOT NULL THEN ship_date END) AS ship_cost_ship_date
    , min(CASE WHEN ship_cost IS NOT NULL THEN invoice_date END) AS ship_cost_file_date
    , string_agg(DISTINCT CASE WHEN ship_cost IS NOT NULL THEN invoice_id END, ', ') AS ship_cost_file_name
    , sum(ship_cost) AS ship_cost
    , min(CASE WHEN duties_cost IS NOT NULL THEN ship_date END) AS duties_cost_ship_date
    , min(CASE WHEN duties_cost IS NOT NULL THEN invoice_date END) AS duties_cost_file_date
    , string_agg(DISTINCT CASE WHEN duties_cost IS NOT NULL THEN invoice_id END, ', ') AS duties_cost_file_name
    , sum(duties_cost) AS duties_cost
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_tmall_b2c_invoiced_tracking_numbers`
  GROUP BY 1

)

SELECT * FROM final