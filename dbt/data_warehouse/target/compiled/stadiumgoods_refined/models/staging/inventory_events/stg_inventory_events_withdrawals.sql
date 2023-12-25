WITH withdrawals as (
SELECT
	ss.serial_relationship
	, ss.serial_number
	, ss.serial_inventory
	, ss.document_date AS transaction_date
	, 'Withdrawal' AS event_class
	, 'Withdrawal' AS event_type
	, 'document_id' AS event_class_reference_name
	, ss.document_id AS event_class_reference
	, 'document_id' AS event_type_reference_name
	, ss.document_id AS event_type_reference
	, -1 AS qty_finance
	, 0 AS qty_ops
	, -1 AS qty_commercial
FROM
	`ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials` ss
WHERE
	serial_source IN ('X3', 'Ether')
	AND	status_document = 'Withdrawal'
	AND serial_number IS NOT NULL

), undocumented_withdrawals AS (

SELECT
	ss.serial_relationship
	, ss.serial_number
	, ss.serial_inventory
	, cast(ss.last_journal_creation_nyc AS date) AS transaction_date
	, 'Withdrawal' AS event_class
	, 'Undocumented Withdrawal' AS event_type
	, 'last_journal_type' AS event_class_reference_name
	, ss.last_journal_type AS event_class_reference
	, 'last_journal_id' AS event_type_reference_name
	, ss.last_journal_id AS event_type_reference
	, -1 AS qty_finance
	, 0 AS qty_ops
	, -1 AS qty_commercial
FROM
	`ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials` AS ss
WHERE
	serial_source IN ('X3', 'Ether')
	AND serial_number IS NOT NULL
	AND	yseristatus_consignment_status = 'Withdrawn'
	AND	NOT EXISTS (SELECT * FROM withdrawals WHERE serial_number = ss.serial_number )
    AND last_journal_creation_nyc IS NOT NULL

), dss_withdrawals AS (

SELECT
	ss.serial_relationship
	, ss.serial_number
	, ss.serial_inventory
	, COALESCE(ss.last_available_date, ss.mag_update_nyc) AS transaction_date
	, 'Withdrawal' AS event_class
	, 'DSS - Delisted' AS event_type
	, 'mag_serial_id' AS event_class_reference_name
	, ss.mag_serial_id  AS event_class_reference
	, 'mag_serial_id ' AS event_type_reference_name
	, ss.mag_serial_id  AS event_type_reference
	, 0 AS qty_finance
	, 0 AS qty_ops
	, -1 AS qty_commercial
FROM
	`ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials` ss
LEFT JOIN 
	`ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines` sfl
ON 
	ss.serial_number = sfl.serial_number
	AND sfl.serial_order_match = True 
WHERE
	ss.serial_source NOT IN ('X3', 'Ether')
	AND ss.stadium_order_id IS NULL
	AND (sfl.reporting_status != 'Dispatched' OR sfl.reporting_status IS NULL)
	AND ss.serial_inventory = 'Dropship'
	AND	ss.mag_status IN ('Dss Withdrawn', 'Purchased')
	AND ss.serial_number IS NOT NULL

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
FROM withdrawals
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
FROM undocumented_withdrawals
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
FROM dss_withdrawals

