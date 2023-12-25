WITH sale_tbl AS (
SELECT
	*
FROM
	`ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines` sfl
LEFT JOIN (
	SELECT
		serial_number AS serial_number_join
		, serial_inventory
		, serial_relationship 
		, original_intake_date
		, mag_status
		, serial_source AS serial_source_ss
	FROM
			`ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials` ) ss ON
		sfl.serial_number = ss.serial_number_join ) 
, ss_sfl_tbl AS (
SELECT
	ss.*
FROM
	`ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials` ss
LEFT JOIN 	`ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines` sfl
	ON ss.serial_number = sfl.serial_number 
	AND sfl.serial_order_match = TRUE
WHERE
	ss.yseristatus_consignment_status IN ('Sold-POS', 'Sold-Web', 'Returned')
	AND sfl.serial_number IS NULL 
	AND ss.warehouse NOT IN ('MPP') 
), 
order_tbl AS ( --Includes 1P, 3P and DSS
SELECT
	serial_relationship
	, serial_number
	, serial_inventory
	, order_date AS transaction_date
	, 'Sale' AS event_class
	, 'Order' AS event_type
	, 'stadium_order_id' AS event_class_reference_name
	, stadium_order_id AS event_class_reference
	, 'payment_id' AS event_type_reference_name
	, payment_id AS event_type_reference
	, 0 AS qty_finance
	, 0 AS qty_ops
	, 0 AS qty_commercial
FROM
	sale_tbl
WHERE
	order_date IS NOT NULL
	AND serial_number IS NOT NULL)
, cancellation_tbl AS ( --Includes 1P, 3P and DSS
SELECT
	serial_relationship
	, serial_number
	, serial_inventory
	, order_date AS transaction_date
	, 'Sale' AS event_class
	, 'Cancelled' AS event_type
	, 'stadium_order_id' AS event_class_reference_name
	, stadium_order_id AS event_class_reference
	, 'refund_id' AS event_type_reference_name
	, refund_id AS event_type_reference
	, 0 AS qty_finance
	, 0 AS qty_ops
	, 0 AS qty_commercial
FROM
	sale_tbl
WHERE
	reporting_status = 'Cancelled' 
	AND reporting_date IS NOT NULL
	AND serial_number IS NOT NULL)
, shipment_tbl AS ( --Includes 1P, 3P and DSS
SELECT
	serial_relationship
	, serial_number
	, serial_inventory
	, dispatch_date AS transaction_date
	, 'Sale' AS event_class
	, 'Shipment' AS event_type
	, 'stadium_order_id' AS event_class_reference_name
	, stadium_order_id AS event_class_reference
	, 'shipment_id' AS event_type_reference_name
	, shipment_id AS event_type_reference
	, CASE 
		WHEN serial_relationship = '3P' AND serial_inventory <> 'Dropship' 
		THEN -1 ELSE 0 
		END AS qty_finance
	, 0 AS qty_ops
	, CASE WHEN serial_relationship = '3P' THEN -1 ELSE 0 END AS qty_commercial
FROM
	sale_tbl
WHERE
	dispatch_date IS NOT NULL 
	AND serial_number IS NOT NULL)
, shipment_tbl_dss_no_dispatch AS ( --Includes only DSS with no dispatch date
SELECT
	serial_relationship
	, serial_number
	, serial_inventory
	, reporting_date AS transaction_date
	, 'Sale' AS event_class
	, 'Shipment' AS event_type
	, 'stadium_order_id' AS event_class_reference_name
	, stadium_order_id AS event_class_reference
	, 'shipment_id' AS event_type_reference_name
	, shipment_id AS event_type_reference
	, 0 AS qty_finance
	, 0 AS qty_ops
	, CASE WHEN serial_relationship = '3P' THEN -1 ELSE 0 END AS qty_commercial
FROM
	sale_tbl
WHERE
	dispatch_date IS NULL
	AND reporting_date IS NOT NULL
	AND serial_inventory = 'Dropship'
	AND mag_status = 'Purchased Awaiting Sync'
	AND serial_number IS NOT NULL)
