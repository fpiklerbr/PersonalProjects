

WITH last_journal AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_journal`
  WHERE serial_row = serial_row_count

), last_receipt AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_journal_receipts`
  WHERE serial_row = max_serial_row

), all_journal_intake_date_rows AS (

  SELECT
    journal.*
      , max(journal.serial_row) OVER (PARTITION BY journal.serial_number, journal.x3_sku) AS max_serial_row
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_journal` AS journal
  INNER JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_journal_intake` AS intake
    ON journal.serial_number = intake.serial_number
    AND journal.x3_sku = intake.x3_sku
    AND journal.journal_date = intake.journal_date

), intake_eod AS (

  SELECT *
  FROM all_journal_intake_date_rows
  WHERE serial_row = max_serial_row

), zserialupd AS (

  SELECT DISTINCT
      serial_number
    , x3_sku
    , simple_sku
, DATETIME(SAFE_CAST(last_modified_at AS timestamp), 'America/New_York') AS last_modified_nyc
    , is_available
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__zserialupd`

), final AS (

  SELECT DISTINCT
      serial_union.serial_number
    , serial_union.x3_sku
    , yserinf.row_id AS yserinf_rowid
    , last_journal.x3_size_code AS size_uom
    , zserialupd.simple_sku
    , zserialupd.last_modified_nyc
    , zserialupd.is_available AS available
    , yserinf.commission_rate
    , yserinf.price
    , yserinf.original_serial
    , coalesce(yserinf.consignor_id, yseristatus.consignor_id) AS consignor_id
    , yserinf.note
    , yserinf.conditions
    , intake.journal_date AS intake_date
    , intake.creation_nyc AS intake_creation_nyc
    , intake.document_id AS intake_id
    , intake.document_line AS intake_line
    , intake.cost AS intake_cost
    , intake.document_type AS intake_type
    , intake.warehouse AS intake_warehouse
    , intake.location AS intake_location
    , intake.supplier_reference AS intake_seller_portal_ticket
    , intake.creation_user_id AS intake_created_by_user_id
    , intake.creation_user_name AS intake_created_by_user_name
    , intake_eod.journal_date AS intake_eod_date
    , intake_eod.creation_nyc AS intake_eod_creation_nyc
    , intake_eod.document_id AS intake_eod_id
    , intake_eod.document_line AS intake_eod_line
    , intake_eod.document_type AS intake_eod_type
    , intake_eod.warehouse AS intake_eod_warehouse
    , intake_eod.location AS intake_eod_location
    , intake_eod.creation_user_id AS intake_eod_created_by_user_id
    , intake_eod.creation_user_name AS intake_eod_created_by_user_name
    , last_receipt.journal_date AS last_receipt_date
    , last_receipt.creation_nyc AS last_receipt_creation_nyc
    , last_receipt.document_id AS last_receipt_id
    , last_receipt.document_line AS last_receipt_line
    , last_receipt.document_type AS last_receipt_type
    , last_receipt.warehouse AS last_receipt_warehouse
    , last_receipt.location AS last_receipt_location
    , last_receipt.creation_user_id AS last_receipt_created_by_user_id
    , last_receipt.creation_user_name AS last_receipt_created_by_user_name
    , last_journal.journal_date AS last_journal_date
    , last_journal.creation_nyc AS last_journal_creation_nyc
    , last_journal.document_id AS last_journal_id
    , last_journal.document_line AS last_journal_line
    , last_journal.document_type AS last_journal_type
    , last_journal.warehouse AS last_journal_warehouse
    , last_journal.location AS last_journal_location
    , last_journal.creation_user_id AS last_journal_created_by_user_id
    , last_journal.creation_user_name AS last_journal_created_by_user_name
    , yseristatus.intake_date AS yseristatus_intake_date
    , yseristatus.issue_date AS yseristatus_issue_date
    , yseristatus.consignment_status AS yseristatus_consignment_status
    , yseristatus.x3_order_id AS yseristatus_order_id
    , yseristatus.paid_out_status AS yseristatus_paid_out_status
    , yseristatus.payout_date AS yseristatus_payout_date
    , yseristatus.cost AS yseristatus_cost
    , yseristatus.payout_invoice_id
    , yseristatus.payout_invoice_line
    , purchase.purchase_id
    , purchase.purchase_line
    , purchase.price AS purchase_price
    , purchase.purchase_reference
    , stock.stock_status
    , current_timestamp AS rebuild_timestamp
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_serial_union` AS serial_union
  LEFT JOIN zserialupd
    ON serial_union.serial_number = zserialupd.serial_number
    AND serial_union.x3_sku = zserialupd.x3_sku
  LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_journal_intake` AS intake
    ON serial_union.serial_number = intake.serial_number
    AND serial_union.x3_sku = intake.x3_sku
  LEFT JOIN last_journal
    ON serial_union.serial_number = last_journal.serial_number
    AND serial_union.x3_sku = last_journal.x3_sku
  LEFT JOIN last_receipt
    ON serial_union.serial_number = last_receipt.serial_number
    AND serial_union.x3_sku = last_receipt.x3_sku
  LEFT JOIN intake_eod
    ON serial_union.serial_number = intake_eod.serial_number
    AND serial_union.x3_sku = intake_eod.x3_sku
  LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_journal_purchase` AS purchase
    ON serial_union.serial_number = purchase.serial_number
    AND serial_union.x3_sku = purchase.x3_sku
  LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_yserinf` AS yserinf
    ON serial_union.serial_number = yserinf.serial_number
    AND serial_union.x3_sku = yserinf.x3_sku
  LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__yseristatus` AS yseristatus
    ON serial_union.serial_number = yseristatus.serial_number
    AND serial_union.x3_sku = yseristatus.x3_sku
  LEFT JOIN `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__stock` AS stock
    ON serial_union.serial_number = stock.serial_number
    AND serial_union.x3_sku = stock.x3_sku

)

SELECT * FROM final