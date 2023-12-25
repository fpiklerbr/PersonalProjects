












 

SELECT   `ether_oms_reallocation_id`,  `employee_id`,  `parent_ether_oms_order_item_id`,  `child_ether_oms_order_item_id`,  `reallocation_status`,  `reallocation_reason`,  `serial_number`,  `price`,  `created_at`,  `updated_at`,  `_synched_from_source_at`
  FROM ( 

SELECT
    *

  , CASE reallocation_status_code
WHEN 0 THEN cast( 'Requested' AS string)
WHEN 1 THEN cast( 'Processing' AS string)
WHEN 2 THEN cast( 'Successful' AS string)
WHEN 3 THEN cast( 'Failed' AS string)
ELSE cast(reallocation_status_code AS string)
END AS `reallocation_status`
  , CASE reallocation_reason_code
WHEN 0 THEN cast( 'Already Shipped' AS string)
WHEN 1 THEN cast( 'Sold Elsewhere' AS string)
WHEN 2 THEN cast( 'Missing' AS string)
WHEN 3 THEN cast( 'Auto Reallocation' AS string)
WHEN 4 THEN cast( 'Damaged' AS string)
WHEN 5 THEN cast( 'Conditional' AS string)
WHEN 6 THEN cast( 'Double Sold' AS string)
WHEN 7 THEN cast( 'Swap' AS string)
WHEN 8 THEN cast( 'Dummy Reallocation' AS string)
ELSE cast(reallocation_reason_code AS string)
END AS `reallocation_reason` 
FROM ( 

SELECT
    *

  , 
    safe_cast(_raw_price_cents / 100 as numeric)
 AS `price` 
FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_oms_reallocation_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`employee_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`employee_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `employee_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `parent_ether_oms_order_item_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reallocated_item_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reallocated_item_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `child_ether_oms_order_item_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as float64)
 as int64)
 AS `reallocation_status_code`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reason` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reason` AS string)), '') AS string) END as float64)
 as int64)
 AS `reallocation_reason_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`serial_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`serial_number` AS string)), '') AS string) END as string)
 AS `serial_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price_cents` AS string)), '') AS string) END as numeric)
 AS `_raw_price_cents`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`



FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_reallocations` AS source_table

 ) AS source_select_statement

 ) AS source_and_sql_select_statement

 ) AS un_ordered

