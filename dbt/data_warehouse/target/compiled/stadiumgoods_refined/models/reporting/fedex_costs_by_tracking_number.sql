

WITH p2p AS (

  SELECT
      tracking_number
    , min(pick_up_date) AS p2p_pick_up_date
    , min(invoice_date) AS p2p_invoice_date
    , string_agg(DISTINCT file_name, ', ') AS p2p_invoice_file
    , sum(total_cost) AS p2p_cost
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_p2p_invoiced_tracking_numbers`
  GROUP BY 1

), fedex AS (

  SELECT
      tracking_number
    , min(ship_date) AS fedex_ship_date
    , min(invoice_date) AS fedex_invoice_date
    , string_agg(DISTINCT invoice_id, ', ') AS fedex_invoice_id
    , sum(total_cost) AS fedex_cost
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_fedex_invoiced_tracking_numbers`
  WHERE tracking_number IS NOT NULL
  GROUP BY 1

), final AS (

  SELECT
      coalesce(p2p.tracking_number, fedex.tracking_number) AS tracking_number
		, p2p.p2p_pick_up_date
		, p2p.p2p_invoice_date
		, p2p.p2p_invoice_file
		, p2p.p2p_cost
		, fedex.fedex_ship_date
		, fedex.fedex_invoice_date
		, fedex.fedex_invoice_id
		, fedex.fedex_cost
  FROM p2p
  FULL JOIN fedex
    ON p2p.tracking_number = fedex.tracking_number

)

SELECT * FROM final