













 

SELECT   `cross_dock_notification_id`,  `imported_shipment_id`,  `cross_dock`,  `reference_number`,  to_hex(md5(cast(`request_payload` as 
    string
))) AS `request_payload`,  `response_payload`,  `cross_dock_notification_created_at`,  `cross_dock_tracking_number`,  `magento_order_id`,  `magento_increment_id`,  `_synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `cross_dock_notification_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`imported_shipment_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`imported_shipment_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `imported_shipment_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cross_dock` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cross_dock` AS string)), '') AS string) END as string)
 AS `cross_dock`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reference_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reference_number` AS string)), '') AS string) END as string)
 AS `reference_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`request_payload` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`request_payload` AS string)), '') AS string) END as string)
 AS `request_payload`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`response_payload` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`response_payload` AS string)), '') AS string) END as string)
 AS `response_payload`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `cross_dock_notification_created_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cross_dock_tracking_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cross_dock_tracking_number` AS string)), '') AS string) END as string)
 AS `cross_dock_tracking_number`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`magento_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`magento_order_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `magento_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`magento_increment_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`magento_increment_id` AS string)), '') AS string) END as string)
 AS `magento_increment_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`



FROM `ff-stadiumgoods-raw-live`.`sales_channel`.`cross_dock_notification` AS source_table

 ) AS un_ordered

