

WITH transport_customer_shipment_report AS (

  SELECT
      tracking_number
    , invoice_id
    , invoice_date
    , total_cost
    , total_cost AS ship_cost
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`mainfreight__customer_shipment_report`

), edi AS (

  SELECT
      file_name
    , file_time
    , edi_string AS edi_raw
    , SPLIT(edi_string,
  '\n'
) AS edi_lines
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`mainfreight__edi_210`

), edi_unnested AS (

  SELECT
      edi.file_name
    , edi.file_time
    , edi.edi_raw
    , SPLIT(edi_line,
  '*'
) AS line_values
  FROM edi, unnest(edi.edi_lines) AS edi_line

), edi_parsed AS (

  SELECT
      cast(line_values[ORDINAL(4)] AS string) AS tracking_number
    , cast(line_values[ORDINAL(3)] AS string) AS invoice_id
    , CAST(
    safe_cast(CASE
          WHEN


  regexp_contains(line_values[ORDINAL(7)], r'(?i)^[0-9]{4}[0-9]{1,2}[0-9]{1,2}$')


          THEN  parse_timestamp('%Y%m%d', line_values[ORDINAL(7)])
        END as timestamp)


 AS date) AS invoice_date
    , cast(line_values[ORDINAL(8)] AS float64) / 100 AS total_cost
    , file_name
    , file_time
  FROM edi_unnested
  WHERE line_values[ORDINAL(1)] = 'B3'

), edi_with_window AS (

  SELECT
      *
    , row_number() OVER (PARTITION BY tracking_number, invoice_id ORDER BY file_time DESC, file_name) AS tracking_invoice_row
  FROM edi_parsed

), edi_deduped AS (

  SELECT *
  FROM edi_with_window
  WHERE tracking_invoice_row = 1

), unioned AS (

  SELECT
      tracking_number
    , invoice_id
    , invoice_date
    , total_cost
  FROM edi_deduped
  UNION ALL
  SELECT
      tracking_number
    , invoice_id
    , invoice_date
    , total_cost
  FROM transport_customer_shipment_report
  WHERE NOT EXISTS (SELECT * FROM edi_deduped WHERE invoice_id = transport_customer_shipment_report.invoice_id)

), final AS (

  SELECT
      *
    , total_cost AS ship_cost
    , cast('Main Freight' AS string) AS invoice_type
    , cast('SG&A' AS string) AS operations_category
  FROM unioned

)

SELECT * FROM final