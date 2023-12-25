

  

























































 

SELECT   `sales_flat_order_payment_id`,  `sales_flat_order_id`,  `base_shipping_captured`,  `shipping_captured`,  `amount_refunded`,  `base_amount_paid`,  `amount_canceled`,  `base_amount_authorized`,  `base_amount_paid_online`,  `base_amount_refunded_online`,  `base_shipping_amount`,  `shipping_amount`,  `amount_paid`,  `amount_authorized`,  `base_amount_ordered`,  `base_shipping_refunded`,  `shipping_refunded`,  `base_amount_refunded`,  `amount_ordered`,  `base_amount_canceled`,  `quote_payment_id`,  `additional_data`,  `cc_exp_month`,  `cc_ss_start_year`,  `echeck_bank_name`,  `method`,  `cc_debug_request_body`,  `cc_secure_verify`,  `protection_eligibility`,  `cc_approval`,  `cc_last4`,  `cc_status_description`,  `echeck_type`,  `cc_debug_response_serialized`,  `cc_ss_start_month`,  `echeck_account_type`,  `last_trans_id`,  `cc_cid_status`,  `cc_owner`,  `cc_type`,  `po_number`,  `cc_exp_year`,  `cc_status`,  `echeck_routing_number`,  `account_status`,  `anet_trans_method`,  `cc_debug_response_body`,  `cc_ss_issue`,  `echeck_account_name`,  `cc_avs_status`,  to_hex(md5(cast(`cc_number_enc` as 
    string
))) AS `cc_number_enc`,  `cc_trans_id`,  `paybox_request_number`,  `address_status`,  `additional_information`,  `litle_vault_id`,  `channel`,  `_synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sales_flat_order_payment_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`parent_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`parent_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sales_flat_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_shipping_captured` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_shipping_captured` AS string)), '') AS string) END as float64)
 AS `base_shipping_captured`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_captured` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_captured` AS string)), '') AS string) END as float64)
 AS `shipping_captured`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amount_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amount_refunded` AS string)), '') AS string) END as float64)
 AS `amount_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_amount_paid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_amount_paid` AS string)), '') AS string) END as float64)
 AS `base_amount_paid`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amount_canceled` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amount_canceled` AS string)), '') AS string) END as float64)
 AS `amount_canceled`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_amount_authorized` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_amount_authorized` AS string)), '') AS string) END as float64)
 AS `base_amount_authorized`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_amount_paid_online` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_amount_paid_online` AS string)), '') AS string) END as float64)
 AS `base_amount_paid_online`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_amount_refunded_online` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_amount_refunded_online` AS string)), '') AS string) END as float64)
 AS `base_amount_refunded_online`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_shipping_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_shipping_amount` AS string)), '') AS string) END as float64)
 AS `base_shipping_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_amount` AS string)), '') AS string) END as float64)
 AS `shipping_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amount_paid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amount_paid` AS string)), '') AS string) END as float64)
 AS `amount_paid`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amount_authorized` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amount_authorized` AS string)), '') AS string) END as float64)
 AS `amount_authorized`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_amount_ordered` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_amount_ordered` AS string)), '') AS string) END as float64)
 AS `base_amount_ordered`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_shipping_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_shipping_refunded` AS string)), '') AS string) END as float64)
 AS `base_shipping_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_refunded` AS string)), '') AS string) END as float64)
 AS `shipping_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_amount_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_amount_refunded` AS string)), '') AS string) END as float64)
 AS `base_amount_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amount_ordered` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amount_ordered` AS string)), '') AS string) END as float64)
 AS `amount_ordered`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_amount_canceled` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_amount_canceled` AS string)), '') AS string) END as float64)
 AS `base_amount_canceled`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`quote_payment_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`quote_payment_id` AS string)), '') AS string) END as string)
 AS `quote_payment_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`additional_data` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`additional_data` AS string)), '') AS string) END as string)
 AS `additional_data`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cc_exp_month` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cc_exp_month` AS string)), '') AS string) END as string)
 AS `cc_exp_month`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cc_ss_start_year` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cc_ss_start_year` AS string)), '') AS string) END as string)
 AS `cc_ss_start_year`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`echeck_bank_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`echeck_bank_name` AS string)), '') AS string) END as string)
 AS `echeck_bank_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`method` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`method` AS string)), '') AS string) END as string)
 AS `method`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cc_debug_request_body` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cc_debug_request_body` AS string)), '') AS string) END as string)
 AS `cc_debug_request_body`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cc_secure_verify` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cc_secure_verify` AS string)), '') AS string) END as string)
 AS `cc_secure_verify`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`protection_eligibility` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`protection_eligibility` AS string)), '') AS string) END as string)
 AS `protection_eligibility`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cc_approval` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cc_approval` AS string)), '') AS string) END as string)
 AS `cc_approval`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cc_last4` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cc_last4` AS string)), '') AS string) END as string)
 AS `cc_last4`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cc_status_description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cc_status_description` AS string)), '') AS string) END as string)
 AS `cc_status_description`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`echeck_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`echeck_type` AS string)), '') AS string) END as string)
 AS `echeck_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cc_debug_response_serialized` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cc_debug_response_serialized` AS string)), '') AS string) END as string)
 AS `cc_debug_response_serialized`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cc_ss_start_month` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cc_ss_start_month` AS string)), '') AS string) END as string)
 AS `cc_ss_start_month`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`echeck_account_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`echeck_account_type` AS string)), '') AS string) END as string)
 AS `echeck_account_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`last_trans_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`last_trans_id` AS string)), '') AS string) END as string)
 AS `last_trans_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cc_cid_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cc_cid_status` AS string)), '') AS string) END as string)
 AS `cc_cid_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cc_owner` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cc_owner` AS string)), '') AS string) END as string)
 AS `cc_owner`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cc_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cc_type` AS string)), '') AS string) END as string)
 AS `cc_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`po_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`po_number` AS string)), '') AS string) END as string)
 AS `po_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cc_exp_year` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cc_exp_year` AS string)), '') AS string) END as string)
 AS `cc_exp_year`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cc_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cc_status` AS string)), '') AS string) END as string)
 AS `cc_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`echeck_routing_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`echeck_routing_number` AS string)), '') AS string) END as string)
 AS `echeck_routing_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`account_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`account_status` AS string)), '') AS string) END as string)
 AS `account_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`anet_trans_method` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`anet_trans_method` AS string)), '') AS string) END as string)
 AS `anet_trans_method`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cc_debug_response_body` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cc_debug_response_body` AS string)), '') AS string) END as string)
 AS `cc_debug_response_body`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cc_ss_issue` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cc_ss_issue` AS string)), '') AS string) END as string)
 AS `cc_ss_issue`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`echeck_account_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`echeck_account_name` AS string)), '') AS string) END as string)
 AS `echeck_account_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cc_avs_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cc_avs_status` AS string)), '') AS string) END as string)
 AS `cc_avs_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cc_number_enc` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cc_number_enc` AS string)), '') AS string) END as string)
 AS `cc_number_enc`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cc_trans_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cc_trans_id` AS string)), '') AS string) END as string)
 AS `cc_trans_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`paybox_request_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`paybox_request_number` AS string)), '') AS string) END as string)
 AS `paybox_request_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`address_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`address_status` AS string)), '') AS string) END as string)
 AS `address_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`additional_information` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`additional_information` AS string)), '') AS string) END as string)
 AS `additional_information`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`litle_vault_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`litle_vault_id` AS string)), '') AS string) END as string)
 AS `litle_vault_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`channel` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`channel` AS string)), '') AS string) END as string)
 AS `channel`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`



FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_order_payment` AS source_table

 ) AS un_ordered

