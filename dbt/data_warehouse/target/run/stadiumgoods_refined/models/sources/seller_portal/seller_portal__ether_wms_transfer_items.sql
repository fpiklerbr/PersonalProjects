

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_transfer_items`
  OPTIONS()
  as 



    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_transfer_item_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transfer_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transfer_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_transfer_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`inventory_unit_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`inventory_unit_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_inventory_unit_id`
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
END AS `transfer_item_status`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`locked_for_x3_update_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`locked_for_x3_update_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `locked_for_x3_update_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`error_messages` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`error_messages` AS string)), '') AS string) END as string)
 AS `error_messages`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`receipt_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`receipt_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_transfer_receipt_id`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`scanned_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`scanned_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `scanned_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_number` AS string)), '') AS string) END as float64)
 as int64)
 AS `transfer_item_line_number`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `_synched_from_source_at`
  , `label_number` AS `_raw_label_number`
  , `destination_bin_name` AS `_raw_destination_bin_name`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_transfer_items`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `ether_wms_transfer_item_id` AS `ether_wms_transfer_item_id`
  , `ether_wms_transfer_id` AS `ether_wms_transfer_id`
  , `ether_wms_inventory_unit_id` AS `ether_wms_inventory_unit_id`
  , `transfer_item_status` AS `transfer_item_status`
  , `locked_for_x3_update_at` AS `locked_for_x3_update_at`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `error_messages` AS `error_messages`
  , `ether_wms_transfer_receipt_id` AS `ether_wms_transfer_receipt_id`
  , `scanned_at` AS `scanned_at`
  , `transfer_item_line_number` AS `transfer_item_line_number`
  , `_synched_from_source_at` AS `_synched_from_source_at`
  , `_raw_label_number` AS `_raw_label_number`
  , `_raw_destination_bin_name` AS `_raw_destination_bin_name`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final ;

