

SELECT
      creditmemos.invoice_id AS creditmemo_id
	, creditmemos.created_at AS creditmemo_created_at
	, creditmemos.amount_excluding_tax AS creditmemo_total_excluding_tax
	, nullif(
     greatest(
      coalesce(creditmemos.amount_including_tax - creditmemos.amount_excluding_tax, CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      ,coalesce(creditmemos.tax_amount, CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      
      )
     , CAST('-9.9999999999999999999999999999999999999E+28' AS float64)
  ) AS creditmemo_total_tax
    , creditmemo_lines.invoice_line AS creditmemo_line
	, creditmemo_lines.price AS creditmemo_line_price
    , creditmemo_lines.discount AS creditmemo_line_discount
    , creditmemo_lines.shipping AS creditmemo_line_shipping
    , nullif(
     greatest(
      coalesce(creditmemo_lines.tax, CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      ,coalesce((creditmemo_lines.price_including_tax - creditmemo_lines.price_excluding_tax), CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      
      )
     , CAST('-9.9999999999999999999999999999999999999E+28' AS float64)
  ) AS creditmemo_line_tax
    , creditmemo_lines.gift_card AS creditmemo_line_gift_card
    , coalesce(invoice_orders.x3_order_id, return_orders.x3_order_id) AS x3_order_id
    , coalesce(invoice_orders.x3_order_line, return_orders.x3_order_line) AS x3_order_line
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__sinvoice` AS creditmemos
  INNER JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__sinvoiced` AS creditmemo_lines
    ON creditmemos.invoice_id = creditmemo_lines.invoice_id
  LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_order_line_by_document_line` AS invoice_orders
    ON creditmemo_lines.invoice_id = invoice_orders.document_id
    AND creditmemo_lines.invoice_line = invoice_orders.document_line
  LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_order_line_by_document_line` AS return_orders
    ON creditmemo_lines.return_id = return_orders.document_id
    AND creditmemo_lines.return_line = return_orders.document_line
  WHERE creditmemos.invoice_type_code = 2