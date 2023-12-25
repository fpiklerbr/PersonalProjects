

WITH final AS (

  SELECT
      tracking_number
    , MIN(ship_date) AS ship_date
    , string_agg(DISTINCT invoice_id, ', ') AS invoice_id
    , string_agg(DISTINCT invoice_id, ', ') AS file_name
    , MIN(invoice_date) AS file_date
    , MIN(invoice_date) AS invoice_date
    , sum(ship_cost) AS ship_cost
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_zebra_invoiced_tracking_numbers`
  GROUP BY 1

)

SELECT * FROM final