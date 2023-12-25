



    
                    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_ledger_event_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`event_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`event_type` AS string)), '') AS string) END as string)
 AS `event_type`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`signature` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`signature` AS string)), '') AS string) END as string)
 AS `signature`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`source_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`source_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `source_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`source_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`source_type` AS string)), '') AS string) END as string)
 AS `source_type`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payload` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payload` AS string)), '') AS string) END as string)
 AS `event_payload`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`timestamp` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`timestamp` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `event_processed_at`
  , 

    CASE 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`state` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`state` AS string)), '') AS string) END as float64)
 as int64)

WHEN 0 THEN cast( 'pending' AS string)
WHEN 1 THEN cast( 'processing' AS string)
WHEN 2 THEN cast( 'processed' AS string)
WHEN 3 THEN cast( 'failed_processing' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`state` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`state` AS string)), '') AS string) END AS string)
END AS `event_state`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_ledger_events`

WHERE 1=1
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast(CASE WHEN source_type = 'Ether::Fms::Accrual::InventoryUnitSold' THEN source_id END as int64)
 AS `ether_fms_accrual_id`
  , 
    safe_cast(CASE WHEN source_type = 'Ether::Fms::ManualAdjustment' THEN source_id END as int64)
 AS `ether_fms_manual_adjustment_id`
  , 
    safe_cast(CASE WHEN source_type = 'Ether::Fms::Payout::Request' THEN source_id END as int64)
 AS `payment_request_id`
FROM layer_0
WHERE 1=1
                     ) , layer_2 AS ( 
                    SELECT
    *
  , 
    safe_cast(datetime(safe_cast(event_processed_at AS timestamp), 'America/New_York') AS date) AS `event_date`
FROM layer_1
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `ether_ledger_event_id` AS `ether_ledger_event_id`
  , `event_type` AS `event_type`
  , `signature` AS `signature`
  , `source_id` AS `source_id`
  , `source_type` AS `source_type`
  , `ether_fms_accrual_id` AS `ether_fms_accrual_id`
  , `ether_fms_manual_adjustment_id` AS `ether_fms_manual_adjustment_id`
  , `payment_request_id` AS `payment_request_id`
  , `event_payload` AS `event_payload`
  , `event_processed_at` AS `event_processed_at`
  , `event_date` AS `event_date`
  , `event_state` AS `event_state`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `_synched_from_source_at` AS `_synched_from_source_at`
FROM layer_2
WHERE 1=1
                     ) SELECT * FROM final 