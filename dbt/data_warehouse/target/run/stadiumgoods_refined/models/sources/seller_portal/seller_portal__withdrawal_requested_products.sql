

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__withdrawal_requested_products`
  OPTIONS()
  as 

  














 

SELECT   `withdrawal_requested_product_id`,  `withdrawal_request_id`,  `serial_number`,  `created_at`,  `updated_at`,  `user_id`,  `removed`,  `removed_by_id`,  `deleted_at`,  `removal_reason`,  `tracking_number`,  `shipment_status`,  `_synched_from_source_at`
    , `_raw_fee_cents`
    , `_raw_carrier_token`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `withdrawal_requested_product_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`withdrawal_request_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`withdrawal_request_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `withdrawal_request_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`serial` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`serial` AS string)), '') AS string) END as string)
 AS `serial_number`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`user_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`user_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `user_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`removed` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`removed` AS string)), '') AS string) END as string)
 AS `removed`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`removed_by_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`removed_by_id` AS string)), '') AS string) END as string)
 AS `removed_by_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`deleted_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`deleted_at` AS string)), '') AS string) END as string)
 AS `deleted_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`removal_reason` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`removal_reason` AS string)), '') AS string) END as string)
 AS `removal_reason`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tracking_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tracking_number` AS string)), '') AS string) END as string)
 AS `tracking_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_status` AS string)), '') AS string) END as string)
 AS `shipment_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`


  , `fee_cents` AS `_raw_fee_cents`

  , `carrier_token` AS `_raw_carrier_token`


FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`withdrawal_request_items` AS source_table

 ) AS un_ordered

;

