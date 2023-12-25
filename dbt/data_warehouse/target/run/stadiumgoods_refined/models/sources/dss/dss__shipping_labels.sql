

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`dss__shipping_labels`
  OPTIONS()
  as 

  
















 

SELECT   `shipping_label_id`,  `third_party_id`,  `shipment_location_id`,  `order_id`,  `box_label`,  `box_name`,  `carrier`,  `tracking_number`,  `label_url`,  `shipped_quantity`,  `response`,  `status`,  `created_at`,  `updated_at`,  `_synched_from_source_at`
    , `_raw_rate_service_level`
    , `_raw_printed_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `shipping_label_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`third_party_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`third_party_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `third_party_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_location_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_location_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `shipment_location_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`box_label` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`box_label` AS string)), '') AS string) END as string)
 AS `box_label`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`box_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`box_name` AS string)), '') AS string) END as string)
 AS `box_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`carrier` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`carrier` AS string)), '') AS string) END as string)
 AS `carrier`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tracking_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tracking_number` AS string)), '') AS string) END as string)
 AS `tracking_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`label_url` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`label_url` AS string)), '') AS string) END as string)
 AS `label_url`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipped_quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipped_quantity` AS string)), '') AS string) END as float64)
 as int64)
 AS `shipped_quantity`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`response` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`response` AS string)), '') AS string) END as string)
 AS `response`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as float64)
 as int64)
 AS `status`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`


  , `rate_service_level` AS `_raw_rate_service_level`

  , `printed_at` AS `_raw_printed_at`


FROM `ff-stadiumgoods-raw-live`.`dss_portal_production`.`shipping_labels` AS source_table

 ) AS un_ordered

;

