

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__withdrawal_requests`
  OPTIONS()
  as 


  













 

SELECT   `withdrawal_request_id`,  `user_id`,  `number`,  `withdrawal_request_status_code`,  `withdrawal_request_status`,  `submitted_at`,  `created_at`,  `updated_at`,  `deleted_at`,  `shipment_status`,  `items_count`,  `note`,  `_synched_from_source_at`,  `warehouse`
    , `_raw_reason`
    , `_raw_vendor_withdrawal_request_number`
  FROM ( 

SELECT
    *

  , CASE withdrawal_request_status_code
WHEN 0 THEN cast( 'Pending' AS string)
WHEN 1 THEN cast( 'In Progress' AS string)
WHEN 2 THEN cast( 'Complete' AS string)
ELSE cast(withdrawal_request_status_code AS string)
END AS `withdrawal_request_status` 
FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `withdrawal_request_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`user_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`user_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `user_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`number` AS string)), '') AS string) END as string)
 AS `number`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as float64)
 as int64)
 AS `withdrawal_request_status_code`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`submitted_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`submitted_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `submitted_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`deleted_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`deleted_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `deleted_at`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_status` AS string)), '') AS string) END as float64)
 as int64)
 AS `shipment_status`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`items_count` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`items_count` AS string)), '') AS string) END as float64)
 as int64)
 AS `items_count`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`note` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`note` AS string)), '') AS string) END as string)
 AS `note`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(NULL AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(NULL AS string)), '') AS string) END as string)
 AS `warehouse`


  , `reason` AS `_raw_reason`

  , `vendor_withdrawal_request_number` AS `_raw_vendor_withdrawal_request_number`


FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`withdrawal_requests` AS source_table

 ) AS source_and_sql_select_statement

 ) AS un_ordered

;

