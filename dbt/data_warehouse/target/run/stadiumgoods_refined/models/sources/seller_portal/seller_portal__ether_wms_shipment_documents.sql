

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_shipment_documents`
  OPTIONS()
  as 








 

SELECT   `ether_wms_shipment_document_id`,  `label`,  `ether_wms_shipment_id`,  `document_id`,  `created_at`,  `updated_at`,  `_synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_shipment_document_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`label` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`label` AS string)), '') AS string) END as string)
 AS `label`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_shipment_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`document_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`document_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `document_id`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`



FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_shipment_documents` AS source_table

 ) AS un_ordered

;

