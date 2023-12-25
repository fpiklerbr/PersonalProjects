


  






































































 

SELECT   `ch`,  `transaction_id`,  `invoice_id`,  `pay_pal_reference_id`,  `pay_pal_reference_id_type`,  `transaction_event_code`,  `transaction_initiation_date`,  `transaction_processed_at`,  `transaction_description`,  `gross_transaction_amount`,  `transaction_amount`,  `gross_transaction_currency`,  `fee_debit_or_credit`,  `fee_amount`,  `fee_currency`,  `transactional_status`,  `insurance_amount`,  `sales_tax_amount`,  `shipping_amount`,  `transaction_subject`,  `transaction_note`,  `payer_account_id`,  `payer_address_status`,  `item_name`,  `item_id`,  `option_1_name`,  `option_1_value`,  `option_2_name`,  `option_2_value`,  `auction_site`,  `auction_buyer_id`,  `auction_closing_date`,  `shipping_address_line1`,  `shipping_address_line2`,  `shipping_address_city`,  `shipping_address_state`,  `shipping_address_zip`,  `shipping_address_country`,  `shipping_method`,  `custom_field`,  `billing_address_line1`,  `billing_address_line2`,  `billing_address_city`,  `billing_address_state`,  `billing_address_zip`,  `billing_address_country`,  `consumer_id`,  `first_name`,  `last_name`,  `consumer_business_name`,  `card_type`,  `payment_source`,  `shipping_name`,  `authorization_review_status`,  `protection_eligibility`,  `payment_tracking_id`,  `store_id`,  `terminal_id`,  `coupons`,  `special_offers`,  `loyalty_card_number`,  `checkout_type`,  `secondary_shipping_address_line1`,  `secondary_shipping_address_line2`,  `secondary_shipping_address_city`,  `secondary_shipping_address_state`,  `secondary_shipping_address_country`,  `secondary_shipping_address_zip`,  `_3_pl_reference_id`,  `gift_card_id`,  `file_name`,  `file_time`,  `transaction_fee`,  `payment_fee`,  `refund_fee`,  `payment_amount`,  `refund_amount`,  `payment_processed_at`,  `refund_processed_at`,  `mag_order_id`
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

 

