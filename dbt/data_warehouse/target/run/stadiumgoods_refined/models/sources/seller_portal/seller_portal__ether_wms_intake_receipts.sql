

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_intake_receipts`
  OPTIONS()
  as 



    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_intake_receipt_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ticket_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ticket_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ticket_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`employee_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`employee_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `employee_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`warehouse_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`warehouse_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_warehouse_id`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as string)
 AS `receipt_status`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`submitted_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`submitted_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `submitted_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`closed_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`closed_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `closed_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`locked_for_x3_update_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`locked_for_x3_update_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `locked_for_x3_update_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) END as float64)
 as int64)
 AS `lock_version`
  , 

    CASE 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`delivery_method` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`delivery_method` AS string)), '') AS string) END as float64)
 as int64)

WHEN 0 THEN cast( 'drop_off' AS string)
WHEN 1 THEN cast( 'shipment' AS string)
WHEN 2 THEN cast( 'pickup' AS string)
WHEN 3 THEN cast( 'walk_in' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`delivery_method` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`delivery_method` AS string)), '') AS string) END AS string)
END AS `delivery_method`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`receipt_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`receipt_number` AS string)), '') AS string) END as string)
 AS `intake_receipt`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credit_memo_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credit_memo_status` AS string)), '') AS string) END as string)
 AS `credit_memo_status`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credit_memo_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credit_memo_number` AS string)), '') AS string) END as string)
 AS `credit_memo_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`receipts`

WHERE 1=1
                 ) , layer_2 AS ( 
                    SELECT
    *
  , 
    safe_cast(datetime(safe_cast(CASE WHEN intake_receipt IS NOT NULL THEN coalesce(submitted_at, created_at) END AS timestamp), 'America/New_York') AS date) AS `intake_date`
FROM layer_0
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `ether_wms_intake_receipt_id` AS `ether_wms_intake_receipt_id`
  , `ticket_id` AS `ticket_id`
  , `employee_id` AS `employee_id`
  , `ether_wms_warehouse_id` AS `ether_wms_warehouse_id`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `receipt_status` AS `receipt_status`
  , `submitted_at` AS `submitted_at`
  , `closed_at` AS `closed_at`
  , `locked_for_x3_update_at` AS `locked_for_x3_update_at`
  , `lock_version` AS `lock_version`
  , `delivery_method` AS `delivery_method`
  , `intake_receipt` AS `intake_receipt`
  , `intake_date` AS `intake_date`
  , `credit_memo_status` AS `credit_memo_status`
  , `credit_memo_number` AS `credit_memo_number`
  , `_synched_from_source_at` AS `_synched_from_source_at`
FROM layer_2
WHERE 1=1
                     ) SELECT * FROM final ;

