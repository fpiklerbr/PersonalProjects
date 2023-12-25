

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m_rma_fedex_label`
  OPTIONS()
  as 

  








 

SELECT   `m_rma_fedex_label_id`,  `m_rma_id`,  `package_number`,  `track_number`,  `label_date`,  `label_body`
    , `_raw_label_shipment_date`
    , `_raw_label_expire_date`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`label_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`label_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `m_rma_fedex_label_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rma_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rma_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `m_rma_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`package_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`package_number` AS string)), '') AS string) END as string)
 AS `package_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`track_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`track_number` AS string)), '') AS string) END as string)
 AS `track_number`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`label_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`label_date` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `label_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`label_body` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`label_body` AS string)), '') AS string) END as string)
 AS `label_body`


  , `label_shipment_date` AS `_raw_label_shipment_date`

  , `label_expire_date` AS `_raw_label_expire_date`

  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_fedex_label` AS source_table

 ) AS un_ordered

;

