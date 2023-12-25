

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_fulfillments`
  OPTIONS()
  as 

    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_fulfillment_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_number` AS string)), '') AS string) END as string)
 AS `fulfillment_order_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`source_order_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`source_order_number` AS string)), '') AS string) END as string)
 AS `fulfillment_source_order_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sales_channel_order_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sales_channel_order_number` AS string)), '') AS string) END as string)
 AS `sales_channel_order_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ecommerce_order_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ecommerce_order_number` AS string)), '') AS string) END as string)
 AS `ecommerce_order_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ecommerce_order_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ecommerce_order_status` AS string)), '') AS string) END as string)
 AS `ecommerce_order_status`
  , 

    CASE 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as float64)
 as int64)

WHEN 0 THEN cast( 'pending' AS string)
WHEN 1 THEN cast( 'fulfilled' AS string)
WHEN 2 THEN cast( 'cancelled' AS string)
WHEN 3 THEN cast( 'requested' AS string)
WHEN 4 THEN cast( 'failed' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END AS string)
END AS `fulfillment_status`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`warehouse_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`warehouse_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_warehouse_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`delivery_method_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`delivery_method_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_oms_delivery_method_id`
  , 

    CASE 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`delivery_strategy` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`delivery_strategy` AS string)), '') AS string) END as float64)
 as int64)

WHEN 0 THEN cast( 'fps' AS string)
WHEN 1 THEN cast( 'shippo' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`delivery_strategy` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`delivery_strategy` AS string)), '') AS string) END AS string)
END AS `delivery_strategy`
  , 

    CASE 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`channel` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`channel` AS string)), '') AS string) END as float64)
 as int64)

WHEN 0 THEN cast( 'stadium_goods' AS string)
WHEN 1 THEN cast( 'dss' AS string)
WHEN 2 THEN cast( 'capacity' AS string)
WHEN 3 THEN cast( 'source' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`channel` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`channel` AS string)), '') AS string) END AS string)
END AS `fulfillment_channel`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`source_created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`source_created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `source_created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`source_updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`source_updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `source_updated_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sla_deadline` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sla_deadline` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `sla_deadline`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`started_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`started_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `started_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fulfilled_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fulfilled_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `fulfilled_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cancelled_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cancelled_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `cancelled_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`blocked_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`blocked_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `blocked_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`hazardous` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`hazardous` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`hazardous` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`hazardous` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `is_hazardous`
  , 

    CASE 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_type` AS string)), '') AS string) END as string)

WHEN 'customer_order' THEN cast( 'customer_order' AS string)
WHEN 'withdrawal_order' THEN cast( 'withdrawal_order' AS string)
WHEN 'source' THEN cast( 'source_order' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`order_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_type` AS string)), '') AS string) END AS string)
END AS `fulfillment_order_type`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_name` AS string)), '') AS string) END as string)
 AS `bill_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_address1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_address1` AS string)), '') AS string) END as string)
 AS `bill_address1`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_address2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_address2` AS string)), '') AS string) END as string)
 AS `bill_address2`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_city` AS string)), '') AS string) END as string)
 AS `bill_city`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_region_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_region_code` AS string)), '') AS string) END as string)
 AS `bill_region_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_postal` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_postal` AS string)), '') AS string) END as string)
 AS `bill_postal`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_name` AS string)), '') AS string) END as string)
 AS `ship_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_phone` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_phone` AS string)), '') AS string) END as string)
 AS `ship_phone`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_address1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_address1` AS string)), '') AS string) END as string)
 AS `ship_address1`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_address2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_address2` AS string)), '') AS string) END as string)
 AS `ship_address2`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_city` AS string)), '') AS string) END as string)
 AS `ship_city`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_region_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_region_code` AS string)), '') AS string) END as string)
 AS `ship_region_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_postal` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_postal` AS string)), '') AS string) END as string)
 AS `ship_postal`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_region_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_region_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ship_region_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_region_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_region_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `bill_region_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_country_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_country_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ship_country_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_country_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_country_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `bill_country_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`number` AS string)), '') AS string) END as string)
 AS `fulfillment_number`
  , CAST(NULL AS boolean) AS `is_on_hold`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lp_order_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lp_order_code` AS string)), '') AS string) END as string)
 AS `lp_order_code`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`carrier_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`carrier_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_carrier_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_email` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_email` AS string)), '') AS string) END as string)
 AS `recipient_email`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) END as float64)
 as int64)
 AS `lock_version`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sales_channel_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sales_channel_code` AS string)), '') AS string) END as string)
 AS `sales_channel_code`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`locked_for_x3_update_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`locked_for_x3_update_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `locked_for_x3_update_at`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_vip` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_vip` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_vip` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_vip` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `is_vip`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
  , `exported_to_warehouse_at` AS `_raw_exported_to_warehouse_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_fulfillments`

