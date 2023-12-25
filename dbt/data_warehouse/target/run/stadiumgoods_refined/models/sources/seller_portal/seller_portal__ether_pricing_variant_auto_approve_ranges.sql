

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_pricing_variant_auto_approve_ranges`
  OPTIONS()
  as 












 

SELECT   `ether_pricing_variant_auto_approve_ranges_id`,  `ether_wms_product_variant_id`,  `min_price_cents`,  `max_price_cents`,  `calculation_date`,  `calculation_strategy`,  `created_at`,  `updated_at`,  `deprecated_at`,  `raw_min_price_cents`,  `raw_max_price_cents`,  `_synched_from_source_at`
    , `_raw_strategy_ids`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_pricing_variant_auto_approve_ranges_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`variant_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`variant_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_product_variant_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`min_price_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`min_price_cents` AS string)), '') AS string) END as numeric)
 AS `min_price_cents`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`max_price_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`max_price_cents` AS string)), '') AS string) END as numeric)
 AS `max_price_cents`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`calculation_date` AS string)), '') AS string) IN ('1900-01-01 00:00:00','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`calculation_date` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `calculation_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`calculation_strategy` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`calculation_strategy` AS string)), '') AS string) END as string)
 AS `calculation_strategy`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('1900-01-01 00:00:00','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('1900-01-01 00:00:00','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`deprecated_at` AS string)), '') AS string) IN ('1900-01-01 00:00:00','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`deprecated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `deprecated_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`raw_min_price_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`raw_min_price_cents` AS string)), '') AS string) END as numeric)
 AS `raw_min_price_cents`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`raw_max_price_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`raw_max_price_cents` AS string)), '') AS string) END as numeric)
 AS `raw_max_price_cents`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('1900-01-01 00:00:00','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `_synched_from_source_at`


  , `strategy_ids` AS `_raw_strategy_ids`


FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_pricing_variant_auto_approve_ranges` AS source_table

 ) AS un_ordered

;

