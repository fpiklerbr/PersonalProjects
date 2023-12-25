WITH ss_sfl AS (
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
				`ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_serials`) ss 
	ON
		sfl.serial_number = ss.serial_number_join
	)
	SELECT
		serial_relationship
		, serial_number
		, serial_inventory
		, COALESCE(refund_date) AS transaction_date
		, 'Refund' AS event_class
		, 'Refunded Payment' AS event_type
		, 'stadium_order_id' AS event_class_reference_name
		, stadium_order_id AS event_class_reference
		, 'refund_id' AS event_type_reference_name
		, refund_id AS event_type_reference
		, 0 AS qty_finance
		, 0 AS qty_ops
		, 0 AS qty_commercial
		, line_payment_credited + line_payment_refunded AS total_refunded
	FROM
		ss_sfl 
	WHERE
		reporting_status = 'Returned'
		AND refund_date IS NOT NULL 
		AND serial_number IS NOT NULL