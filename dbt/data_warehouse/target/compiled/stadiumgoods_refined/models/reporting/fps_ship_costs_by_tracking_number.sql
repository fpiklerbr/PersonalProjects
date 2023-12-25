SELECT
      tracking_number
    , min(invoice_date) AS invoice_date
    , string_agg(DISTINCT invoice_id, ', ') AS invoice_id
    , sum(ship_cost) AS ship_cost
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_fps_invoiced_tracking_numbers`
  GROUP BY 1