

  

















































 

SELECT   `company_account`,  `merchant_account`,  `psp_reference`,  `merchant_reference`,  `payment_method`,  `payment_method_variant`,  `creation_date`,  `time_zone`,  `currency`,  `amount`,  `type`,  `risk_scoring`,  `shopper_interaction`,  `shopper_name`,  `shopper_pan`,  `shopper_ip`,  `shopper_country`,  `issuer_name`,  `issuer_id`,  `issuer_city`,  `issuer_country`,  `acquirer_response`,  `raw_acquirer_response`,  `authorisation_code`,  `shopper_email`,  `shopper_reference`,  `_3_d_directory_response`,  `_3_d_authentication_response`,  `_3_ds_version`,  `a_res_trans_status`,  `r_req_trans_status`,  `cvc2_response`,  `avs_response`,  `billing_street`,  `billing_house_number_name`,  `billing_city`,  `billing_postal_code_zip`,  `billing_state_province`,  `billing_country`,  `delivery_street`,  `delivery_house_number_name`,  `delivery_city`,  `delivery_postal_code_zip`,  `delivery_state_province`,  `delivery_country`,  `acquirer_reference`,  `file_suffix`,  `file_name`,  `file_time`
    , `_raw__html_`
  FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`company_account` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`company_account` AS string)), '') AS string) END as string)
 AS `company_account`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`merchant_account` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`merchant_account` AS string)), '') AS string) END as string)
 AS `merchant_account`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`psp_reference` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`psp_reference` AS string)), '') AS string) END as string)
 AS `psp_reference`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`merchant_reference` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`merchant_reference` AS string)), '') AS string) END as string)
 AS `merchant_reference`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payment_method` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_method` AS string)), '') AS string) END as string)
 AS `payment_method`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payment_method_variant` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_method_variant` AS string)), '') AS string) END as string)
 AS `payment_method_variant`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`creation_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`creation_date` AS string)), '') AS string) END as string)
 AS `creation_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`time_zone` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`time_zone` AS string)), '') AS string) END as string)
 AS `time_zone`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`currency` AS string)), '') AS string) END as string)
 AS `currency`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amount` AS string)), '') AS string) END as string)
 AS `amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`type` AS string)), '') AS string) END as string)
 AS `type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`risk_scoring` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`risk_scoring` AS string)), '') AS string) END as string)
 AS `risk_scoring`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shopper_interaction` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shopper_interaction` AS string)), '') AS string) END as string)
 AS `shopper_interaction`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shopper_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shopper_name` AS string)), '') AS string) END as string)
 AS `shopper_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shopper_pan` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shopper_pan` AS string)), '') AS string) END as string)
 AS `shopper_pan`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shopper_ip` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shopper_ip` AS string)), '') AS string) END as string)
 AS `shopper_ip`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shopper_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shopper_country` AS string)), '') AS string) END as string)
 AS `shopper_country`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`issuer_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`issuer_name` AS string)), '') AS string) END as string)
 AS `issuer_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`issuer_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`issuer_id` AS string)), '') AS string) END as string)
 AS `issuer_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`issuer_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`issuer_city` AS string)), '') AS string) END as string)
 AS `issuer_city`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`issuer_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`issuer_country` AS string)), '') AS string) END as string)
 AS `issuer_country`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`acquirer_response` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`acquirer_response` AS string)), '') AS string) END as string)
 AS `acquirer_response`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`raw_acquirer_response` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`raw_acquirer_response` AS string)), '') AS string) END as string)
 AS `raw_acquirer_response`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`authorisation_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`authorisation_code` AS string)), '') AS string) END as string)
 AS `authorisation_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shopper_email` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shopper_email` AS string)), '') AS string) END as string)
 AS `shopper_email`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shopper_reference` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shopper_reference` AS string)), '') AS string) END as string)
 AS `shopper_reference`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_3_d_directory_response` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_3_d_directory_response` AS string)), '') AS string) END as string)
 AS `_3_d_directory_response`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_3_d_authentication_response` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_3_d_authentication_response` AS string)), '') AS string) END as string)
 AS `_3_d_authentication_response`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_3_ds_version` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_3_ds_version` AS string)), '') AS string) END as string)
 AS `_3_ds_version`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`a_res_trans_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`a_res_trans_status` AS string)), '') AS string) END as string)
 AS `a_res_trans_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`r_req_trans_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`r_req_trans_status` AS string)), '') AS string) END as string)
 AS `r_req_trans_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cvc2_response` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cvc2_response` AS string)), '') AS string) END as string)
 AS `cvc2_response`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`avs_response` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`avs_response` AS string)), '') AS string) END as string)
 AS `avs_response`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_street` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_street` AS string)), '') AS string) END as string)
 AS `billing_street`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_house_number_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_house_number_name` AS string)), '') AS string) END as string)
 AS `billing_house_number_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_city` AS string)), '') AS string) END as string)
 AS `billing_city`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_postal_code_zip` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_postal_code_zip` AS string)), '') AS string) END as string)
 AS `billing_postal_code_zip`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_state_province` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_state_province` AS string)), '') AS string) END as string)
 AS `billing_state_province`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_country` AS string)), '') AS string) END as string)
 AS `billing_country`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`delivery_street` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`delivery_street` AS string)), '') AS string) END as string)
 AS `delivery_street`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`delivery_house_number_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`delivery_house_number_name` AS string)), '') AS string) END as string)
 AS `delivery_house_number_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`delivery_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`delivery_city` AS string)), '') AS string) END as string)
 AS `delivery_city`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`delivery_postal_code_zip` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`delivery_postal_code_zip` AS string)), '') AS string) END as string)
 AS `delivery_postal_code_zip`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`delivery_state_province` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`delivery_state_province` AS string)), '') AS string) END as string)
 AS `delivery_state_province`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`delivery_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`delivery_country` AS string)), '') AS string) END as string)
 AS `delivery_country`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`acquirer_reference` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`acquirer_reference` AS string)), '') AS string) END as string)
 AS `acquirer_reference`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_suffix` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_suffix` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `file_suffix`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `file_time`


  , `_html_` AS `_raw__html_`


FROM `ff-stadiumgoods-raw-live`.`imports`.`adyen_received_payments_report` AS source_table

 ) AS un_ordered

