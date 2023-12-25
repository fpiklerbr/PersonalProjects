

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_transfers`
  OPTIONS()
  as 



    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_transfer_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`employee_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`employee_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `employee_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`origin_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`origin_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `origin_ether_wms_warehouse_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`destination_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`destination_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `destination_ether_wms_warehouse_id`
  , 

    CASE 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as float64)
 as int64)

WHEN 0 THEN cast( 'Pending' AS string)
WHEN 1 THEN cast( 'Ready To Pick' AS string)
WHEN 2 THEN cast( 'Pending X3 Finalization' AS string)
WHEN 3 THEN cast( 'Failed X3 Finalization' AS string)
WHEN 4 THEN cast( 'Shipped' AS string)
WHEN 5 THEN cast( 'Closed' AS string)
WHEN 6 THEN cast( 'Failed X3 Creation' AS string)
WHEN 7 THEN cast( 'Cancelled' AS string)
WHEN 8 THEN cast( 'Requested Ship' AS string)
WHEN 9 THEN cast( 'Partially Shipped' AS string)
WHEN 10 THEN cast( 'Cancellation Requested' AS string)
WHEN 11 THEN cast( 'Requested X3 Ship' AS string)
WHEN 12 THEN cast( 'Failed X3 Shipment' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END AS string)
END AS `transfer_status`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`
  , 

    CASE 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transfer_reason` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transfer_reason` AS string)), '') AS string) END as float64)
 as int64)

WHEN 0 THEN cast( 'Replenishment/Other' AS string)
WHEN 1 THEN cast( 'Withdrawal/RTC' AS string)
WHEN 2 THEN cast( 'Damage/RTV' AS string)
WHEN 3 THEN cast( 'Photos' AS string)
WHEN 4 THEN cast( 'Quality Inspection' AS string)
WHEN 5 THEN cast( 'Re-serializing' AS string)
WHEN 6 THEN cast( 'Zero-Out Request' AS string)
WHEN 7 THEN cast( 'Off-Site Product Loan Hold' AS string)
WHEN 8 THEN cast( 'Vip Client Hold' AS string)
WHEN 9 THEN cast( 'Special Project' AS string)
WHEN 10 THEN cast( 'New Intake' AS string)
WHEN 11 THEN cast( 'Inventory Reconciliation' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`transfer_reason` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transfer_reason` AS string)), '') AS string) END AS string)
END AS `transfer_reason`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) END as float64)
 as int64)
 AS `lock_version`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transfer_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transfer_number` AS string)), '') AS string) END as string)
 AS `transfer_number`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`locked_for_x3_update_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`locked_for_x3_update_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `locked_for_x3_update_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`error_messages` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`error_messages` AS string)), '') AS string) END as string)
 AS `error_messages`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`uuid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`uuid` AS string)), '') AS string) END as string)
 AS `uuid`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`items_count` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`items_count` AS string)), '') AS string) END as float64)
 as int64)
 AS `total_qty`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_number` AS string)), '') AS string) END as string)
 AS `shipment_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`note` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`note` AS string)), '') AS string) END as string)
 AS `note`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipped_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipped_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `shipped_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`picking_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`picking_number` AS string)), '') AS string) END as string)
 AS `picking_number`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`box_count` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`box_count` AS string)), '') AS string) END as float64)
 as int64)
 AS `box_count`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`ignore_x3_shipment_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ignore_x3_shipment_number` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`ignore_x3_shipment_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ignore_x3_shipment_number` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `x3_shipment_number_is_ignored`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`export_third_party_order_file` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`export_third_party_order_file` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`export_third_party_order_file` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`export_third_party_order_file` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `exported_to_third_party_order_file`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`digital` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`digital` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`digital` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`digital` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `is_digital`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`ship_to_destination` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_to_destination` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`ship_to_destination` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_to_destination` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `is_shipped_to_destination`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`first_party` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`first_party` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`first_party` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`first_party` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `is_first_party`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `_synched_from_source_at`
  , `rss_fulfillment` AS `_raw_rss_fulfillment`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_transfers`

WHERE 1=1
                 ) , layer_2 AS ( 
                    SELECT
    *
  , 
    safe_cast(datetime(safe_cast(shipped_at AS timestamp), 'America/New_York') AS date) AS `ship_date`
FROM layer_0
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `ether_wms_transfer_id` AS `ether_wms_transfer_id`
  , `employee_id` AS `employee_id`
  , `origin_ether_wms_warehouse_id` AS `origin_ether_wms_warehouse_id`
  , `destination_ether_wms_warehouse_id` AS `destination_ether_wms_warehouse_id`
  , `transfer_status` AS `transfer_status`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `transfer_reason` AS `transfer_reason`
  , `lock_version` AS `lock_version`
  , `transfer_number` AS `transfer_number`
  , `locked_for_x3_update_at` AS `locked_for_x3_update_at`
  , `error_messages` AS `error_messages`
  , `uuid` AS `uuid`
  , `total_qty` AS `total_qty`
  , `shipment_number` AS `shipment_number`
  , `note` AS `note`
  , `shipped_at` AS `shipped_at`
  , `ship_date` AS `ship_date`
  , `picking_number` AS `picking_number`
  , `box_count` AS `box_count`
  , `x3_shipment_number_is_ignored` AS `x3_shipment_number_is_ignored`
  , `exported_to_third_party_order_file` AS `exported_to_third_party_order_file`
  , `is_digital` AS `is_digital`
  , `is_shipped_to_destination` AS `is_shipped_to_destination`
  , `is_first_party` AS `is_first_party`
  , `_synched_from_source_at` AS `_synched_from_source_at`
  , `_raw_rss_fulfillment` AS `_raw_rss_fulfillment`
FROM layer_2
WHERE 1=1
                     ) SELECT * FROM final ;

