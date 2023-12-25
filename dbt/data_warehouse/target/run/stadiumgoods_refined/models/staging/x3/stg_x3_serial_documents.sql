

  create or replace view `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_serial_documents`
  OPTIONS()
  as 

WITH null_dates AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_seeds`.`exceptions_x3_null_dates`

), document_types AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_seeds`.`lookup_x3_document_types`

), serials AS (

  SELECT
      serial_number
    , x3_sku
	, warehouse
	, issue_date
	, issue_document_id
	, issue_document_line
	, issue_document_type_code
	, CASE WHEN receipt_document_type_code <> 0 THEN CAST('Receipt' AS string) ELSE CAST('Serial' AS string) END AS status_document
	, CASE WHEN receipt_document_type_code <> 0 THEN receipt_date ELSE creation_date END AS document_date
	, CASE WHEN receipt_document_type_code <> 0 THEN receipt_document_id ELSE document_id END AS document_id
	, CASE WHEN receipt_document_type_code <> 0 THEN receipt_document_line ELSE document_line END AS document_line
	, CASE WHEN receipt_document_type_code <> 0 THEN receipt_document_type_code ELSE document_type_code END AS document_type_code
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__stoser`
  WHERE serial_number IS NOT NULL

), withdrawn AS (

  SELECT
      journal.serial_number
	, journal.x3_sku
	, CAST('Withdrawal' AS string) AS status_document
	, journal.journal_date AS document_date
	, journal.document_id
	, journal.document_line
	, journal.document_type_code
	, journal.warehouse
	, journal.location
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_journal` AS journal
  WHERE document_type_code = 8
    AND NOT EXISTS (SELECT * FROM serials WHERE serial_number = journal.serial_number AND x3_sku = journal.x3_sku)

), not_issued AS (

  SELECT
      serials.serial_number
    , serials.x3_sku
    , coalesce(stock.warehouse, serials.warehouse) AS warehouse
    , stock.location
    , stock.chronological_stock
	, serials.status_document
	, serials.document_date
	, serials.document_id
	, serials.document_line
	, serials.document_type_code
  FROM serials
  LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__stock` AS stock
    ON serials.serial_number = stock.serial_number
    AND serials.x3_sku = stock.x3_sku
  WHERE issue_document_type_code = 0

), allocated AS (

  SELECT
      not_issued.serial_number
    , not_issued.x3_sku
	, CAST('Allocation' AS string) AS status_document
	, allocation.creation_date AS document_date
	, allocation.document_id
	, allocation.document_line
	, allocation.document_type_code
    , not_issued.warehouse
    , not_issued.location
  FROM not_issued
  INNER JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__stoall` AS allocation
    ON allocation.warehouse = not_issued.warehouse
    AND allocation.chronological_stock = not_issued.chronological_stock

), issued AS (

  SELECT
      serial_number
	, x3_sku
	, CAST('Issue' AS string) AS status_document
	, issue_date AS document_date
	, issue_document_id AS document_id
	, issue_document_line AS document_line
	, issue_document_type_code AS document_type_code
	, warehouse
	, CAST(NULL AS string) AS location
  FROM serials
  WHERE issue_document_type_code <> 0

), not_allocated AS (

  SELECT
      serial_number
	, x3_sku
	, status_document
	, document_date
	, document_id
	, document_line
	, document_type_code
	, warehouse
	, location
  FROM not_issued
  WHERE NOT EXISTS (SELECT * FROM allocated WHERE serial_number = not_issued.serial_number AND x3_sku = not_issued.x3_sku)

), serial_documents AS (

  SELECT *
  FROM issued
  UNION ALL
  SELECT *
  FROM allocated
  UNION ALL
  SELECT *
  FROM not_allocated
  UNION ALL
  SELECT *
  FROM withdrawn

), final AS (

  SELECT
      serial_documents.serial_number
	, serial_documents.x3_sku
	, serial_documents.status_document
	, CASE WHEN null_dates.null_date IS NOT NULL THEN NULL ELSE serial_documents.document_date END AS document_date
	, serial_documents.document_id
	, serial_documents.document_line
	, coalesce(document_types.document_type, CAST(serial_documents.document_type_code AS string)) AS document_type
	, serial_documents.warehouse AS serial_warehouse
	, serial_documents.location AS serial_location
    , order_lines.x3_order_id
    , order_lines.x3_order_line
    , current_timestamp AS rebuild_timestamp
  FROM serial_documents
  LEFT JOIN null_dates
    ON serial_documents.document_date = null_dates.null_date
  LEFT JOIN document_types
    ON serial_documents.document_type_code = document_types.document_type_code
  LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_order_line_by_document_line` AS order_lines
    ON serial_documents.document_type_code = order_lines.document_type_code
    AND serial_documents.document_id = order_lines.document_id
    AND serial_documents.document_line = order_lines.document_line

)

SELECT * FROM final;

