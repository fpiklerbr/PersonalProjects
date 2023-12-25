



    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_transfer_receipt_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`receipt_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`receipt_number` AS string)), '') AS string) END as string)
 AS `receipt_number`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`employee_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`employee_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `employee_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transfer_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transfer_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_transfer_id`
  , 

    CASE 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as float64)
 as int64)

WHEN 0 THEN cast( 'Pending' AS string)
WHEN 1 THEN cast( 'Reserved' AS string)
WHEN 2 THEN cast( 'Rejected' AS string)
WHEN 3 THEN cast( 'Pending Removal' AS string)
WHEN 4 THEN cast( 'Removed When Pending' AS string)
WHEN 5 THEN cast( 'Removed When Picking' AS string)
WHEN 6 THEN cast( 'Picked' AS string)
WHEN 7 THEN cast( 'Received' AS string)
WHEN 8 THEN cast( 'Removed When Receiving' AS string)
WHEN 9 THEN cast( 'Pending Receipt' AS string)
WHEN 10 THEN cast( 'Failed To Add' AS string)
WHEN 11 THEN cast( 'Requested Removal When Receiving' AS string)
WHEN 12 THEN cast( 'Not Sent' AS string)
WHEN 13 THEN cast( 'Requested 3pl Ship' AS string)
WHEN 14 THEN cast( 'Cancelled' AS string)
WHEN 15 THEN cast( 'Marking As Missing' AS string)
WHEN 16 THEN cast( 'Marking As Not Sent' AS string)
WHEN 17 THEN cast( 'Not In Shipment' AS string)
WHEN 18 THEN cast( 'Missing' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END AS string)
END AS `transfer_receipt_status`
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

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `_synched_from_source_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_transfer_receipts`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `ether_wms_transfer_receipt_id` AS `ether_wms_transfer_receipt_id`
  , `receipt_number` AS `receipt_number`
  , `employee_id` AS `employee_id`
  , `ether_wms_transfer_id` AS `ether_wms_transfer_id`
  , `transfer_receipt_status` AS `transfer_receipt_status`
  , `submitted_at` AS `submitted_at`
  , `closed_at` AS `closed_at`
  , `locked_for_x3_update_at` AS `locked_for_x3_update_at`
  , `lock_version` AS `lock_version`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `_synched_from_source_at` AS `_synched_from_source_at`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final 