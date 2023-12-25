

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_oms_rma_items`
  OPTIONS()
  as 



    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_oms_rma_item_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rma_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rma_number` AS string)), '') AS string) END as float64)
 as int64)
 AS `rma_number`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_item_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_item_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_oms_order_item_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sgp` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sgp` AS string)), '') AS string) END as string)
 AS `product_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`manufacturer_sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`manufacturer_sku` AS string)), '') AS string) END as string)
 AS `mfg_sku`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`size_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`size_code` AS string)), '') AS string) END as string)
 AS `size_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`serial_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`serial_number` AS string)), '') AS string) END as string)
 AS `serial_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as string)
 AS `rma_item_status`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`return_reason` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`return_reason` AS string)), '') AS string) END as string)
 AS `return_reason`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`return_condition` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`return_condition` AS string)), '') AS string) END as string)
 AS `return_condition`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`resolved_by_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`resolved_by_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `resolved_by_employee_id`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`resolved_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`resolved_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `resolved_at`
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
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_rma_items`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `ether_oms_rma_item_id` AS `ether_oms_rma_item_id`
  , `rma_number` AS `rma_number`
  , `ether_oms_order_item_id` AS `ether_oms_order_item_id`
  , `product_number` AS `product_number`
  , `mfg_sku` AS `mfg_sku`
  , `size_code` AS `size_code`
  , `serial_number` AS `serial_number`
  , `rma_item_status` AS `rma_item_status`
  , `return_reason` AS `return_reason`
  , `return_condition` AS `return_condition`
  , `resolved_by_employee_id` AS `resolved_by_employee_id`
  , `resolved_at` AS `resolved_at`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `_synched_from_source_at` AS `_synched_from_source_at`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final ;