, cust_rec_tbl AS ( --Includes 1P, 3P and DSS
SELECT
	serial_relationship
	, serial_number
	, serial_inventory
	, reporting_date AS transaction_date
	, 'Sale' AS event_class
	, 'Customer Received' AS event_type
	, 'stadium_order_id' AS event_class_reference_name
	, stadium_order_id AS event_class_reference
	, 'tracking_number' AS event_type_reference_name
	, tracking_number AS event_type_reference
	, CASE 
		WHEN serial_relationship = '1P' AND serial_inventory <> 'Dropship' 
		THEN -1 ELSE 0 
		END AS qty_finance
	, 0 AS qty_ops
	, CASE WHEN serial_relationship = '1P' THEN -1 ELSE 0 END AS qty_commercial
FROM
	sale_tbl
WHERE
	reporting_date IS NOT NULL
	AND serial_number IS NOT NULL
	AND reporting_status != 'Cancelled'
	AND reporting_status != 'Deferred'),
unreported_sale_tbl AS (
SELECT
	serial_relationship
	, serial_number
	, serial_inventory
	, yseristatus_issue_date AS transaction_date
	, 'Sale' AS event_class
	, 'Unreported Sale' AS event_type
	, 'last_journal_id' AS event_class_reference_name
	, last_journal_id AS event_class_reference
	, 'original_intake_id' AS event_type_reference_name
	, original_intake_id AS event_type_reference
	, -1 AS qty_finance
	, 0 AS qty_ops
	, -1 AS qty_commercial

FROM
	ss_sfl_tbl
WHERE
	original_intake_date IS NOT NULL
	AND serial_number IS NOT NULL
),
misc_issue as (

SELECT
	serial_relationship
	, serial_number
	, serial_inventory
	, last_journal_creation_nyc AS transaction_date
	, 'Sale' AS event_class
	, 'Miscellaneous Issuance' AS event_type
	, 'last_journal_id' AS event_class_reference_name
	, last_journal_id AS event_class_reference
	, 'original_intake_id' AS event_type_reference_name
	, original_intake_id AS event_type_reference
	, -1 AS qty_finance
	, 0 AS qty_ops
	, -1 AS qty_commercial
FROM
	`ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials`
WHERE
	serial_source = 'X3'
	AND yseristatus_consignment_status IS NULL
	AND status_document = 'Issue'
	AND serial_number IS NOT NULL
	AND document_type = 'Miscellaneous issue' 
	AND last_journal_creation_nyc IS NOT NULL 

)





SELECT
	CAST(serial_relationship AS string ) AS serial_relationship
	, CAST(serial_number AS string ) AS serial_number
	, CAST(serial_inventory AS string ) AS serial_inventory
	, CAST(transaction_date AS date) AS transaction_date
	, CAST(event_class AS string ) AS event_class
	, CAST(event_type AS string ) AS event_type
	, CAST(event_class_reference_name AS string ) AS event_class_reference_name 
	, CAST(event_class_reference AS string ) AS event_class_reference
	, CAST(event_type_reference_name AS string ) AS event_type_reference_name
	, CAST(event_type_reference AS string ) AS event_type_reference
	, CAST(qty_finance AS int64 ) AS qty_finance
	, CAST(qty_ops AS int64 ) AS qty_ops
	, CAST(qty_commercial AS int64 ) AS qty_commercial
FROM order_tbl
UNION ALL

SELECT
	CAST(serial_relationship AS string ) AS serial_relationship
	, CAST(serial_number AS string ) AS serial_number
	, CAST(serial_inventory AS string ) AS serial_inventory
	, CAST(transaction_date AS date) AS transaction_date
	, CAST(event_class AS string ) AS event_class
	, CAST(event_type AS string ) AS event_type
	, CAST(event_class_reference_name AS string ) AS event_class_reference_name 
	, CAST(event_class_reference AS string ) AS event_class_reference
	, CAST(event_type_reference_name AS string ) AS event_type_reference_name
	, CAST(event_type_reference AS string ) AS event_type_reference
	, CAST(qty_finance AS int64 ) AS qty_finance
	, CAST(qty_ops AS int64 ) AS qty_ops
	, CAST(qty_commercial AS int64 ) AS qty_commercial
FROM cancellation_tbl
UNION ALL

