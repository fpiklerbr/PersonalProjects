

  create or replace view `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_distinct_serials`
  OPTIONS()
  as SELECT
    serial_number
/* String aggregation */
  , string_agg(DISTINCT x3_sku, ', ') AS x3_sku
  , string_agg(DISTINCT size_uom, ', ') AS size_uom
  , string_agg(DISTINCT simple_sku, ', ') AS simple_sku
  , string_agg(DISTINCT consignor_id, ', ') AS consignor_id
  , string_agg(DISTINCT consignor_name, ', ') AS consignor_name
  , string_agg(DISTINCT consignor_country, ', ') AS consignor_country
  , string_agg(DISTINCT note, ', ') AS note
  , string_agg(DISTINCT yseristatus_consignment_status, ', ') AS yseristatus_consignment_status
  , string_agg(DISTINCT yseristatus_paid_out_status, ', ') AS yseristatus_paid_out_status
  , string_agg(DISTINCT intake_warehouse, ', ') AS intake_warehouse
  , string_agg(DISTINCT intake_seller_portal_ticket, ', ') AS intake_seller_portal_ticket
  , string_agg(DISTINCT last_journal_warehouse, ', ') AS last_journal_warehouse
  , string_agg(DISTINCT status_document, ', ') AS status_document
  , string_agg(DISTINCT document_type, ', ') AS document_type
  , string_agg(DISTINCT intake_id, ', ') AS intake_id
  , string_agg(DISTINCT last_journal_type, ', ') AS last_journal_type
  , string_agg(DISTINCT last_journal_id, ', ') AS last_journal_id
  , string_agg(DISTINCT serial_warehouse, ', ') AS serial_warehouse
  , string_agg(DISTINCT serial_location, ', ') AS serial_location
  , string_agg(DISTINCT x3_order_id, ', ') AS x3_order_id
  , string_agg(DISTINCT document_id, ', ') AS document_id
  , string_agg(DISTINCT serial_source, ', ') AS serial_source
  , string_agg(DISTINCT serial_relationship, ', ') AS serial_relationship
  , string_agg(DISTINCT serial_inventory, ', ') AS serial_inventory
  , string_agg(DISTINCT purchase_reference, ', ') AS purchase_reference
  , string_agg(DISTINCT payout_invoice_id, ', ') AS payout_invoice_id
  , string_agg(DISTINCT purchase_id, ', ') AS purchase_id
  , string_agg(DISTINCT original_serial, ', ') AS original_serial
  , string_agg(DISTINCT stock_status, ', ') AS stock_status
  , string_agg(DISTINCT conditions, ', ' order by conditions ASC) AS conditions

/* MIN */
  , min(yseristatus_intake_date) AS yseristatus_intake_date
  , min(intake_creation_nyc) AS intake_creation_nyc
  , min(intake_date) AS intake_date
  , min(yseristatus_payout_date) AS yseristatus_payout_date

/* MAX */
  , max(last_journal_creation_nyc) AS last_journal_creation_nyc
  , max(yserinf_rowid) AS yserinf_rowid
  , max(yseristatus_issue_date) AS yseristatus_issue_date
  , max(document_date) AS document_date
  , max(last_modified_nyc) AS last_modified_nyc

/* Average */
  , CAST(avg(CAST(document_line AS float64)) AS int64) AS document_line
  , CAST(avg(CAST(x3_order_line AS float64)) AS int64) AS x3_order_line
  , CAST(avg(CAST(available AS float64)) AS int64) AS available
  , CAST(avg(CAST(purchase_line AS float64)) AS int64) AS purchase_line
  , CAST(avg(CAST(payout_invoice_line AS float64)) AS int64) AS payout_invoice_line
  , CAST(avg(CAST(intake_line AS float64)) AS int64) AS intake_line
  , CAST(avg(CAST(last_journal_line AS float64)) AS int64) AS last_journal_line
  , avg(serial_cost) AS serial_cost
  , avg(commission_rate) AS commission_rate
  , avg(purchase_price) AS purchase_price
  , avg(price) AS price

/* Count */
  , count(*) AS x3_count
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_serials`
  GROUP BY 1;

