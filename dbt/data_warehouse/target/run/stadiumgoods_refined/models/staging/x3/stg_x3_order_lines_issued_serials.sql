

  create or replace table `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_order_lines_issued_serials`
  
  
  OPTIONS()
  as (
    

WITH issued_serials AS (

  SELECT
      x3_order_id
    , x3_order_line
    , document_type
    , document_date
    , document_id
    , document_line
    , serial_number
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_serial_documents`
  WHERE status_document = 'Issue'
    AND x3_order_id IS NOT NULL
    AND x3_order_line IS NOT NULL

), order_line_match AS (

  SELECT
      issued_serials.*
    , row_number() OVER (
        PARTITION BY
            issued_serials.x3_order_id
          , issued_serials.x3_order_line
        ORDER BY
            shipment_order_lines.delivery_id IS NOT NULL DESC
          , invoice_order_lines.invoice_id IS NOT NULL DESC
          , document_date DESC
      ) AS issue_priority
    , shipment_order_lines.delivery_id IS NOT NULL AS shipment_match
    , invoice_order_lines.invoice_id IS NOT NULL AS invoice_match
  FROM issued_serials
  LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_sales_order_quantity` AS shipment_order_lines
    ON issued_serials.document_type = 'Shipment'
    AND issued_serials.x3_order_id = shipment_order_lines.x3_order_id
    AND issued_serials.x3_order_line = shipment_order_lines.x3_order_line
    AND issued_serials.document_id = shipment_order_lines.delivery_id
    AND issued_serials.document_line = shipment_order_lines.delivery_line
  LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_order_lines_invoices` AS invoice_order_lines
    ON issued_serials.document_type = 'Sales invoice'
    AND issued_serials.x3_order_id = invoice_order_lines.x3_order_id
    AND issued_serials.x3_order_line = invoice_order_lines.x3_order_line
    AND issued_serials.document_id = invoice_order_lines.invoice_id
    AND issued_serials.document_line = invoice_order_lines.invoice_line

), final AS (

  SELECT
      x3_order_id
    , x3_order_line
    , string_agg(DISTINCT CASE WHEN issue_priority = 1 THEN document_type END, ', ') AS issue_type
    , string_agg(DISTINCT CASE WHEN issue_priority = 1 THEN document_id END, ', ') AS issue_id
    , string_agg(DISTINCT CASE WHEN issue_priority = 1 THEN cast(document_line AS string ) END, ', ') AS issue_line
    , string_agg(DISTINCT CASE WHEN issue_priority = 1 THEN serial_number END, ', ') AS issued_serial
    , count(*) AS issued_serial_count
    , string_agg(DISTINCT document_type, ', ') AS all_issue_types
    , string_agg(DISTINCT document_id, ', ') AS all_issue_documents
    , string_agg(DISTINCT serial_number, ', ') AS all_issued_serials
  FROM order_line_match
  GROUP BY 1, 2

)

SELECT * FROM final
  );
    