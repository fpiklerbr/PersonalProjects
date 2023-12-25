

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sg_farfetch_price`
  OPTIONS()
  as 

  













 

SELECT   `sg_farfetch_price_id`,  `barcode_entity_id`,  `tenant_entity_id`,  `sg_price`,  `ff_price`,  `created_at`,  `updated_at`,  `status`,  `retry_count`,  `processing_at`,  `awaiting_validation_at`,  `validated_at`,  `synched_from_source_at`
    , `_raw_price_record`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sg_farfetch_price_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`barcode_entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`barcode_entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `barcode_entity_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tenant_entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tenant_entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `tenant_entity_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sg_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sg_price` AS string)), '') AS string) END as float64)
 as int64)
 AS `sg_price`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ff_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ff_price` AS string)), '') AS string) END as float64)
 as int64)
 AS `ff_price`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as string)
 AS `status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`retry_count` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`retry_count` AS string)), '') AS string) END as numeric)
 AS `retry_count`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`processing_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`processing_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `processing_at`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`awaiting_validation_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`awaiting_validation_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `awaiting_validation_at`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`validated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`validated_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `validated_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `synched_from_source_at`


  , `price_record` AS `_raw_price_record`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_price` AS source_table

 ) AS un_ordered

;

