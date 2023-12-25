

WITH  null_dates AS (

  SELECT
    null_date
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_seeds`.`exceptions_x3_null_dates`

), payment_invoices AS (

  SELECT
      line_invoice AS invoice_id
    , string_agg(DISTINCT consignor_id, ', ') AS consignor_id
    , string_agg(DISTINCT consignor_name, ', ') AS consignor_name
    , string_agg(DISTINCT payment_id, ', ') AS payment_id
    , min(accounting_date) AS accounting_date
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_reporting`.`x3_consignor_payments`
  GROUP BY 1

), final AS (

  SELECT
      serials.serial_number
    , serials.x3_sku
    , invoice_lines.invoice_id AS payout_invoice_id
    , invoice_lines.invoice_line AS payout_invoice_line
    , invoice_lines.invoice_date AS payout_invoice_date
    , invoice_lines.business_partner_id AS consignor_id
    , invoice_lines.business_partner_name AS invoice_consignor_name
    , invoice_lines.gross_price
    , invoice_lines.net_price
    , CASE
        WHEN payouts.paid_amount - invoice_lines.net_price_running_sum >= invoice_lines.net_price
          THEN invoice_lines.net_price
        WHEN payouts.paid_amount - invoice_lines.net_price_running_sum > 0
          THEN payouts.paid_amount - invoice_lines.net_price_running_sum
        ELSE
          0
      END AS line_paid_amount
    , payouts.total_amount AS invoice_total_amount
    , payouts.paid_amount AS invoice_paid_amount
    , payouts.invoice_open_amount
    , CASE WHEN null_dates.null_date IS NULL THEN payouts.payment_date END AS payout_date
    , payment_invoices.payment_id
    , payment_invoices.consignor_name AS payment_consignor_name
    , payment_invoices.accounting_date AS payment_accounting_date
    , current_timestamp AS rebuild_timestamp
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_invoice_lines` AS invoice_lines
  INNER JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__stoser` AS serials
    ON invoice_lines.document_id = serials.document_id
    AND invoice_lines.document_line = serials.document_line
  LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_payouts` AS payouts
    ON invoice_lines.invoice_id = payouts.invoice_id
    AND invoice_lines.business_partner_id = payouts.business_partner_id
  LEFT JOIN null_dates
    ON null_dates.null_date = payouts.payment_date
  LEFT JOIN payment_invoices
    ON invoice_lines.invoice_id = payment_invoices.invoice_id

)

SELECT * FROM final