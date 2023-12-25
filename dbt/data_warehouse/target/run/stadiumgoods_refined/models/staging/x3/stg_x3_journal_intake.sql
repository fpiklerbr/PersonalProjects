

  create or replace view `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_journal_intake`
  OPTIONS()
  as 

WITH receipt_detail AS (

  SELECT
      receipt_id
    , receipt_line
    , cost
    , supplier_id
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__preceiptd`

), receipt_header AS (

  SELECT
      receipt_id
    , supplier_reference
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__preceipt`

), supplier AS (

  SELECT
      supplier_id
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__bpsupplier`
  WHERE supplier_category_code <> 'SIT'

), all_rows AS (

  SELECT
      journal_receipts.serial_number
    , journal_receipts.x3_sku
    , journal_receipts.journal_date
    , journal_receipts.created_at
    , journal_receipts.row_id
    , journal_receipts.document_type_code
    , journal_receipts.document_type
    , journal_receipts.document_id
    , journal_receipts.document_line
    , journal_receipts.warehouse
    , journal_receipts.location
    , journal_receipts.x3_size_code
    , journal_receipts.creation_user_id
    , journal_receipts.creation_user_name
    , journal_receipts.serial_row
    , journal_receipts.serial_row_count
    , journal_receipts.creation_nyc
    , journal_receipts.max_serial_row
    , journal_receipts.x3_sku_row
    , receipt_header.supplier_reference
    , receipt_detail.cost
    , min(journal_receipts.serial_row) OVER (PARTITION BY journal_receipts.serial_number, journal_receipts.x3_sku) AS min_serial_row
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_journal_receipts` AS journal_receipts
  INNER JOIN receipt_header
    ON journal_receipts.document_id = receipt_header.receipt_id
  INNER JOIN receipt_detail
    ON journal_receipts.document_id = receipt_detail.receipt_id
    AND journal_receipts.document_line = receipt_detail.receipt_line
  INNER JOIN supplier ON supplier.supplier_id = receipt_detail.supplier_id

), final AS (

    SELECT *
    FROM all_rows
    WHERE serial_row = min_serial_row

)

SELECT * FROM final;

