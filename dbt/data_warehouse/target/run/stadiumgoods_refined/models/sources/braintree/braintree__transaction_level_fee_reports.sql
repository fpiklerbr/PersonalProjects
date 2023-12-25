

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`braintree__transaction_level_fee_reports`
  OPTIONS()
  as 

  






























 

SELECT   `merchant_account_id`,  `transaction_id`,  `original_transaction_id`,  `transaction_description`,  `presentment_currency`,  `original_sale_amount`,  `settlement_currency`,  `transaction_amount`,  `settlement_date`,  `disbursement_date`,  `payment_instrument`,  `card_brand`,  `card_type`,  `first_6_of_cc`,  `issuing_bank`,  `refunded_amount`,  `refund_type`,  `exchange_rate`,  `mag_order_id`,  `acquirer_reference_number`,  `card_issuing_country`,  `discount`,  `discount_credit`,  `per_transaction_fee`,  `per_transaction_fee_credit`,  `braintree_total_amount`,  `multicurrency_fee_amount`,  `multicurrency_fee_credit`,  `total_fee_amount`,  `file_name`,  `file_time`,  `payment_amount`,  `refund_amount`,  `payment_fee`,  `refund_fee`
  FROM ( 

SELECT
    *

  , 
    safe_cast(CASE WHEN transaction_description IN ('sale','voided sale') THEN transaction_amount END as float64)
 AS `payment_amount`
  , 
    safe_cast(CASE WHEN transaction_description IN ('credit','voided sale') THEN (-1 * transaction_amount) END as float64)
 AS `refund_amount`
  , 
    safe_cast(CASE WHEN transaction_description IN ('sale','voided sale') THEN (-1 * total_fee_amount) END as float64)
 AS `payment_fee`
  , 
    safe_cast(CASE WHEN transaction_description IN ('credit','voided sale') THEN (-1 * total_fee_amount) END as float64)
 AS `refund_fee` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`merchant_account_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`merchant_account_id` AS string)), '') AS string) END as string)
 AS `merchant_account_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transaction_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_id` AS string)), '') AS string) END as string)
 AS `transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`original_transaction_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`original_transaction_id` AS string)), '') AS string) END as string)
 AS `original_transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transaction_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_type` AS string)), '') AS string) END as string)
 AS `transaction_description`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`presentment_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`presentment_currency` AS string)), '') AS string) END as string)
 AS `presentment_currency`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`original_sale_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`original_sale_amount` AS string)), '') AS string) END as float64)
 AS `original_sale_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`settlement_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`settlement_currency` AS string)), '') AS string) END as string)
 AS `settlement_currency`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`settlement_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`settlement_amount` AS string)), '') AS string) END as float64)
 AS `transaction_amount`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`settlement_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`settlement_date` AS string)), '') AS string) END as timestamp)
 as date)
 AS `settlement_date`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`disbursement_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`disbursement_date` AS string)), '') AS string) END as timestamp)
 as date)
 AS `disbursement_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payment_instrument` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_instrument` AS string)), '') AS string) END as string)
 AS `payment_instrument`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`card_brand` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`card_brand` AS string)), '') AS string) END as string)
 AS `card_brand`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`card_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`card_type` AS string)), '') AS string) END as string)
 AS `card_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`first_6_of_cc` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`first_6_of_cc` AS string)), '') AS string) END as string)
 AS `first_6_of_cc`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`issuing_bank` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`issuing_bank` AS string)), '') AS string) END as string)
 AS `issuing_bank`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`refunded_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`refunded_amount` AS string)), '') AS string) END as float64)
 AS `refunded_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`refund_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`refund_type` AS string)), '') AS string) END as string)
 AS `refund_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`exchange_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`exchange_rate` AS string)), '') AS string) END as float64)
 AS `exchange_rate`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as string)
 AS `mag_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`acquirer_reference_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`acquirer_reference_number` AS string)), '') AS string) END as string)
 AS `acquirer_reference_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`card_issuing_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`card_issuing_country` AS string)), '') AS string) END as string)
 AS `card_issuing_country`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount` AS string)), '') AS string) END as float64)
 AS `discount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount_credit` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount_credit` AS string)), '') AS string) END as float64)
 AS `discount_credit`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`per_transaction_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`per_transaction_fee` AS string)), '') AS string) END as float64)
 AS `per_transaction_fee`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`per_transaction_fee_credit` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`per_transaction_fee_credit` AS string)), '') AS string) END as float64)
 AS `per_transaction_fee_credit`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`braintree_total_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`braintree_total_amount` AS string)), '') AS string) END as float64)
 AS `braintree_total_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`multicurrency_fee_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`multicurrency_fee_amount` AS string)), '') AS string) END as float64)
 AS `multicurrency_fee_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`multicurrency_fee_credit` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`multicurrency_fee_credit` AS string)), '') AS string) END as float64)
 AS `multicurrency_fee_credit`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_fee_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_fee_amount` AS string)), '') AS string) END as float64)
 AS `total_fee_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`



FROM `ff-stadiumgoods-raw-live`.`imports`.`braintree_transaction_level_fee_reports` AS source_table

 ) AS source_select_statement

 ) AS un_ordered

;

