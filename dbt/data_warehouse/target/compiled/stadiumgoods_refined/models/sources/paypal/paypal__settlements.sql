


  























 

SELECT   `ch`,  `transaction_id`,  `invoice_id`,  `pay_pal_reference_id`,  `pay_pal_reference_id_type`,  `transaction_event_code`,  `_raw_transaction_initiation_date`,  `transaction_initiation_date`,  `transaction_completion_date`,  `transaction_processed_at`,  `transaction_description`,  `gross_transaction_amount`,  `transaction_amount`,  `gross_transaction_currency`,  `fee_debit_or_credit`,  `fee_amount`,  `fee_currency`,  `custom_field`,  `consumer_id`,  `payment_tracking_id`,  `store_id`,  `bank_reference_id`,  `credit_transactional_fee`,  `credit_promotional_fee`,  `credit_term`,  `file_name`,  `settlement_id`,  `file_time`,  `settlement_date`,  `transaction_fee`,  `payment_fee`,  `refund_fee`,  `payment_amount`,  `refund_amount`,  `payment_processed_at`,  `refund_processed_at`,  `mag_order_id`
  FROM ( SELECT
    *

  , 
    safe_cast(CASE WHEN transaction_description = 'CR' THEN transaction_fee END as float64)
 AS `payment_fee`
  , 
    safe_cast(CASE WHEN transaction_description = 'DR' THEN transaction_fee END as float64)
 AS `refund_fee`
  , 
    safe_cast(CASE WHEN transaction_description = 'CR' THEN transaction_amount END as float64)
 AS `payment_amount`
  , 
    safe_cast(CASE WHEN transaction_description = 'DR' THEN transaction_amount END as float64)
 AS `refund_amount`
  , 
    safe_cast(CASE WHEN transaction_description = 'CR' THEN transaction_processed_at END as timestamp)
 AS `payment_processed_at`
  , 
    safe_cast(CASE WHEN transaction_description = 'DR' THEN transaction_processed_at END as timestamp)
 AS `refund_processed_at` 

 

FROM ( 

SELECT
    *

  , safe_cast(datetime(safe_cast(file_time AS timestamp), 'America/New_York') AS date) AS `settlement_date`
  , CAST(regexp_extract(invoice_id, 
  r'^[0-9]{9}$'
) AS string) AS `mag_order_id` 
FROM ( 

SELECT
    *

  , 
    safe_cast(replace(replace(_raw_transaction_initiation_date,'/','-'), ' -', '-') as timestamp)
 AS `transaction_initiation_date`
  , 
    safe_cast(replace(replace(transaction_completion_date,'/','-'), ' -', '-') as timestamp)
 AS `transaction_processed_at`
  , 
    safe_cast((gross_transaction_amount / 100) as float64)
 AS `transaction_amount`
  , 
    safe_cast(file_name as string)
 AS `settlement_id`
  , 
    safe_cast(CASE WHEN fee_debit_or_credit = 'DR' THEN -1 ELSE 1 END * (fee_amount / 100) as float64)
 AS `transaction_fee` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ch` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ch` AS string)), '') AS string) END as string)
 AS `ch`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transaction_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_id` AS string)), '') AS string) END as string)
 AS `transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_id` AS string)), '') AS string) END as string)
 AS `invoice_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pay_pal_reference_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pay_pal_reference_id` AS string)), '') AS string) END as string)
 AS `pay_pal_reference_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pay_pal_reference_id_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pay_pal_reference_id_type` AS string)), '') AS string) END as string)
 AS `pay_pal_reference_id_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transaction_event_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_event_code` AS string)), '') AS string) END as string)
 AS `transaction_event_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transaction_initiation_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_initiation_date` AS string)), '') AS string) END as string)
 AS `_raw_transaction_initiation_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transaction_completion_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_completion_date` AS string)), '') AS string) END as string)
 AS `transaction_completion_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transaction_debit_or_credit` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_debit_or_credit` AS string)), '') AS string) END as string)
 AS `transaction_description`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gross_transaction_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gross_transaction_amount` AS string)), '') AS string) END as float64)
 AS `gross_transaction_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gross_transaction_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gross_transaction_currency` AS string)), '') AS string) END as string)
 AS `gross_transaction_currency`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fee_debit_or_credit` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fee_debit_or_credit` AS string)), '') AS string) END as string)
 AS `fee_debit_or_credit`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fee_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fee_amount` AS string)), '') AS string) END as float64)
 AS `fee_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fee_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fee_currency` AS string)), '') AS string) END as string)
 AS `fee_currency`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`custom_field` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`custom_field` AS string)), '') AS string) END as string)
 AS `custom_field`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`consumer_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consumer_id` AS string)), '') AS string) END as string)
 AS `consumer_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payment_tracking_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_tracking_id` AS string)), '') AS string) END as string)
 AS `payment_tracking_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_id` AS string)), '') AS string) END as string)
 AS `store_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bank_reference_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bank_reference_id` AS string)), '') AS string) END as string)
 AS `bank_reference_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credit_transactional_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credit_transactional_fee` AS string)), '') AS string) END as float64)
 AS `credit_transactional_fee`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credit_promotional_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credit_promotional_fee` AS string)), '') AS string) END as float64)
 AS `credit_promotional_fee`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credit_term` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credit_term` AS string)), '') AS string) END as string)
 AS `credit_term`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_timestamp` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_timestamp` AS string)), '') AS string) END as timestamp)
 AS `file_time`



FROM `ff-stadiumgoods-raw-live`.`imports`.`paypal_settlements` AS source_table

 ) AS source_select_statement

 ) AS source_and_sql_select_statement

 ) AS macro_statement

 ) AS un_ordered

