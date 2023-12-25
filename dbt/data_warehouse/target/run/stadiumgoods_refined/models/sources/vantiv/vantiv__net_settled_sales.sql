

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`vantiv__net_settled_sales`
  OPTIONS()
  as 



























































 

SELECT   `reporting_group`,  `merchant`,  `activity_date`,  `settlement_date`,  `transaction_id`,  `parent_transaction_id`,  `mag_order_id`,  `transaction_description`,  `purchase_currency`,  `purchase_amt`,  `settlement_currency`,  `transaction_amount`,  `payment_type`,  `account_suffix`,  `bin`,  `response_reason_message`,  `settlement_id`,  `session_id`,  `arn`,  `interchange_rate`,  `customer_id`,  `merchant_transaction_id`,  `affiliate`,  `campaign`,  `merchant_grouping_id`,  `token_number`,  `transaction_processed_at`,  `transaction_fee`,  `interchange_flat_rate`,  `interchange_percent_rate`,  `funding_method`,  `issuing_bank`,  `billing_descriptor`,  `merchant_id`,  `presenter`,  `vantiv_cnp_api_reporting_group`,  `customer_reference`,  `secondary_amt`,  `secondary_settlement_amt`,  `requested_auth_amount`,  `original_auth_code`,  `customer_name`,  `address_line_1`,  `address_line_2`,  `city`,  `state`,  `postal_code`,  `fraud_checksum_response_code`,  `fraud_checksum_response_message`,  `avs_response_code`,  `avs_response_message`,  `token_response_code`,  `token_response_message`,  `pi_nless_debit_network`,  `file_name`,  `file_time`,  `merchant_category_code`,  `checkout_status`,  `payment_amount`,  `refund_amount`,  `payment_processed_at`,  `refund_processed_at`,  `payment_fee`,  `refund_fee`
    , `_raw_billing_profile_id`
  FROM ( 

SELECT
    *

  , 
    safe_cast(CASE WHEN response_reason_message = 'Approved' THEN 'Approved' ELSE 'Not Approved' END as string)
 AS `checkout_status`
  , 
    safe_cast(CASE WHEN transaction_description IN ('Cond. Deposit','Deposit') THEN transaction_amount END as float64)
 AS `payment_amount`
  , 
    safe_cast(CASE WHEN transaction_description IN ('Refund') THEN (-1* transaction_amount) END as float64)
 AS `refund_amount`
  , 
    safe_cast(CASE WHEN transaction_description IN ('Cond. Deposit','Deposit') THEN transaction_processed_at END as timestamp)
 AS `payment_processed_at`
  , 
    safe_cast(CASE WHEN transaction_description IN ('Refund') THEN transaction_processed_at END as timestamp)
 AS `refund_processed_at`
  , 
    safe_cast(CASE WHEN transaction_description IN ('Cond. Deposit','Deposit') THEN transaction_fee END as float64)
 AS `payment_fee`
  , 
    safe_cast(CASE WHEN transaction_description IN ('Refund') THEN transaction_fee END as float64)
 AS `refund_fee` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reporting_group` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reporting_group` AS string)), '') AS string) END as string)
 AS `reporting_group`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`merchant` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`merchant` AS string)), '') AS string) END as string)
 AS `merchant`

  , 
    safe_cast(
    safe_cast(CASE
          WHEN


  regexp_contains(CASE WHEN cast(nullif(trim(cast(`activity_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`activity_date` AS string)), '') AS string) END, r'(?i)^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$')


          THEN  parse_timestamp('%m/%d/%Y', CASE WHEN cast(nullif(trim(cast(`activity_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`activity_date` AS string)), '') AS string) END)
        END as timestamp)


 as date)
 AS `activity_date`

  , 
    safe_cast(
    safe_cast(CASE
          WHEN


  regexp_contains(CASE WHEN cast(nullif(trim(cast(`settlement_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`settlement_date` AS string)), '') AS string) END, r'(?i)^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$')


          THEN  parse_timestamp('%m/%d/%Y', CASE WHEN cast(nullif(trim(cast(`settlement_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`settlement_date` AS string)), '') AS string) END)
        END as timestamp)


 as date)
 AS `settlement_date`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`merchant_order_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`merchant_order_number` AS string)), '') AS string) END as string)
 AS `mag_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`txn_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`txn_type` AS string)), '') AS string) END as string)
 AS `transaction_description`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`purchase_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`purchase_currency` AS string)), '') AS string) END as string)
 AS `purchase_currency`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`purchase_amt` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`purchase_amt` AS string)), '') AS string) END as float64)
 AS `purchase_amt`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`settlement_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`settlement_currency` AS string)), '') AS string) END as string)
 AS `settlement_currency`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`settlement_amt` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`settlement_amt` AS string)), '') AS string) END as float64)
 AS `transaction_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payment_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_type` AS string)), '') AS string) END as string)
 AS `payment_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`account_suffix` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`account_suffix` AS string)), '') AS string) END as string)
 AS `account_suffix`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bin` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bin` AS string)), '') AS string) END as string)
 AS `bin`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`response_reason_message` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`response_reason_message` AS string)), '') AS string) END as string)
 AS `response_reason_message`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`batch_id` AS string), substr(
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
)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`batch_id` AS string), substr(
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
 AS `settlement_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`session_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`session_id` AS string)), '') AS string) END as string)
 AS `session_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`arn` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`arn` AS string)), '') AS string) END as string)
 AS `arn`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`interchange_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`interchange_rate` AS string)), '') AS string) END as string)
 AS `interchange_rate`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_id` AS string)), '') AS string) END as string)
 AS `customer_id`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`token_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`token_number` AS string)), '') AS string) END as string)
 AS `token_number`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`approximate_interchange_fee_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`approximate_interchange_fee_amount` AS string)), '') AS string) END as float64)
 AS `transaction_fee`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`interchange_flat_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`interchange_flat_rate` AS string)), '') AS string) END as float64)
 AS `interchange_flat_rate`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`interchange_percent_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`interchange_percent_rate` AS string)), '') AS string) END as float64)
 AS `interchange_percent_rate`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`funding_method` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`funding_method` AS string)), '') AS string) END as string)
 AS `funding_method`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`issuing_bank` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`issuing_bank` AS string)), '') AS string) END as string)
 AS `issuing_bank`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_descriptor` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_descriptor` AS string)), '') AS string) END as string)
 AS `billing_descriptor`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`merchant_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`merchant_id` AS string)), '') AS string) END as string)
 AS `merchant_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`presenter` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`presenter` AS string)), '') AS string) END as string)
 AS `presenter`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vantiv_cnp_api_reporting_group` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vantiv_cnp_api_reporting_group` AS string)), '') AS string) END as string)
 AS `vantiv_cnp_api_reporting_group`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_reference` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_reference` AS string)), '') AS string) END as string)
 AS `customer_reference`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`secondary_amt` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`secondary_amt` AS string)), '') AS string) END as float64)
 AS `secondary_amt`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`secondary_settlement_amt` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`secondary_settlement_amt` AS string)), '') AS string) END as float64)
 AS `secondary_settlement_amt`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`requested_auth_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`requested_auth_amount` AS string)), '') AS string) END as float64)
 AS `requested_auth_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`original_auth_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`original_auth_code` AS string)), '') AS string) END as string)
 AS `original_auth_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_name` AS string)), '') AS string) END as string)
 AS `customer_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`address_line_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`address_line_1` AS string)), '') AS string) END as string)
 AS `address_line_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`address_line_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`address_line_2` AS string)), '') AS string) END as string)
 AS `address_line_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`city` AS string)), '') AS string) END as string)
 AS `city`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`state` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`state` AS string)), '') AS string) END as string)
 AS `state`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`postal_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`postal_code` AS string)), '') AS string) END as string)
 AS `postal_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fraud_checksum_response_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fraud_checksum_response_code` AS string)), '') AS string) END as string)
 AS `fraud_checksum_response_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fraud_checksum_response_message` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fraud_checksum_response_message` AS string)), '') AS string) END as string)
 AS `fraud_checksum_response_message`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`avs_response_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`avs_response_code` AS string)), '') AS string) END as string)
 AS `avs_response_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`avs_response_message` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`avs_response_message` AS string)), '') AS string) END as string)
 AS `avs_response_message`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`token_response_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`token_response_code` AS string)), '') AS string) END as string)
 AS `token_response_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`token_response_message` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`token_response_message` AS string)), '') AS string) END as string)
 AS `token_response_message`

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


  , `billing_profile_id` AS `_raw_billing_profile_id`


FROM `ff-stadiumgoods-raw-live`.`imports`.`vantiv_net_settled_sales` AS source_table

 ) AS source_select_statement

 ) AS un_ordered

;

