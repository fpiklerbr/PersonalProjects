



    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_allocation_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`inventory_unit_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`inventory_unit_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_inventory_unit_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_item_line_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_item_line_number` AS string)), '') AS string) END as float64)
 as int64)
 AS `allocation_line_number`
  , 

    CASE 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as float64)
 as int64)

WHEN 0 THEN cast( 'requested' AS string)
WHEN 1 THEN cast( 'processing' AS string)
WHEN 2 THEN cast( 'allocated' AS string)
WHEN 3 THEN cast( 'failed' AS string)
WHEN 4 THEN cast( 'cancelled' AS string)
WHEN 5 THEN cast( 'shortage' AS string)
WHEN 6 THEN cast( 'shipped' AS string)
WHEN 7 THEN cast( 'dummy' AS string)
WHEN 8 THEN cast( 'reserved' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END AS string)
END AS `allocation_status`
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

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`source_identifier` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`source_identifier` AS string)), '') AS string) END as string)
 AS `source_identifier`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`source_created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`source_created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `source_created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`source_updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`source_updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `source_updated_at`
  , 

    CASE 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reallocation_reason` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reallocation_reason` AS string)), '') AS string) END as float64)
 as int64)

WHEN 0 THEN cast( 'already_shipped' AS string)
WHEN 1 THEN cast( 'sold_elsewhere' AS string)
WHEN 2 THEN cast( 'missing' AS string)
WHEN 3 THEN cast( 'damaged' AS string)
WHEN 4 THEN cast( 'conditional' AS string)
WHEN 5 THEN cast( 'auto_reallocation' AS string)
WHEN 6 THEN cast( 'double_sold' AS string)
WHEN 7 THEN cast( 'swap' AS string)
WHEN 8 THEN cast( 'dummy_allocation' AS string)
WHEN 9 THEN cast( 'item_in_transit' AS string)
WHEN 10 THEN cast( 'withdrawn' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`reallocation_reason` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reallocation_reason` AS string)), '') AS string) END AS string)
END AS `reallocation_reason`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`source_line_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`source_line_number` AS string)), '') AS string) END as float64)
 as int64)
 AS `allocation_source_line_number`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`previous_allocation_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`previous_allocation_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `previous_ether_wms_allocation_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fulfillment_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fulfillment_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_fulfillment_id`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`hazardous` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`hazardous` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`hazardous` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`hazardous` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `is_hazardous`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`employee_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`employee_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `employee_id`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `price_base_amount`
  , CAST(NULL AS int64) AS `ether_oms_reallocation_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`variant_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`variant_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_product_variant_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`initial_allocation_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`initial_allocation_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `initial_allocation_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`failure_reason` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`failure_reason` AS string)), '') AS string) END as string)
 AS `failure_reason`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`number` AS string)), '') AS string) END as string)
 AS `ether_allocation_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_allocations`

WHERE 1=1
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast(CASE
WHEN allocation_status IN ('shipped', 'allocated') THEN 'valid'
WHEN allocation_status IN ('dummy', 'shortage', 'reserved') THEN 'active'
WHEN allocation_status IN ('requested', 'processing') THEN 'pending'
WHEN allocation_status IN ('failed', 'cancelled') THEN 'invalid'
END as string)
 AS `allocation_state`
  , 
    safe_cast(coalesce(initial_allocation_id, ether_wms_allocation_id) as int64)
 AS `initial_ether_wms_allocation_id`
FROM layer_0
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `ether_wms_allocation_id` AS `ether_wms_allocation_id`
  , `ether_wms_inventory_unit_id` AS `ether_wms_inventory_unit_id`
  , `allocation_line_number` AS `allocation_line_number`
  , `allocation_status` AS `allocation_status`
  , `allocation_state` AS `allocation_state`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `lock_version` AS `lock_version`
  , `reallocation_reason` AS `reallocation_reason`
  , `allocation_source_line_number` AS `allocation_source_line_number`
  , `previous_ether_wms_allocation_id` AS `previous_ether_wms_allocation_id`
  , `ether_wms_fulfillment_id` AS `ether_wms_fulfillment_id`
  , `is_hazardous` AS `is_hazardous`
  , `employee_id` AS `employee_id`
  , `price_base_amount` AS `price_base_amount`
  , `ether_wms_product_variant_id` AS `ether_wms_product_variant_id`
  , `initial_ether_wms_allocation_id` AS `initial_ether_wms_allocation_id`
  , `failure_reason` AS `failure_reason`
  , `ether_allocation_number` AS `ether_allocation_number`
  , `_synched_from_source_at` AS `_synched_from_source_at`
FROM layer_1
WHERE 1=1
                     ) SELECT * FROM final 