SELECT
	CAST(serial_relationship AS string ) AS serial_relationship
	, CAST(serial_number AS string ) AS serial_number
	, CAST(serial_inventory AS string ) AS serial_inventory
	, CAST(transaction_date AS date) AS transaction_date
	, CAST(event_class AS string ) AS event_class
	, CAST(event_type AS string ) AS event_type
	, CAST(event_class_reference_name AS string ) AS event_class_reference_name 
	, CAST(event_class_reference AS string ) AS event_class_reference
	, CAST(event_type_reference_name AS string ) AS event_type_reference_name
	, CAST(event_type_reference AS string ) AS event_type_reference
	, CAST(qty_finance AS int64 ) AS qty_finance
	, CAST(qty_ops AS int64 ) AS qty_ops
	, CAST(qty_commercial AS int64 ) AS qty_commercial
FROM shipment_tbl
UNION ALL

SELECT
	CAST(serial_relationship AS string ) AS serial_relationship
	, CAST(serial_number AS string ) AS serial_number
	, CAST(serial_inventory AS string ) AS serial_inventory
	, CAST(transaction_date AS date) AS transaction_date
	, CAST(event_class AS string ) AS event_class
	, CAST(event_type AS string ) AS event_type
	, CAST(event_class_reference_name AS string ) AS event_class_reference_name 
	, CAST(event_class_reference AS string ) AS event_class_reference
	, CAST(event_type_reference_name AS string ) AS event_type_reference_name
	, CAST(event_type_reference AS string ) AS event_type_reference
	, CAST(qty_finance AS int64 ) AS qty_finance
	, CAST(qty_ops AS int64 ) AS qty_ops
	, CAST(qty_commercial AS int64 ) AS qty_commercial
FROM cust_rec_tbl
UNION ALL

SELECT
	CAST(serial_relationship AS string ) AS serial_relationship
	, CAST(serial_number AS string ) AS serial_number
	, CAST(serial_inventory AS string ) AS serial_inventory
	, CAST(transaction_date AS date) AS transaction_date
	, CAST(event_class AS string ) AS event_class
	, CAST(event_type AS string ) AS event_type
	, CAST(event_class_reference_name AS string ) AS event_class_reference_name 
	, CAST(event_class_reference AS string ) AS event_class_reference
	, CAST(event_type_reference_name AS string ) AS event_type_reference_name
	, CAST(event_type_reference AS string ) AS event_type_reference
	, CAST(qty_finance AS int64 ) AS qty_finance
	, CAST(qty_ops AS int64 ) AS qty_ops
	, CAST(qty_commercial AS int64 ) AS qty_commercial
FROM unreported_sale_tbl
UNION ALL

SELECT
	CAST(serial_relationship AS string ) AS serial_relationship
	, CAST(serial_number AS string ) AS serial_number
	, CAST(serial_inventory AS string ) AS serial_inventory
	, CAST(transaction_date AS date) AS transaction_date
	, CAST(event_class AS string ) AS event_class
	, CAST(event_type AS string ) AS event_type
	, CAST(event_class_reference_name AS string ) AS event_class_reference_name 
	, CAST(event_class_reference AS string ) AS event_class_reference
	, CAST(event_type_reference_name AS string ) AS event_type_reference_name
	, CAST(event_type_reference AS string ) AS event_type_reference
	, CAST(qty_finance AS int64 ) AS qty_finance
	, CAST(qty_ops AS int64 ) AS qty_ops
	, CAST(qty_commercial AS int64 ) AS qty_commercial
FROM misc_issue
UNION ALL

SELECT
	CAST(serial_relationship AS string ) AS serial_relationship
	, CAST(serial_number AS string ) AS serial_number
	, CAST(serial_inventory AS string ) AS serial_inventory
	, CAST(transaction_date AS date) AS transaction_date
	, CAST(event_class AS string ) AS event_class
	, CAST(event_type AS string ) AS event_type
	, CAST(event_class_reference_name AS string ) AS event_class_reference_name 
	, CAST(event_class_reference AS string ) AS event_class_reference
	, CAST(event_type_reference_name AS string ) AS event_type_reference_name
	, CAST(event_type_reference AS string ) AS event_type_reference
	, CAST(qty_finance AS int64 ) AS qty_finance
	, CAST(qty_ops AS int64 ) AS qty_ops
	, CAST(qty_commercial AS int64 ) AS qty_commercial
FROM shipment_tbl_dss_no_dispatch

