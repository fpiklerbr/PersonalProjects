


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
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_inventory_events_intakes`
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
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_inventory_events_misc`
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
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_inventory_events_mpp`
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
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_inventory_events_returns`
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
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_inventory_events_sales`
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
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_inventory_events_withdrawals`

