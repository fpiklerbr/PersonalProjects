WITH standard_intake as (
SELECT
	ss.serial_relationship
	, ss.serial_number
	, ss.serial_inventory
	, ss.original_intake_date AS transaction_date
	, 'Intake' AS event_class
	, 'Standard Intake' AS event_type
	, 'original_intake_id' AS event_class_reference_name
	, ss.original_intake_id AS event_class_reference
	, CASE WHEN serial_relationship = '1P' THEN 'purchase_id' ELSE 'original_intake_seller_portal_ticket' END AS event_type_reference_name
	, CASE WHEN serial_relationship = '1P' THEN ss.purchase_id ELSE ss.original_intake_seller_portal_ticket END AS event_type_reference
	, 1 AS qty_finance
	, 0 AS qty_ops
	, 1 AS qty_commercial
FROM
	`ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials` ss
WHERE
	original_intake_date IS NOT NULL
	AND serial_number IS NOT NULL
	AND serial_inventory != 'Returns Purchase'
),
return_purchases AS (

SELECT
	ss.serial_relationship
	, ss.serial_number
	, ss.serial_inventory
	, ss.original_intake_date AS transaction_date
	, 'Intake' AS event_class
	, 'CCP (3P to 1P Return)' AS event_type
	, 'original_intake_id' AS event_class_reference_name
	, ss.original_intake_id AS event_class_reference
	, CASE WHEN serial_relationship = '1P' THEN 'purchase_id' ELSE 'original_intake_seller_portal_ticket' END AS event_type_reference_name
	, CASE WHEN serial_relationship = '1P' THEN ss.purchase_id ELSE ss.original_intake_seller_portal_ticket END AS event_type_reference
	, 1 AS qty_finance
	, 0 AS qty_ops
	, 1 AS qty_commercial
FROM
		`ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials` ss
WHERE
	original_intake_date IS NOT NULL
	AND serial_number IS NOT NULL
	AND serial_inventory = 'Returns Purchase'
),
missing_intakes AS (
-- missing intakes.

SELECT
	ss.serial_relationship
	, ss.serial_number
	, ss.serial_inventory
	, sj.transaction_date
	, 'Intake' AS event_class
	, 'Intake - Missing Date' AS event_type
	, 'original_intake_id' AS event_class_reference_name
	, ss.original_intake_id AS event_class_reference
	, 'x3_order_id' AS event_type_reference_name
	, ss.x3_order_id AS event_type_reference
	, 1 AS qty_finance
	, 0 AS qty_ops
	, 1 AS qty_commercial
FROM
	`ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials` ss
INNER JOIN 
	(SELECT serial_number
		, MIN(journal_date) AS transaction_date 
	FROM 
		`ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_x3_stojou` 
	GROUP BY serial_number) sj
ON ss.serial_number = sj.serial_number 
WHERE
	ss.original_intake_date IS NULL
 	AND ss.serial_source IN ('X3', 'Ether')
	AND ss.serial_number IS NOT NULL
)
, dss_listed AS (
	SELECT
		ss.serial_relationship
		, ss.serial_number
		, ss.serial_inventory
		, COALESCE(ss.mag_creation_nyc, ss.mag_update_nyc) AS transaction_date
		, 'Intake' AS event_class
		, 'DSS - Listed' AS event_type
		, 'mag_serial_id' AS event_class_reference_name
		, ss.mag_serial_id AS event_class_reference
		, 'mag_serial_id' AS event_type_reference_name
		, ss.mag_serial_id AS event_type_reference
		, 0 AS qty_finance
		, 0 AS qty_ops
		, 1 AS qty_commercial
	FROM
		`ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials` ss
	WHERE
		original_intake_date IS NULL
		AND serial_number IS NOT NULL
		AND serial_source <> 'X3' 
		AND serial_inventory = 'Dropship'
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
FROM standard_intake
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
FROM return_purchases
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
FROM missing_intakes
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
FROM dss_listed

