

  










 

SELECT   `refund_id`,  `third_party_id`,  `order_id`,  `third_party_order_id`,  `third_party_refund_id`,  `note`,  `processed`,  `processed_at`,  `created_at`,  `updated_at`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `refund_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`third_party_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`third_party_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `third_party_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`third_party_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`third_party_order_id` AS string)), '') AS string) END as string)
 AS `third_party_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`third_party_refund_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`third_party_refund_id` AS string)), '') AS string) END as string)
 AS `third_party_refund_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`note` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`note` AS string)), '') AS string) END as string)
 AS `note`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`processed` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`processed` AS string)), '') AS string) END as float64)
 as int64)
 AS `processed`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`processed_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`processed_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `processed_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`dss_portal_production`.`refunds` AS source_table

 ) AS un_ordered

