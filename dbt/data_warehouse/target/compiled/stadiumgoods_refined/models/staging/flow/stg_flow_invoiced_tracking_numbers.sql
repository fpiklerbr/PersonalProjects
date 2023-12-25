

SELECT
    transaction_id AS tracking_number
  , file_name
  , 
  CAST(regexp_extract(file_name, 
  r'stgo-[0-9]+'
) AS string)
 AS invoice_id
  , SAFE_CAST(SAFE_CAST(DATETIME(SAFE_CAST(file_time AS timestamp), 'America/New_York') AS datetime) AS date) AS invoice_date
  , (freight_withholding + insurance_withholding + duty_withholding) AS total_cost
  , (freight_withholding + insurance_withholding) AS ship_cost
  , duty_withholding AS duties_cost
  , cast('Flow' AS string ) AS invoice_type
  , cast('Order Fulfillment' AS string ) AS operations_category
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`flow__transactions`
WHERE transaction_id IS NOT NULL