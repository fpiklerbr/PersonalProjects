

  




















 

SELECT   `m_rma_item_id`,  `m_rma_id`,  `product_id`,  `sales_flat_order_item_id`,  `order_id`,  `offline_order_name`,  `m_rma_reason_id`,  `m_rma_resolution_id`,  `m_rma_condition_id`,  `qty_requested`,  `qty_returned`,  `created_at`,  `updated_at`,  `name`,  `product_options`,  `to_stock`,  `is_removed`,  `date_received`,  `new_serial_number`
    , `_raw_channel_rma_id`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `m_rma_item_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rma_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rma_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `m_rma_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `product_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_item_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_item_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sales_flat_order_item_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`offline_order_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`offline_order_name` AS string)), '') AS string) END as string)
 AS `offline_order_name`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reason_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reason_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `m_rma_reason_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`resolution_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`resolution_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `m_rma_resolution_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`condition_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`condition_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `m_rma_condition_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qty_requested` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qty_requested` AS string)), '') AS string) END as float64)
 as int64)
 AS `qty_requested`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qty_returned` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qty_returned` AS string)), '') AS string) END as float64)
 as int64)
 AS `qty_returned`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`name` AS string)), '') AS string) END as string)
 AS `name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_options` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_options` AS string)), '') AS string) END as string)
 AS `product_options`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`to_stock` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`to_stock` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`to_stock` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`to_stock` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `to_stock`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_removed` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_removed` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_removed` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_removed` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `is_removed`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`date_received` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`date_received` AS string)), '') AS string) END as timestamp)
 as date)
 AS `date_received`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`new_serial_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`new_serial_number` AS string)), '') AS string) END as string)
 AS `new_serial_number`


  , `channel_rma_id` AS `_raw_channel_rma_id`

  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_item` AS source_table

 ) AS un_ordered