FROM ( 

SELECT
    *

  , CAST(regexp_extract(invoice_id, 
  r'^[0-9]{9}$'
) AS string) AS `mag_order_id` 
FROM ( 

SELECT
    *

  , 
    safe_cast((gross_transaction_amount/ 100) as float64)
 AS `transaction_amount`
  , 
    safe_cast(CASE WHEN fee_debit_or_credit = 'DR' THEN -1 ELSE 1 END * (fee_amount / 100) as float64)
 AS `transaction_fee`
  , 
    safe_cast(CASE WHEN transaction_description = 'CR' THEN transaction_processed_at END as timestamp)
 AS `payment_processed_at`
  , 
    safe_cast(CASE WHEN transaction_description = 'DR' THEN transaction_processed_at END as timestamp)
 AS `refund_processed_at` 
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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transaction_initiation_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_initiation_date` AS string)), '') AS string) END as timestamp)
 AS `transaction_initiation_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transaction_completion_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_completion_date` AS string)), '') AS string) END as timestamp)
 AS `transaction_processed_at`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transactional_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transactional_status` AS string)), '') AS string) END as string)
 AS `transactional_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`insurance_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`insurance_amount` AS string)), '') AS string) END as float64)
 AS `insurance_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sales_tax_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sales_tax_amount` AS string)), '') AS string) END as float64)
 AS `sales_tax_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_amount` AS string)), '') AS string) END as float64)
 AS `shipping_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transaction_subject` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_subject` AS string)), '') AS string) END as string)
 AS `transaction_subject`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transaction_note` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_note` AS string)), '') AS string) END as string)
 AS `transaction_note`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payer_s_account_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payer_s_account_id` AS string)), '') AS string) END as string)
 AS `payer_account_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payer_address_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payer_address_status` AS string)), '') AS string) END as string)
 AS `payer_address_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_name` AS string)), '') AS string) END as string)
 AS `item_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_id` AS string)), '') AS string) END as string)
 AS `item_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`option_1_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`option_1_name` AS string)), '') AS string) END as string)
 AS `option_1_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`option_1_value` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`option_1_value` AS string)), '') AS string) END as float64)
 AS `option_1_value`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`option_2_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`option_2_name` AS string)), '') AS string) END as string)
 AS `option_2_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`option_2_value` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`option_2_value` AS string)), '') AS string) END as float64)
 AS `option_2_value`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`auction_site` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`auction_site` AS string)), '') AS string) END as string)
 AS `auction_site`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`auction_buyer_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`auction_buyer_id` AS string)), '') AS string) END as string)
 AS `auction_buyer_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`auction_closing_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`auction_closing_date` AS string)), '') AS string) END as timestamp)
 AS `auction_closing_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_address_line1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_address_line1` AS string)), '') AS string) END as string)
 AS `shipping_address_line1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_address_line2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_address_line2` AS string)), '') AS string) END as string)
 AS `shipping_address_line2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_address_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_address_city` AS string)), '') AS string) END as string)
 AS `shipping_address_city`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_address_state` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_address_state` AS string)), '') AS string) END as string)
 AS `shipping_address_state`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_address_zip` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_address_zip` AS string)), '') AS string) END as string)
 AS `shipping_address_zip`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_address_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_address_country` AS string)), '') AS string) END as string)
 AS `shipping_address_country`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_method` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_method` AS string)), '') AS string) END as string)
 AS `shipping_method`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`custom_field` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`custom_field` AS string)), '') AS string) END as string)
 AS `custom_field`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_address_line1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_address_line1` AS string)), '') AS string) END as string)
 AS `billing_address_line1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_address_line2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_address_line2` AS string)), '') AS string) END as string)
 AS `billing_address_line2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_address_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_address_city` AS string)), '') AS string) END as string)
 AS `billing_address_city`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_address_state` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_address_state` AS string)), '') AS string) END as string)
 AS `billing_address_state`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_address_zip` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_address_zip` AS string)), '') AS string) END as string)
 AS `billing_address_zip`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_address_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_address_country` AS string)), '') AS string) END as string)
 AS `billing_address_country`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`consumer_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consumer_id` AS string)), '') AS string) END as string)
 AS `consumer_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`first_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`first_name` AS string)), '') AS string) END as string)
 AS `first_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`last_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`last_name` AS string)), '') AS string) END as string)
 AS `last_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`consumer_business_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consumer_business_name` AS string)), '') AS string) END as string)
 AS `consumer_business_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`card_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`card_type` AS string)), '') AS string) END as string)
 AS `card_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payment_source` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_source` AS string)), '') AS string) END as string)
 AS `payment_source`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_name` AS string)), '') AS string) END as string)
 AS `shipping_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`authorization_review_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`authorization_review_status` AS string)), '') AS string) END as string)
 AS `authorization_review_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`protection_eligibility` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`protection_eligibility` AS string)), '') AS string) END as string)
 AS `protection_eligibility`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payment_tracking_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_tracking_id` AS string)), '') AS string) END as string)
 AS `payment_tracking_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_id` AS string)), '') AS string) END as string)
 AS `store_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`terminal_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`terminal_id` AS string)), '') AS string) END as string)
 AS `terminal_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`coupons` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`coupons` AS string)), '') AS string) END as string)
 AS `coupons`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`special_offers` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`special_offers` AS string)), '') AS string) END as string)
 AS `special_offers`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`loyalty_card_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`loyalty_card_number` AS string)), '') AS string) END as string)
 AS `loyalty_card_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`checkout_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`checkout_type` AS string)), '') AS string) END as string)
 AS `checkout_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`secondary_shipping_address_line1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`secondary_shipping_address_line1` AS string)), '') AS string) END as string)
 AS `secondary_shipping_address_line1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`secondary_shipping_address_line2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`secondary_shipping_address_line2` AS string)), '') AS string) END as string)
 AS `secondary_shipping_address_line2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`secondary_shipping_address_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`secondary_shipping_address_city` AS string)), '') AS string) END as string)
 AS `secondary_shipping_address_city`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`secondary_shipping_address_state` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`secondary_shipping_address_state` AS string)), '') AS string) END as string)
 AS `secondary_shipping_address_state`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`secondary_shipping_address_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`secondary_shipping_address_country` AS string)), '') AS string) END as string)
 AS `secondary_shipping_address_country`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`secondary_shipping_address_zip` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`secondary_shipping_address_zip` AS string)), '') AS string) END as string)
 AS `secondary_shipping_address_zip`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_3_pl_reference_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_3_pl_reference_id` AS string)), '') AS string) END as string)
 AS `_3_pl_reference_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gift_card_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gift_card_id` AS string)), '') AS string) END as string)
 AS `gift_card_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_timestamp` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_timestamp` AS string)), '') AS string) END as timestamp)
 AS `file_time`



FROM `ff-stadiumgoods-raw-live`.`imports`.`paypal_transactions` AS source_table

 ) AS source_select_statement

 ) AS source_and_sql_select_statement

 ) AS macro_statement

 ) AS un_ordered

