
















































































































 

SELECT   `_refund_id`,  `_setattrs`,  `add_ons`,  `additional_processor_response`,  `transaction_amount`,  `apple_pay`,  `apple_pay_details`,  `authorization_adjustments`,  `authorization_expires_at`,  `authorized_transaction_global_id`,  `authorized_transaction_id`,  `avs_error_response_code`,  `avs_postal_code_response_code`,  `avs_street_address_response_code`,  `billing`,  `billing_details`,  `channel`,  `transaction_processed_at`,  `credit_card`,  `credit_card_details`,  `currency_iso_code`,  `custom_fields`,  `customer`,  `customer_details`,  `cvv_response_code`,  `descriptor`,  `disbursement_details`,  `discount_amount`,  `discounts`,  `disputes`,  `escrow_status`,  `gateway`,  `gateway_rejection_reason`,  `global_id`,  `transaction_id`,  `master_merchant_account_id`,  `merchant_account_id`,  `network_response_code`,  `network_response_text`,  `network_transaction_id`,  `mag_order_id`,  `partial_settlement_transaction_global_ids`,  `partial_settlement_transaction_ids`,  `payment_instrument_type`,  `paypal_details`,  `plan_id`,  `processor_authorization_code`,  `processor_response_code`,  `processor_response_text`,  `processor_response_type`,  `processor_settlement_response_code`,  `processor_settlement_response_text`,  `purchase_order_number`,  `recurring`,  `refund_global_ids`,  `refund_ids`,  `refunded_transaction_global_id`,  `refunded_transaction_id`,  `risk_data`,  `service_fee_amount`,  `settlement_id`,  `settlement_date`,  `shipping`,  `shipping_amount`,  `shipping_details`,  `ships_from_postal_code`,  `transaction_status`,  `status_history`,  `sub_merchant_account_id`,  `subscription`,  `subscription_details`,  `subscription_id`,  `tax_amount`,  `is_tax_exempt`,  `three_d_secure_info`,  `transaction_type`,  `updated_at`,  `voice_referral_number`,  `file_time`,  `file_name`,  `retried_transaction_id`,  `retry_ids`,  `pin_verified`,  `acquirer_reference_number`,  `retried_transaction_global_id`,  `terminal_identification_number`,  `sca_exemption_requested`,  `processed_with_network_token`,  `response_emv_data`,  `refunded_installments`,  `installment_count`,  `retrieval_reference_number`,  `merchant_address`,  `merchant_name`,  `_raw_paypal_details`,  `installments`,  `merchant_identification_number`,  `retry_global_ids`,  `transaction_state`,  `checkout_status`,  `transaction_description`,  `payment_amount`,  `refund_amount`,  `payment_processed_at`,  `refund_processed_at`
    , `_raw_account_balance`
    , `_raw_amount_requested`
    , `_raw_debit_network`
    , `_raw_processing_mode`
    , `_raw_payment_receipt`
    , `_raw_account_funding_transaction`
    , `_raw_retried`
    , `_raw_reason`
    , `_raw_description`
    , `_raw_ach_return_responses`
    , `_raw_ach_return_code`
    , `_raw_merchant_advice_code`
    , `_raw_merchant_advice_code_text`
    , `_raw_surcharge_amount`
  FROM ( SELECT
    *

  , 
    safe_cast(CASE WHEN transaction_description IN ('sale','voided sale') THEN transaction_amount END as float64)
 AS `payment_amount`
  , 
    safe_cast(CASE WHEN transaction_description IN ('credit','voided sale') THEN transaction_amount END as float64)
 AS `refund_amount`
  , 
    safe_cast(CASE WHEN transaction_description IN ('sale','voided sale') THEN transaction_processed_at END as timestamp)
 AS `payment_processed_at`
  , 
    safe_cast(CASE WHEN transaction_description IN ('credit','voided sale') THEN transaction_processed_at END as timestamp)
 AS `refund_processed_at` 

 

FROM ( 

SELECT
    *

  , 
    safe_cast(substr(nullif(settlement_id, 'None'),1,10) as date)
 AS `settlement_date`
  , 
    safe_cast(CASE WHEN transaction_status = 'settled' THEN 'Settled' ELSE 'Not Settled' END as string)
 AS `transaction_state`
  , 
    safe_cast(CASE WHEN processor_response_type = 'approved' THEN 'Approved' ELSE 'Not Approved' END as string)
 AS `checkout_status`
  , 
    safe_cast(CASE WHEN transaction_type = 'sale' AND transaction_status = 'voided' THEN 'voided sale' ELSE transaction_type END as string)
 AS `transaction_description` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_refund_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_refund_id` AS string)), '') AS string) END as string)
 AS `_refund_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_setattrs` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_setattrs` AS string)), '') AS string) END as string)
 AS `_setattrs`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`add_ons` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`add_ons` AS string)), '') AS string) END as string)
 AS `add_ons`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`additional_processor_response` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`additional_processor_response` AS string)), '') AS string) END as string)
 AS `additional_processor_response`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amount` AS string)), '') AS string) END as float64)
 AS `transaction_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`apple_pay` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`apple_pay` AS string)), '') AS string) END as string)
 AS `apple_pay`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`apple_pay_details` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`apple_pay_details` AS string)), '') AS string) END as string)
 AS `apple_pay_details`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`authorization_adjustments` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`authorization_adjustments` AS string)), '') AS string) END as string)
 AS `authorization_adjustments`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`authorization_expires_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`authorization_expires_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `authorization_expires_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`authorized_transaction_global_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`authorized_transaction_global_id` AS string)), '') AS string) END as string)
 AS `authorized_transaction_global_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`authorized_transaction_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`authorized_transaction_id` AS string)), '') AS string) END as string)
 AS `authorized_transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`avs_error_response_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`avs_error_response_code` AS string)), '') AS string) END as string)
 AS `avs_error_response_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`avs_postal_code_response_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`avs_postal_code_response_code` AS string)), '') AS string) END as string)
 AS `avs_postal_code_response_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`avs_street_address_response_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`avs_street_address_response_code` AS string)), '') AS string) END as string)
 AS `avs_street_address_response_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing` AS string)), '') AS string) END as string)
 AS `billing`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_details` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_details` AS string)), '') AS string) END as string)
 AS `billing_details`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`channel` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`channel` AS string)), '') AS string) END as string)
 AS `channel`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `transaction_processed_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credit_card` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credit_card` AS string)), '') AS string) END as string)
 AS `credit_card`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credit_card_details` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credit_card_details` AS string)), '') AS string) END as string)
 AS `credit_card_details`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`currency_iso_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`currency_iso_code` AS string)), '') AS string) END as string)
 AS `currency_iso_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`custom_fields` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`custom_fields` AS string)), '') AS string) END as string)
 AS `custom_fields`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer` AS string)), '') AS string) END as string)
 AS `customer`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_details` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_details` AS string)), '') AS string) END as string)
 AS `customer_details`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cvv_response_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cvv_response_code` AS string)), '') AS string) END as string)
 AS `cvv_response_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`descriptor` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`descriptor` AS string)), '') AS string) END as string)
 AS `descriptor`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`disbursement_details` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`disbursement_details` AS string)), '') AS string) END as string)
 AS `disbursement_details`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount_amount` AS string)), '') AS string) END as float64)
 AS `discount_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discounts` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discounts` AS string)), '') AS string) END as string)
 AS `discounts`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`disputes` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`disputes` AS string)), '') AS string) END as string)
 AS `disputes`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`escrow_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`escrow_status` AS string)), '') AS string) END as string)
 AS `escrow_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gateway` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gateway` AS string)), '') AS string) END as string)
 AS `gateway`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gateway_rejection_reason` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gateway_rejection_reason` AS string)), '') AS string) END as string)
 AS `gateway_rejection_reason`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`global_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`global_id` AS string)), '') AS string) END as string)
 AS `global_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as string)
 AS `transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`master_merchant_account_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`master_merchant_account_id` AS string)), '') AS string) END as string)
 AS `master_merchant_account_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`merchant_account_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`merchant_account_id` AS string)), '') AS string) END as string)
 AS `merchant_account_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`network_response_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`network_response_code` AS string)), '') AS string) END as string)
 AS `network_response_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`network_response_text` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`network_response_text` AS string)), '') AS string) END as string)
 AS `network_response_text`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`network_transaction_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`network_transaction_id` AS string)), '') AS string) END as string)
 AS `network_transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as string)
 AS `mag_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`partial_settlement_transaction_global_ids` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`partial_settlement_transaction_global_ids` AS string)), '') AS string) END as string)
 AS `partial_settlement_transaction_global_ids`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`partial_settlement_transaction_ids` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`partial_settlement_transaction_ids` AS string)), '') AS string) END as string)
 AS `partial_settlement_transaction_ids`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payment_instrument_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_instrument_type` AS string)), '') AS string) END as string)
 AS `payment_instrument_type`

  , 
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`paypal` AS string), substr(
    concat(
    
      coalesce(
  '[]\''
|| '' , '')
    
      , coalesce(concat(chr(9), chr(10), chr(11), chr(12), chr(13), chr(32), chr(133), chr(160), chr(5760), chr(8192), chr(8193), chr(8194), chr(8195), chr(8196), chr(8197), chr(8198), chr(8199), chr(8200), chr(8201), chr(8202), chr(8232), chr(8233), chr(8239), chr(8287), chr(12288))|| '' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(
  '[]\''
|| '' , '')
    
      , coalesce(concat(chr(9), chr(10), chr(11), chr(12), chr(13), chr(32), chr(133), chr(160), chr(5760), chr(8192), chr(8193), chr(8194), chr(8195), chr(8196), chr(8197), chr(8198), chr(8199), chr(8200), chr(8201), chr(8202), chr(8232), chr(8233), chr(8239), chr(8287), chr(12288))|| '' , '')
    
  )) - length('')
      , 0
    )
)), '') AS string), 
  '\\\''
, 
  '\''
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`paypal` AS string), substr(
    concat(
    
      coalesce(
  '[]\''
|| '' , '')
    
      , coalesce(concat(chr(9), chr(10), chr(11), chr(12), chr(13), chr(32), chr(133), chr(160), chr(5760), chr(8192), chr(8193), chr(8194), chr(8195), chr(8196), chr(8197), chr(8198), chr(8199), chr(8200), chr(8201), chr(8202), chr(8232), chr(8233), chr(8239), chr(8287), chr(12288))|| '' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(
  '[]\''
|| '' , '')
    
      , coalesce(concat(chr(9), chr(10), chr(11), chr(12), chr(13), chr(32), chr(133), chr(160), chr(5760), chr(8192), chr(8193), chr(8194), chr(8195), chr(8196), chr(8197), chr(8198), chr(8199), chr(8200), chr(8201), chr(8202), chr(8232), chr(8233), chr(8239), chr(8287), chr(12288))|| '' , '')
    
  )) - length('')
      , 0
    )
)), '') AS string), 
  '\\\''
, 
  '\''
) END as string)
 AS `paypal_details`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`plan_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`plan_id` AS string)), '') AS string) END as string)
 AS `plan_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`processor_authorization_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`processor_authorization_code` AS string)), '') AS string) END as string)
 AS `processor_authorization_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`processor_response_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`processor_response_code` AS string)), '') AS string) END as string)
 AS `processor_response_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`processor_response_text` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`processor_response_text` AS string)), '') AS string) END as string)
 AS `processor_response_text`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`processor_response_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`processor_response_type` AS string)), '') AS string) END as string)
 AS `processor_response_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`processor_settlement_response_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`processor_settlement_response_code` AS string)), '') AS string) END as string)
 AS `processor_settlement_response_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`processor_settlement_response_text` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`processor_settlement_response_text` AS string)), '') AS string) END as string)
 AS `processor_settlement_response_text`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`purchase_order_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`purchase_order_number` AS string)), '') AS string) END as string)
 AS `purchase_order_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recurring` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recurring` AS string)), '') AS string) END as string)
 AS `recurring`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`refund_global_ids` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`refund_global_ids` AS string)), '') AS string) END as string)
 AS `refund_global_ids`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`refund_ids` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`refund_ids` AS string)), '') AS string) END as string)
 AS `refund_ids`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`refunded_transaction_global_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`refunded_transaction_global_id` AS string)), '') AS string) END as string)
 AS `refunded_transaction_global_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`refunded_transaction_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`refunded_transaction_id` AS string)), '') AS string) END as string)
 AS `refunded_transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`risk_data` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`risk_data` AS string)), '') AS string) END as string)
 AS `risk_data`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`service_fee_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`service_fee_amount` AS string)), '') AS string) END as float64)
 AS `service_fee_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`settlement_batch_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`settlement_batch_id` AS string)), '') AS string) END as string)
 AS `settlement_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping` AS string)), '') AS string) END as string)
 AS `shipping`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_amount` AS string)), '') AS string) END as float64)
 AS `shipping_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_details` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_details` AS string)), '') AS string) END as string)
 AS `shipping_details`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ships_from_postal_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ships_from_postal_code` AS string)), '') AS string) END as string)
 AS `ships_from_postal_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as string)
 AS `transaction_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status_history` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status_history` AS string)), '') AS string) END as string)
 AS `status_history`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sub_merchant_account_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sub_merchant_account_id` AS string)), '') AS string) END as string)
 AS `sub_merchant_account_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`subscription` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`subscription` AS string)), '') AS string) END as string)
 AS `subscription`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`subscription_details` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`subscription_details` AS string)), '') AS string) END as string)
 AS `subscription_details`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`subscription_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`subscription_id` AS string)), '') AS string) END as string)
 AS `subscription_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_amount` AS string)), '') AS string) END as float64)
 AS `tax_amount`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`tax_exempt` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_exempt` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`tax_exempt` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_exempt` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `is_tax_exempt`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`three_d_secure_info` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`three_d_secure_info` AS string)), '') AS string) END as string)
 AS `three_d_secure_info`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`type` AS string)), '') AS string) END as string)
 AS `transaction_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS `updated_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`voice_referral_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`voice_referral_number` AS string)), '') AS string) END as string)
 AS `voice_referral_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`retried_transaction_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`retried_transaction_id` AS string)), '') AS string) END as string)
 AS `retried_transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`retry_ids` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`retry_ids` AS string)), '') AS string) END as string)
 AS `retry_ids`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pin_verified` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pin_verified` AS string)), '') AS string) END as string)
 AS `pin_verified`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`acquirer_reference_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`acquirer_reference_number` AS string)), '') AS string) END as string)
 AS `acquirer_reference_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`retried_transaction_global_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`retried_transaction_global_id` AS string)), '') AS string) END as string)
 AS `retried_transaction_global_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`terminal_identification_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`terminal_identification_number` AS string)), '') AS string) END as string)
 AS `terminal_identification_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sca_exemption_requested` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sca_exemption_requested` AS string)), '') AS string) END as string)
 AS `sca_exemption_requested`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`processed_with_network_token` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`processed_with_network_token` AS string)), '') AS string) END as string)
 AS `processed_with_network_token`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`response_emv_data` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`response_emv_data` AS string)), '') AS string) END as string)
 AS `response_emv_data`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`refunded_installments` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`refunded_installments` AS string)), '') AS string) END as string)
 AS `refunded_installments`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`installment_count` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`installment_count` AS string)), '') AS string) END as string)
 AS `installment_count`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`retrieval_reference_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`retrieval_reference_number` AS string)), '') AS string) END as string)
 AS `retrieval_reference_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`merchant_address` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`merchant_address` AS string)), '') AS string) END as string)
 AS `merchant_address`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`merchant_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`merchant_name` AS string)), '') AS string) END as string)
 AS `merchant_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`paypal_details` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`paypal_details` AS string)), '') AS string) END as string)
 AS `_raw_paypal_details`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`installments` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`installments` AS string)), '') AS string) END as string)
 AS `installments`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`merchant_identification_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`merchant_identification_number` AS string)), '') AS string) END as string)
 AS `merchant_identification_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`retry_global_ids` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`retry_global_ids` AS string)), '') AS string) END as string)
 AS `retry_global_ids`


  , `account_balance` AS `_raw_account_balance`

  , `amount_requested` AS `_raw_amount_requested`

  , `debit_network` AS `_raw_debit_network`

  , `processing_mode` AS `_raw_processing_mode`

  , `payment_receipt` AS `_raw_payment_receipt`

  , `account_funding_transaction` AS `_raw_account_funding_transaction`

  , `retried` AS `_raw_retried`

  , `reason` AS `_raw_reason`

  , `description` AS `_raw_description`

  , `ach_return_responses` AS `_raw_ach_return_responses`

  , `ach_return_code` AS `_raw_ach_return_code`

  , `merchant_advice_code` AS `_raw_merchant_advice_code`

  , `merchant_advice_code_text` AS `_raw_merchant_advice_code_text`

  , `surcharge_amount` AS `_raw_surcharge_amount`


FROM `ff-stadiumgoods-raw-live`.`imports`.`braintree_api_orders` AS source_table

 ) AS source_select_statement

 ) AS macro_statement

 ) AS un_ordered

