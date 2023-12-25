

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_inventory_events_returns`
  OPTIONS()
  as WITH sfl_ss_tbl AS ( 
SELECT
  *
FROM
  `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines` sfl
LEFT JOIN (
  SELECT
    serial_number AS serial_number_join
    , serial_relationship
	, serial_inventory
    , original_intake_date
    , serial_source AS serial_source_ss
    , yseristatus_consignment_status
  FROM
      `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials` ) ss ON
    sfl.serial_number = ss.serial_number_join
    ) 
,     
standard_return AS (
  
SELECT
	serial_relationship
	, serial_number
	, serial_inventory
	, return_date AS transaction_date
	, 'Return' AS event_class
	, 'Standard Return' AS event_type
	, 'stadium_order_id' AS event_class_reference_name
	, stadium_order_id AS event_class_reference
	, 'TBD' AS event_type_reference_name
	, NULL AS event_type_reference
	, 1 AS qty_finance
	, 0 AS qty_ops
	, 1 AS qty_commercial

FROM
  sfl_ss_tbl
WHERE
  serial_source_ss IN ('X3', 'Ether')
  AND return_date IS NOT NULL
  AND serial_number IS NOT NULL),

assumed_reserialized_returns AS (

SELECT
  	serial_relationship
	, serial_number
	, serial_inventory
	, return_date AS transaction_date
	, 'Return' AS event_class
	, 'Assumed Reserialized' AS event_type
	, 'stadium_order_id' AS event_class_reference_name
	, stadium_order_id AS event_class_reference
	, 'TBD' AS event_type_reference_name
	, NULL AS event_type_reference
	, -1 AS qty_finance
	, 0 AS qty_ops
	, -1 AS qty_commercial
FROM
	sfl_ss_tbl 
WHERE
	original_intake_date IS NOT NULL
	AND	return_date IS NOT NULL
	AND serial_number IS NOT NULL
	AND serial_order_match = TRUE
	AND (
      


  regexp_contains(yseristatus_consignment_status, r'(?i).*sold.*')


      OR yseristatus_consignment_status = 'Returned'
    )
), 
assumed_returned AS (

SELECT
  	serial_relationship
	, serial_number
	, serial_inventory
	, COALESCE(refund_date, reporting_date) AS transaction_date --using refund / reporting date out of a lack of a better valid date to use. 
	, 'Return' AS event_class
	, 'Assumed Returned' AS event_type
	, 'stadium_order_id' AS event_class_reference_name
	, stadium_order_id AS event_class_reference
	, 'TBD' AS event_type_reference_name
	, NULL AS event_type_reference
	, 1 AS qty_finance
	, 0 AS qty_ops
	, 1 AS qty_commercial
FROM
	sfl_ss_tbl 
WHERE
	serial_source_ss IN ('X3', 'Ether')
	AND reporting_status = 'Returned'
	AND	return_date IS NULL
	AND serial_number IS NOT NULL
),
dss_assumed_returned AS (

SELECT
  	serial_relationship
	, serial_number
	, serial_inventory
	, COALESCE(refund_date, reporting_date) AS transaction_date --using refund / reporting date out of a lack of a better valid date to use. 
	, 'Return' AS event_class
	, 'DSS - Assumed Returned' AS event_type
	, 'stadium_order_id' AS event_class_reference_name
	, stadium_order_id AS event_class_reference
	, 'TBD' AS event_type_reference_name
	, NULL AS event_type_reference
	, 0 AS qty_finance
	, 0 AS qty_ops
	, 0 AS qty_commercial
FROM
	sfl_ss_tbl 
WHERE
	serial_source_ss NOT IN ('X3', 'Ether')
	AND reporting_status = 'Returned'
	AND	return_date IS NULL
	AND serial_number IS NOT NULL
),
dss_returns as (

SELECT
	serial_relationship
	, serial_number
	, serial_inventory
	, return_date AS transaction_date
	, 'Return' AS event_class
	, 'DSS - Return' AS event_type
	, 'stadium_order_id' AS event_class_reference_name
	, stadium_order_id AS event_class_reference
	, 'mag_order_id' AS event_type_reference_name
	, mag_order_id AS event_type_reference
	, 0 AS qty_finance
	, 0 AS qty_ops
	, 0 AS qty_commercial

FROM
  sfl_ss_tbl
WHERE
	serial_source_ss NOT IN ('X3', 'Ether')
	AND reporting_status = 'Returned'
	AND	return_date IS NOT NULL
	AND serial_number IS NOT NULL

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
FROM standard_return
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
FROM assumed_reserialized_returns
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
FROM assumed_returned
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
FROM dss_assumed_returned
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
FROM dss_returns

;

