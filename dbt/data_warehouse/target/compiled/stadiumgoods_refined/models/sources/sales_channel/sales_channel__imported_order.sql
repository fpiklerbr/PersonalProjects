

















 

SELECT   `imported_order_id`,  `sales_flat_order_id`,  `channel_order_id`,  `payload`,  `transaction_id`,  `imported_order_location`,  `mercaux_order_id`,  `state`,  `pushed_at`,  `failed_at`,  `acknowledged_at`,  `created_at`,  `channel`,  `awaiting_at`,  `_synched_from_source_at`,  `retry_attempts`,  `retried_at`,  `failed_reason`
  FROM ( SELECT
    *

  , 
    safe_cast(nullif(trim(_raw_payload_psp), '') as string)
 AS `transaction_id` 

 

FROM ( 

SELECT
    *

  , (JSON_EXTRACT_SCALAR(payload, '$.psp'
  ))
 AS `_raw_payload_psp`
  , (JSON_EXTRACT_SCALAR(payload, '$.location'
  ))
 AS `imported_order_location`
  , 
    safe_cast(
    safe_cast(JSON_EXTRACT_SCALAR(payload, '$.mercauxOrderId'
  ) as float64)
 as int64)
 AS `mercaux_order_id` 
FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `imported_order_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`magento_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`magento_order_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sales_flat_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`channel_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`channel_order_id` AS string)), '') AS string) END as string)
 AS `channel_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payload` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payload` AS string)), '') AS string) END as string)
 AS `payload`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`state` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`state` AS string)), '') AS string) END as string)
 AS `state`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pushed_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pushed_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `pushed_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`failed_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`failed_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `failed_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`acknowledged_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`acknowledged_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `acknowledged_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`channel` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`channel` AS string)), '') AS string) END as string)
 AS `channel`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`awaiting_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`awaiting_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `awaiting_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`retry_attempts` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`retry_attempts` AS string)), '') AS string) END as float64)
 as int64)
 AS `retry_attempts`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`retried_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`retried_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `retried_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`failed_reason` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`failed_reason` AS string)), '') AS string) END as string)
 AS `failed_reason`



FROM `ff-stadiumgoods-raw-live`.`sales_channel`.`imported_order` AS source_table

 ) AS source_and_sql_select_statement

 ) AS macro_statement

 ) AS un_ordered