WHERE 1=1
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast(CASE WHEN fulfillment_order_type = 'customer_order' THEN fulfillment_order_number END as string)
 AS `ether_order_number`
  , 
    safe_cast(CASE WHEN fulfillment_order_type = 'source_order' THEN fulfillment_order_number END as string)
 AS `source_bundle_number`
  , 
    safe_cast(CASE WHEN fulfillment_order_type = 'withdrawal_order' THEN fulfillment_order_number END as string)
 AS `ether_withdrawal_number`
  , 
    safe_cast(CASE
WHEN fulfillment_order_type = 'customer_order' AND fulfillment_channel <> 'dss' THEN fulfillment_number
WHEN fulfillment_order_type = 'source_order' THEN fulfillment_source_order_number
END as string)
 AS `x3_order_id`
FROM layer_0
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `ether_wms_fulfillment_id` AS `ether_wms_fulfillment_id`
  , `fulfillment_order_number` AS `fulfillment_order_number`
  , `ether_order_number` AS `ether_order_number`
  , `source_bundle_number` AS `source_bundle_number`
  , `ether_withdrawal_number` AS `ether_withdrawal_number`
  , `fulfillment_source_order_number` AS `fulfillment_source_order_number`
  , `x3_order_id` AS `x3_order_id`
  , `fulfillment_status` AS `fulfillment_status`
  , `ether_wms_warehouse_id` AS `ether_wms_warehouse_id`
  , `ether_oms_delivery_method_id` AS `ether_oms_delivery_method_id`
  , `delivery_strategy` AS `delivery_strategy`
  , `fulfillment_channel` AS `fulfillment_channel`
  , `sla_deadline` AS `sla_deadline`
  , `started_at` AS `started_at`
  , `fulfilled_at` AS `fulfilled_at`
  , `cancelled_at` AS `cancelled_at`
  , `blocked_at` AS `blocked_at`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `is_hazardous` AS `is_hazardous`
  , `fulfillment_order_type` AS `fulfillment_order_type`
  , `bill_name` AS `bill_name`
  , `bill_address1` AS `bill_address1`
  , `bill_address2` AS `bill_address2`
  , `bill_city` AS `bill_city`
  , `bill_region_code` AS `bill_region_code`
  , `bill_postal` AS `bill_postal`
  , `ship_name` AS `ship_name`
  , `ship_phone` AS `ship_phone`
  , `ship_address1` AS `ship_address1`
  , `ship_address2` AS `ship_address2`
  , `ship_city` AS `ship_city`
  , `ship_region_code` AS `ship_region_code`
  , `ship_postal` AS `ship_postal`
  , `ship_region_id` AS `ship_region_id`
  , `bill_region_id` AS `bill_region_id`
  , `ship_country_id` AS `ship_country_id`
  , `bill_country_id` AS `bill_country_id`
  , `fulfillment_number` AS `fulfillment_number`
  , `is_on_hold` AS `is_on_hold`
  , `lp_order_code` AS `lp_order_code`
  , `ether_wms_carrier_id` AS `ether_wms_carrier_id`
  , `recipient_email` AS `recipient_email`
  , `lock_version` AS `lock_version`
  , `sales_channel_code` AS `sales_channel_code`
  , `locked_for_x3_update_at` AS `locked_for_x3_update_at`
  , `is_vip` AS `is_vip`
  , `_synched_from_source_at` AS `_synched_from_source_at`
  , `_raw_exported_to_warehouse_at` AS `_raw_exported_to_warehouse_at`
FROM layer_1
WHERE 1=1
                     ) SELECT * FROM final ;

