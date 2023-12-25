

  SELECT
      invoice_detail.invoice_id
    , invoice_detail.invoice_line
    , invoice_detail.invoice_date
    , invoice_detail.business_partner_id
    , invoice_detail.gross_price
    , invoice_detail.net_price
    , CAST(coalesce(
          sum(invoice_detail.net_price) OVER (
            PARTITION BY invoice_detail.invoice_id, invoice_detail.business_partner_id
            ORDER BY invoice_detail.net_price, invoice_detail.invoice_line
            ROWS BETWEEN UNBOUNDED PRECEDING AND 1 PRECEDING
          )
        , 0
      ) AS float64) AS net_price_running_sum
    , invoice_detail.document_id
    , invoice_detail.document_line
    , invoice_header.business_partner_name
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__pinvoiced` AS invoice_detail
  INNER JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__pinvoice` AS invoice_header
    ON invoice_detail.invoice_id = invoice_header.invoice_id