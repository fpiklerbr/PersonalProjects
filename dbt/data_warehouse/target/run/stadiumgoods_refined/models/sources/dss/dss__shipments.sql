

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`dss__shipments`
  OPTIONS()
  as 

  




















 

SELECT   `shipment_id`,  `order_id`,  `shipping_label_id`,  `order_item_id`,  `third_party_id`,  `third_party_shipment_id`,  `third_party_order_number`,  `mag_order_id`,  `sku`,  `item_number`,  `quantity`,  `tracking_company`,  `tracking_number`,  `shipment_type`,  `shipment_status`,  to_hex(md5(cast(`metadata` as 
    string
))) AS `metadata`,  `synced`,  `created_at`,  `updated_at`
    , `_raw_magento_shipment_increment_id`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `shipment_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `order_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_label_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_label_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `shipping_label_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_item_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_item_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `order_item_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`third_party_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`third_party_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `third_party_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`third_party_shipment_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`third_party_shipment_id` AS string)), '') AS string) END as string)
 AS `third_party_shipment_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`third_party_order_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`third_party_order_number` AS string)), '') AS string) END as string)
 AS `third_party_order_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`direct_order_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`direct_order_number` AS string)), '') AS string) END as string)
 AS `mag_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sku` AS string)), '') AS string) END as string)
 AS `sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_number` AS string)), '') AS string) END as string)
 AS `item_number`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`quantity` AS string)), '') AS string) END as float64)
 as int64)
 AS `quantity`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tracking_company` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tracking_company` AS string)), '') AS string) END as string)
 AS `tracking_company`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tracking_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tracking_number` AS string)), '') AS string) END as string)
 AS `tracking_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_type` AS string)), '') AS string) END as string)
 AS `shipment_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_status` AS string)), '') AS string) END as string)
 AS `shipment_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`metadata` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`metadata` AS string)), '') AS string) END as string)
 AS `metadata`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`synced` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`synced` AS string)), '') AS string) END as float64)
 as int64)
 AS `synced`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`


  , `magento_shipment_increment_id` AS `_raw_magento_shipment_increment_id`

  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`dss_portal_production`.`shipments` AS source_table

 ) AS un_ordered

;

