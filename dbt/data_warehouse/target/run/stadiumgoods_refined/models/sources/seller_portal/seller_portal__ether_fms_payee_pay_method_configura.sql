

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_fms_payee_pay_method_configurations`
  OPTIONS()
  as 



    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_fms_payee_pay_method_configuration_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payee_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payee_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_fms_payee_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pay_method` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pay_method` AS string)), '') AS string) END as float64)
 as int64)
 AS `pay_method_code`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`effective_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`effective_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `effective_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`terminate_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`terminate_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `terminate_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`configuration` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`configuration` AS string)), '') AS string) END as string)
 AS `configuration`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`third_party_identifier` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`third_party_identifier` AS string)), '') AS string) END as string)
 AS `third_party_identifier`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`third_party_activated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`third_party_activated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `third_party_activated_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
  , `balance_cents` AS `_raw_balance_cents`
  , `balance_updated_at` AS `_raw_balance_updated_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_fms_payee_pay_method_configurations`

WHERE 1=1
                 ) , layer_2 AS ( 
                    SELECT
    *
  , 
    CASE pay_method_code
WHEN 0 THEN cast( 'Legacy' AS string)
WHEN 1 THEN cast( 'Hyperwallet' AS string)
ELSE cast(pay_method_code AS string)
END AS `pay_method`
  , 
    (JSON_EXTRACT_SCALAR(configuration, '$.status'
  ))
 AS `configuration_status`
  , 
    (JSON_EXTRACT_SCALAR(configuration, '$.user_token'
  ))
 AS `user_token`
FROM layer_0
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `ether_fms_payee_pay_method_configuration_id` AS `ether_fms_payee_pay_method_configuration_id`
  , `ether_fms_payee_id` AS `ether_fms_payee_id`
  , `pay_method` AS `pay_method`
  , `effective_at` AS `effective_at`
  , `terminate_at` AS `terminate_at`
  , `configuration` AS `configuration`
  , `configuration_status` AS `configuration_status`
  , `user_token` AS `user_token`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `third_party_identifier` AS `third_party_identifier`
  , `third_party_activated_at` AS `third_party_activated_at`
  , `_synched_from_source_at` AS `_synched_from_source_at`
  , `_raw_balance_cents` AS `_raw_balance_cents`
  , `_raw_balance_updated_at` AS `_raw_balance_updated_at`
FROM layer_2
WHERE 1=1
                     ) SELECT * FROM final ;

