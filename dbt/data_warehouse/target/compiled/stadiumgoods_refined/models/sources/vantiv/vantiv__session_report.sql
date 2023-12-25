







































 

SELECT   `session_id`,  `batch_id`,  `batch_post_day`,  `transaction_processed_at`,  `batch_completion_timestamp_gmt`,  `reporting_group`,  `presenter`,  `merchant`,  `merchant_id`,  `transaction_id`,  `parent_transaction_id`,  `mag_order_id`,  `customer_id`,  `transaction_description`,  `purchase_currency`,  `transaction_amount`,  `payment_type`,  `bin`,  `account_suffix`,  `response_reason_code`,  `response_reason_message`,  `avs`,  `fraud_check_sum_response`,  `payer_id`,  `merchant_transaction_id`,  `affiliate`,  `campaign`,  `merchant_grouping_id`,  `sales_tax`,  `ftp_filename`,  `session_type`,  `action_performed_by`,  `customer_reference`,  `secondary_amt`,  `pi_nless_debit_network`,  `file_name`,  `file_time`,  `merchant_category_code`,  `checkout_status`,  `payment_amount`,  `refund_amount`,  `payment_processed_at`,  `refund_processed_at`
  FROM ( 

SELECT
    *

  , 
    safe_cast(CASE WHEN response_reason_message = 'Approved' THEN 'Approved' ELSE 'Not Approved' END as string)
 AS `checkout_status`
  , 
    safe_cast(CASE WHEN transaction_description IN ('Deposit','Cond. Deposit','Authorization') THEN transaction_amount END as float64)
 AS `payment_amount`
  , 
    safe_cast(CASE WHEN transaction_description IN ('Auth Reversal','Refund','Void') THEN transaction_amount END as float64)
 AS `refund_amount`
  , 
    safe_cast(CASE WHEN transaction_description IN ('Deposit','Cond. Deposit','Authorization') THEN transaction_processed_at END as timestamp)
 AS `payment_processed_at`
  , 
    safe_cast(CASE WHEN transaction_description IN ('Auth Reversal','Refund','Void') THEN transaction_processed_at END as timestamp)
 AS `refund_processed_at` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`session_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`session_id` AS string)), '') AS string) END as string)
 AS `session_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`batch_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`batch_id` AS string)), '') AS string) END as string)
 AS `batch_id`

  , 
    safe_cast(
    safe_cast(CASE
          WHEN


  regexp_contains(CASE WHEN cast(nullif(trim(cast(`batch_post_day` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`batch_post_day` AS string)), '') AS string) END, r'(?i)^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$')


          THEN  parse_timestamp('%m/%d/%Y', CASE WHEN cast(nullif(trim(cast(`batch_post_day` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`batch_post_day` AS string)), '') AS string) END)
        END as timestamp)


 as date)
 AS `batch_post_day`

  , 
    safe_cast(CASE
          WHEN


  regexp_contains(CASE WHEN replace(cast(nullif(trim(cast(`transaction_processing_timestamp_gmt` AS string)), '') AS string), 
  'GMT'
, 
  ''
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`transaction_processing_timestamp_gmt` AS string)), '') AS string), 
  'GMT'
, 
  ''
) END, r'(?i)^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4} [0-9]{1,2}:[0-9]{2}:[0-9]{2}$')


          THEN  parse_timestamp('%m/%d/%Y %H:%M:%S', CASE WHEN replace(cast(nullif(trim(cast(`transaction_processing_timestamp_gmt` AS string)), '') AS string), 
  'GMT'
, 
  ''
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`transaction_processing_timestamp_gmt` AS string)), '') AS string), 
  'GMT'
, 
  ''
) END)
        END as timestamp)


 AS `transaction_processed_at`

  , 
    safe_cast(CASE
          WHEN


  regexp_contains(CASE WHEN replace(cast(nullif(trim(cast(`batch_completion_timestamp_gmt` AS string)), '') AS string), 
  'GMT'
, 
  ''
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`batch_completion_timestamp_gmt` AS string)), '') AS string), 
  'GMT'
, 
  ''
) END, r'(?i)^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4} [0-9]{1,2}:[0-9]{2}:[0-9]{2}$')


          THEN  parse_timestamp('%m/%d/%Y %H:%M:%S', CASE WHEN replace(cast(nullif(trim(cast(`batch_completion_timestamp_gmt` AS string)), '') AS string), 
  'GMT'
, 
  ''
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`batch_completion_timestamp_gmt` AS string)), '') AS string), 
  'GMT'
, 
  ''
) END)
        END as timestamp)


 AS `batch_completion_timestamp_gmt`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reporting_group` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reporting_group` AS string)), '') AS string) END as string)
 AS `reporting_group`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`presenter` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`presenter` AS string)), '') AS string) END as string)
 AS `presenter`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`merchant` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`merchant` AS string)), '') AS string) END as string)
 AS `merchant`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`merchant_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`merchant_id` AS string)), '') AS string) END as string)
 AS `merchant_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vantiv_payment_id` AS string), substr(
    concat(
    
      coalesce(
  '\''
|| '' , '')
    
      , coalesce(concat(chr(9), chr(10), chr(11), chr(12), chr(13), chr(32), chr(133), chr(160), chr(5760), chr(8192), chr(8193), chr(8194), chr(8195), chr(8196), chr(8197), chr(8198), chr(8199), chr(8200), chr(8201), chr(8202), chr(8232), chr(8233), chr(8239), chr(8287), chr(12288))|| '' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(
  '\''
|| '' , '')
    
      , coalesce(concat(chr(9), chr(10), chr(11), chr(12), chr(13), chr(32), chr(133), chr(160), chr(5760), chr(8192), chr(8193), chr(8194), chr(8195), chr(8196), chr(8197), chr(8198), chr(8199), chr(8200), chr(8201), chr(8202), chr(8232), chr(8233), chr(8239), chr(8287), chr(12288))|| '' , '')
    
  )) - length('')
      , 0
    )
)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vantiv_payment_id` AS string), substr(
    concat(
    
      coalesce(
  '\''
|| '' , '')
    
      , coalesce(concat(chr(9), chr(10), chr(11), chr(12), chr(13), chr(32), chr(133), chr(160), chr(5760), chr(8192), chr(8193), chr(8194), chr(8195), chr(8196), chr(8197), chr(8198), chr(8199), chr(8200), chr(8201), chr(8202), chr(8232), chr(8233), chr(8239), chr(8287), chr(12288))|| '' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(
  '\''
|| '' , '')
    
      , coalesce(concat(chr(9), chr(10), chr(11), chr(12), chr(13), chr(32), chr(133), chr(160), chr(5760), chr(8192), chr(8193), chr(8194), chr(8195), chr(8196), chr(8197), chr(8198), chr(8199), chr(8200), chr(8201), chr(8202), chr(8232), chr(8233), chr(8239), chr(8287), chr(12288))|| '' , '')
    
  )) - length('')
      , 0
    )
)), '') AS string) END as string)
 AS `transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`parent_vantiv_payment_id` AS string), substr(
    concat(
    
      coalesce(
  '\''
|| '' , '')
    
      , coalesce(concat(chr(9), chr(10), chr(11), chr(12), chr(13), chr(32), chr(133), chr(160), chr(5760), chr(8192), chr(8193), chr(8194), chr(8195), chr(8196), chr(8197), chr(8198), chr(8199), chr(8200), chr(8201), chr(8202), chr(8232), chr(8233), chr(8239), chr(8287), chr(12288))|| '' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(
  '\''
|| '' , '')
    
      , coalesce(concat(chr(9), chr(10), chr(11), chr(12), chr(13), chr(32), chr(133), chr(160), chr(5760), chr(8192), chr(8193), chr(8194), chr(8195), chr(8196), chr(8197), chr(8198), chr(8199), chr(8200), chr(8201), chr(8202), chr(8232), chr(8233), chr(8239), chr(8287), chr(12288))|| '' , '')
    
  )) - length('')
      , 0
    )
)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`parent_vantiv_payment_id` AS string), substr(
    concat(
    
      coalesce(
  '\''
|| '' , '')
    
      , coalesce(concat(chr(9), chr(10), chr(11), chr(12), chr(13), chr(32), chr(133), chr(160), chr(5760), chr(8192), chr(8193), chr(8194), chr(8195), chr(8196), chr(8197), chr(8198), chr(8199), chr(8200), chr(8201), chr(8202), chr(8232), chr(8233), chr(8239), chr(8287), chr(12288))|| '' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(
  '\''
|| '' , '')
    
      , coalesce(concat(chr(9), chr(10), chr(11), chr(12), chr(13), chr(32), chr(133), chr(160), chr(5760), chr(8192), chr(8193), chr(8194), chr(8195), chr(8196), chr(8197), chr(8198), chr(8199), chr(8200), chr(8201), chr(8202), chr(8232), chr(8233), chr(8239), chr(8287), chr(12288))|| '' , '')
    
  )) - length('')
      , 0
    )
)), '') AS string) END as string)
 AS `parent_transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`merchant_order_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`merchant_order_` AS string)), '') AS string) END as string)
 AS `mag_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_id` AS string)), '') AS string) END as string)
 AS `customer_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`txn_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`txn_type` AS string)), '') AS string) END as string)
 AS `transaction_description`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`purchase_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`purchase_currency` AS string)), '') AS string) END as string)
 AS `purchase_currency`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`purchase_amt` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`purchase_amt` AS string)), '') AS string) END as float64)
 AS `transaction_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payment_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_type` AS string)), '') AS string) END as string)
 AS `payment_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bin` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bin` AS string)), '') AS string) END as string)
 AS `bin`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`account_suffix` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`account_suffix` AS string)), '') AS string) END as string)
 AS `account_suffix`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`response_reason_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`response_reason_code` AS string)), '') AS string) END as string)
 AS `response_reason_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`response_reason_message` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`response_reason_message` AS string)), '') AS string) END as string)
 AS `response_reason_message`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`avs` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`avs` AS string)), '') AS string) END as string)
 AS `avs`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fraud_check_sum_response` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fraud_check_sum_response` AS string)), '') AS string) END as string)
 AS `fraud_check_sum_response`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payer_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payer_id` AS string)), '') AS string) END as string)
 AS `payer_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`merchant_transaction_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`merchant_transaction_id` AS string)), '') AS string) END as string)
 AS `merchant_transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`affiliate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`affiliate` AS string)), '') AS string) END as string)
 AS `affiliate`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`campaign` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`campaign` AS string)), '') AS string) END as string)
 AS `campaign`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`merchant_grouping_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`merchant_grouping_id` AS string)), '') AS string) END as string)
 AS `merchant_grouping_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sales_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sales_tax` AS string)), '') AS string) END as float64)
 AS `sales_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ftp_filename` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ftp_filename` AS string)), '') AS string) END as string)
 AS `ftp_filename`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`session_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`session_type` AS string)), '') AS string) END as string)
 AS `session_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`action_performed_by` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`action_performed_by` AS string)), '') AS string) END as string)
 AS `action_performed_by`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_reference` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_reference` AS string)), '') AS string) END as string)
 AS `customer_reference`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`secondary_amt` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`secondary_amt` AS string)), '') AS string) END as string)
 AS `secondary_amt`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pi_nless_debit_network` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pi_nless_debit_network` AS string)), '') AS string) END as string)
 AS `pi_nless_debit_network`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`merchant_category_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`merchant_category_code` AS string)), '') AS string) END as string)
 AS `merchant_category_code`



FROM `ff-stadiumgoods-raw-live`.`imports`.`vantiv_session_report` AS source_table

 ) AS source_select_statement

 ) AS un_ordered

