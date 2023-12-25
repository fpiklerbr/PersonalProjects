



    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_fms_payout_payment_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`request_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`request_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_fms_payout_request_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`employee_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`employee_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `employee_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`employee_ip_address` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`employee_ip_address` AS string)), '') AS string) END as string)
 AS `employee_ip_address`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`third_party_identifier` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`third_party_identifier` AS string)), '') AS string) END as string)
 AS `third_party_identifier`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as string)
 AS `payment_status`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`submitted_to_provider_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`submitted_to_provider_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `submitted_to_provider_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pay_method_configuration_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pay_method_configuration_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_fms_payee_pay_method_configuration_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`token` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`token` AS string)), '') AS string) END as string)
 AS `payment_token`
  , `_synched_from_source_at` AS `_raw__synched_from_source_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_fms_payout_payments`

WHERE 1=1
                 ) , layer_2 AS ( 
                    SELECT
    *
  , 
    safe_cast(datetime(safe_cast(submitted_to_provider_at AS timestamp), 'America/New_York') AS date) AS `payout_date`
FROM layer_0
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `ether_fms_payout_payment_id` AS `ether_fms_payout_payment_id`
  , `ether_fms_payout_request_id` AS `ether_fms_payout_request_id`
  , `employee_id` AS `employee_id`
  , `employee_ip_address` AS `employee_ip_address`
  , `third_party_identifier` AS `third_party_identifier`
  , `payment_status` AS `payment_status`
  , `submitted_to_provider_at` AS `submitted_to_provider_at`
  , `payout_date` AS `payout_date`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `ether_fms_payee_pay_method_configuration_id` AS `ether_fms_payee_pay_method_configuration_id`
  , `payment_token` AS `payment_token`
  , `_raw__synched_from_source_at` AS `_raw__synched_from_source_at`
FROM layer_2
WHERE 1=1
                     ) SELECT * FROM final 