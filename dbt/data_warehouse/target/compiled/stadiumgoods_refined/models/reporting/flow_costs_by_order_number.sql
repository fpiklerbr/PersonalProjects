

SELECT
    tracking_number AS order_number
  , sum(ship_cost) AS ship_cost
  , sum(duties_cost) AS duties_cost
  , min(invoice_date) AS file_date
  , string_agg(DISTINCT file_name, ', ') AS file_name
  , string_agg(DISTINCT invoice_id, ', ') AS statement_name
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_flow_invoiced_tracking_numbers`
GROUP BY 1