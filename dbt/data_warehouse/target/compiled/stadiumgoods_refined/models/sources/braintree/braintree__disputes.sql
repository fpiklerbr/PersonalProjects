

  





































 

SELECT   `_setattrs`,  `id`,  `global_id`,  `amount`,  `amount_disputed`,  `amount_won`,  `case_number`,  `created_at`,  `currency_iso_code`,  `date_opened`,  `date_won`,  `processor_comments`,  `kind`,  `merchant_account_id`,  `reason`,  `reason_code`,  `reason_description`,  `received_date`,  `reference_number`,  `reply_by_date`,  `processor_reply_by_date`,  `response_deadline`,  `status`,  `updated_at`,  `settlement_date`,  `original_dispute_id`,  `evidence`,  `status_history`,  `transaction`,  `transaction_details`,  `updated_date`,  `file_time`,  `file_name`,  `case_id`,  `mag_order_id`,  `order_created_at`,  `order_date`
    , `_raw_transaction_details_json`
    , `_raw_paypal_messages`
    , `_raw_chargeback_protection_level`
    , `_raw_pre_dispute_program`
    , `_raw_evidence_submittable`
  FROM ( SELECT
    *

  , 
    safe_cast(order_created_at as date)
 AS `order_date` 

 

FROM ( 

SELECT
    *

  , (JSON_EXTRACT_SCALAR(_raw_transaction_json, '$.id'
  ))
 AS `case_id`
  , (JSON_EXTRACT_SCALAR(_raw_transaction_json, '$.order_id'
  ))
 AS `mag_order_id`
  , 
    safe_cast(JSON_EXTRACT_SCALAR(_raw_transaction_json, '$.created_at'
  ) as timestamp)
 AS `order_created_at` 
FROM ( 

SELECT
    *

  , 
    safe_cast(updated_at as date)
 AS `settlement_date` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_setattrs` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_setattrs` AS string)), '') AS string) END as string)
 AS `_setattrs`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as string)
 AS `id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`global_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`global_id` AS string)), '') AS string) END as string)
 AS `global_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amount` AS string)), '') AS string) END as float64)
 AS `amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amount_disputed` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amount_disputed` AS string)), '') AS string) END as string)
 AS `amount_disputed`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amount_won` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amount_won` AS string)), '') AS string) END as float64)
 AS `amount_won`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`case_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`case_number` AS string)), '') AS string) END as string)
 AS `case_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as string)
 AS `created_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`currency_iso_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`currency_iso_code` AS string)), '') AS string) END as string)
 AS `currency_iso_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`date_opened` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`date_opened` AS string)), '') AS string) END as string)
 AS `date_opened`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`date_won` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`date_won` AS string)), '') AS string) END as string)
 AS `date_won`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`processor_comments` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`processor_comments` AS string)), '') AS string) END as string)
 AS `processor_comments`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`kind` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`kind` AS string)), '') AS string) END as string)
 AS `kind`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`merchant_account_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`merchant_account_id` AS string)), '') AS string) END as string)
 AS `merchant_account_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reason` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reason` AS string)), '') AS string) END as string)
 AS `reason`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reason_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reason_code` AS string)), '') AS string) END as string)
 AS `reason_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reason_description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reason_description` AS string)), '') AS string) END as string)
 AS `reason_description`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`received_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`received_date` AS string)), '') AS string) END as string)
 AS `received_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reference_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reference_number` AS string)), '') AS string) END as string)
 AS `reference_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reply_by_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reply_by_date` AS string)), '') AS string) END as string)
 AS `reply_by_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`processor_reply_by_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`processor_reply_by_date` AS string)), '') AS string) END as string)
 AS `processor_reply_by_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`response_deadline` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`response_deadline` AS string)), '') AS string) END as string)
 AS `response_deadline`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as string)
 AS `status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS `updated_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`original_dispute_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`original_dispute_id` AS string)), '') AS string) END as string)
 AS `original_dispute_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`evidence` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`evidence` AS string)), '') AS string) END as string)
 AS `evidence`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status_history` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status_history` AS string)), '') AS string) END as string)
 AS `status_history`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transaction` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction` AS string)), '') AS string) END as string)
 AS `transaction`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transaction_details` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_details` AS string)), '') AS string) END as string)
 AS `transaction_details`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_date` AS string)), '') AS string) END as timestamp)
 as date)
 AS `updated_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transaction_json` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_json` AS string)), '') AS string) END as string)
 AS `_raw_transaction_json`


  , `transaction_details_json` AS `_raw_transaction_details_json`

  , `paypal_messages` AS `_raw_paypal_messages`

  , `chargeback_protection_level` AS `_raw_chargeback_protection_level`

  , `pre_dispute_program` AS `_raw_pre_dispute_program`

  , `evidence_submittable` AS `_raw_evidence_submittable`


FROM `ff-stadiumgoods-raw-live`.`imports`.`braintree_api_disputes` AS source_table

 ) AS source_select_statement

 ) AS source_and_sql_select_statement

 ) AS macro_statement

 ) AS un_ordered

