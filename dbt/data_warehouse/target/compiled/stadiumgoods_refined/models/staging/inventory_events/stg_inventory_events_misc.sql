WITH manual_deletions AS (
	SELECT
	serial_relationship
	, serial_number
	, serial_inventory
	, last_journal_creation_nyc AS transaction_date
	, 'Misc' AS event_class
	, 'Manually Deleted' AS event_type
	, 'last_journal_id' AS event_class_reference_name
	, last_journal_id AS event_class_reference
	, 'last_journal_id' AS event_type_reference_name
	, last_journal_id AS event_type_reference
	, -1 AS qty_finance
	, 0 AS qty_ops
	, -1 AS qty_commercial

	FROM
		`ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials`
	WHERE
		serial_source = 'X3'
		AND yseristatus_consignment_status IS NULL
		AND document_type IS NULL  
		AND status_document IS NULL 
		AND serial_number IS NOT NULL
		AND last_journal_creation_nyc IS NOT NULL)
, dss_misc_unavailable AS (
SELECT
	serial_relationship
	, serial_number
	, serial_inventory
	, COALESCE(mag_update_nyc, mag_creation_nyc) AS transaction_date
	, 'Misc' AS event_class
	, 'DSS - Misc Unavailable' AS event_type
	, 'mag_serial_id ' AS event_class_reference_name
	, mag_serial_id  AS event_class_reference
	, NULL AS event_type_reference_name
	, NULL AS event_type_reference
	, 0 AS qty_finance
	, 0 AS qty_ops
	, -1 AS qty_commercial
FROM
	`ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials`
WHERE
	serial_inventory = 'Dropship'
	AND mag_status IN ('On Hold', '0', 'Offline')
	AND serial_number IS NOT NULL
), dss_misc_null_mag_status AS (
SELECT
	serial_relationship
	, serial_number
	, serial_inventory
	, COALESCE(mag_update_nyc, mag_creation_nyc) AS transaction_date
	, 'Misc' AS event_class
	, 'DSS - Broken Mag Status' AS event_type
	, 'mag_serial_id ' AS event_class_reference_name
	, mag_serial_id  AS event_class_reference
	, NULL AS event_type_reference_name
	, NULL AS event_type_reference
	, 0 AS qty_finance
	, 0 AS qty_ops
	, -1 AS qty_commercial
FROM
	`ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials`
WHERE
	serial_inventory = 'Dropship'
	AND mag_status IS NULL
	AND serial_number IS NOT NULL
),
dss_reserved as (
SELECT
	serial_relationship
	, serial_number
	, serial_inventory
	, COALESCE(mag_update_nyc, mag_creation_nyc) AS transaction_date
	, 'Misc' AS event_class
	, 'DSS - Reserved' AS event_type
	, 'mag_serial_id ' AS event_class_reference_name
	, mag_serial_id  AS event_class_reference
	, NULL AS event_type_reference_name
	, NULL AS event_type_reference
	, 0 AS qty_finance
	, 0 AS qty_ops
	, -1 AS qty_commercial
FROM
	`ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials`
WHERE
	serial_inventory = 'Dropship'
	AND mag_status = 'Reserved'
	AND serial_number IS NOT NULL
),
dss_purchased_awaiting_sync_no_finance_line as (
SELECT
	ss.serial_relationship
	, ss.serial_number
	, ss.serial_inventory
	, COALESCE(ss.mag_update_nyc, ss.mag_creation_nyc) AS transaction_date
	, 'Misc' AS event_class
	, 'DSS - Purchased Awaiting Sync Missing Finance Line' AS event_type
	, 'mag_serial_id ' AS event_class_reference_name
	, ss.mag_serial_id  AS event_class_reference
	, NULL AS event_type_reference_name
	, NULL AS event_type_reference
	, 0 AS qty_finance
	, 0 AS qty_ops
	, -1 AS qty_commercial
FROM
	`ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials` ss
LEFT JOIN 
	`ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines` sfl
ON 
	ss.serial_number = sfl.serial_number
WHERE
	ss.serial_inventory = 'Dropship'
	AND ss.mag_status = 'Purchased Awaiting Sync'
	AND ss.serial_number IS NOT NULL
	and sfl.serial_number IS NULL
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
FROM manual_deletions
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
FROM dss_misc_unavailable
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
FROM dss_purchased_awaiting_sync_no_finance_line
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
FROM dss_reserved
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
FROM dss_misc_null_mag_status

