

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__smv_tmall_order`
  OPTIONS()
  as 

  









 

SELECT   `smv_tmall_order_id`,  `tmall_order_id`,  `sales_flat_order_id`,  `created_at`,  `updated_at`,  `waybill_pdf_url`,  `waybill_pdf_status`,  `waybill_pdf_error_message`,  `tmall_entity_id`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `smv_tmall_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tmall_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tmall_order_id` AS string)), '') AS string) END as string)
 AS `tmall_order_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sales_flat_order_id`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`waybill_pdf_url` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`waybill_pdf_url` AS string)), '') AS string) END as string)
 AS `waybill_pdf_url`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`waybill_pdf_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`waybill_pdf_status` AS string)), '') AS string) END as string)
 AS `waybill_pdf_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`waybill_pdf_error_message` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`waybill_pdf_error_message` AS string)), '') AS string) END as string)
 AS `waybill_pdf_error_message`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tmall_entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tmall_entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `tmall_entity_id`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`smv_tmall_order` AS source_table

 ) AS un_ordered

;

