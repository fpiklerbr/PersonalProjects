

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_shipment_manifests`
  OPTIONS()
  as 











 

SELECT   `ether_wms_shipment_manifest_id`,  `ether_wms_warehouse_id`,  `employee_id`,  `uuid`,  `status`,  `lock_version`,  `created_at`,  `updated_at`,  `document_id`,  `_synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_shipment_manifest_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`warehouse_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`warehouse_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_warehouse_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`employee_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`employee_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `employee_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`uuid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`uuid` AS string)), '') AS string) END as string)
 AS `uuid`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as string)
 AS `status`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) END as float64)
 as int64)
 AS `lock_version`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`document_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`document_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `document_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`



FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_shipment_manifests` AS source_table

 ) AS un_ordered

;

