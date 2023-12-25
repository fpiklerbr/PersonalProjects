



    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_shipment_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_by_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_by_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `created_by_employee_id`
  , CAST(NULL AS string) AS `fulfillment_order_number`
  , 

    CASE 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as float64)
 as int64)

WHEN 0 THEN cast( 'pending' AS string)
WHEN 1 THEN cast( 'finalized' AS string)
WHEN 2 THEN cast( 'document_requested' AS string)
WHEN 3 THEN cast( 'document_created' AS string)
WHEN 4 THEN cast( 'shipment_requested' AS string)
WHEN 5 THEN cast( 'shipment_failed' AS string)
WHEN 6 THEN cast( 'shipped' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END AS string)
END AS `shipment_status`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tracking_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tracking_number` AS string)), '') AS string) END as string)
 AS `tracking_number`
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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) END as float64)
 as int64)
 AS `lock_version`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`number` AS string)), '') AS string) END as string)
 AS `shipment_number`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`origin_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`origin_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_warehouse_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tracking_url` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tracking_url` AS string)), '') AS string) END as string)
 AS `tracking_url`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`estimated_delivery_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`estimated_delivery_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `estimated_delivery_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_requested_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_requested_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `shipment_confirmed_at`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`needs_manifest` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`needs_manifest` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`needs_manifest` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`needs_manifest` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `manifest_is_needed`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_manifest_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_manifest_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_shipment_manifest_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_name` AS string)), '') AS string) END as string)
 AS `customer_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`address_line_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`address_line_1` AS string)), '') AS string) END as string)
 AS `address_line_1`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`address_line_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`address_line_2` AS string)), '') AS string) END as string)
 AS `address_line_2`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`city` AS string)), '') AS string) END as string)
 AS `city`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`region_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`region_code` AS string)), '') AS string) END as string)
 AS `region_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`postal_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`postal_code` AS string)), '') AS string) END as string)
 AS `postcode`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`country_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`country_code` AS string)), '') AS string) END as string)
 AS `country_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_phone` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_phone` AS string)), '') AS string) END as string)
 AS `customer_phone`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fulfillment_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fulfillment_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_fulfillment_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
  , `label_status` AS `_raw_label_status`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_shipments`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `ether_wms_shipment_id` AS `ether_wms_shipment_id`
  , `created_by_employee_id` AS `created_by_employee_id`
  , `fulfillment_order_number` AS `fulfillment_order_number`
  , `shipment_status` AS `shipment_status`
  , `tracking_number` AS `tracking_number`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `lock_version` AS `lock_version`
  , `shipment_number` AS `shipment_number`
  , `ether_wms_warehouse_id` AS `ether_wms_warehouse_id`
  , `tracking_url` AS `tracking_url`
  , `estimated_delivery_at` AS `estimated_delivery_at`
  , `shipment_confirmed_at` AS `shipment_confirmed_at`
  , `manifest_is_needed` AS `manifest_is_needed`
  , `ether_wms_shipment_manifest_id` AS `ether_wms_shipment_manifest_id`
  , to_hex(md5(cast(`customer_name` as 
    string
))) AS `customer_name`
  , to_hex(md5(cast(`address_line_1` as 
    string
))) AS `address_line_1`
  , to_hex(md5(cast(`address_line_2` as 
    string
))) AS `address_line_2`
  , `city` AS `city`
  , `region_code` AS `region_code`
  , `postcode` AS `postcode`
  , `country_code` AS `country_code`
  , to_hex(md5(cast(`customer_phone` as 
    string
))) AS `customer_phone`
  , `ether_wms_fulfillment_id` AS `ether_wms_fulfillment_id`
  , `_synched_from_source_at` AS `_synched_from_source_at`
  , `_raw_label_status` AS `_raw_label_status`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final 