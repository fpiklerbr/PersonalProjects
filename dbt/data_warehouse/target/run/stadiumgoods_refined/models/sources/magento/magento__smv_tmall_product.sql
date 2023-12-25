

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__smv_tmall_product`
  OPTIONS()
  as 

  









 

SELECT   `entity_id`,  `product_id`,  `tmall_product_id`,  `created_at`,  `updated_at`,  `skus_data`,  `sync_product`,  `status`,  `cross_border_report`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `entity_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `product_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tmall_product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tmall_product_id` AS string)), '') AS string) END as string)
 AS `tmall_product_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `created_at`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `updated_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`skus_data` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`skus_data` AS string)), '') AS string) END as string)
 AS `skus_data`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sync_product` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sync_product` AS string)), '') AS string) END as float64)
 as int64)
 AS `sync_product`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as string)
 AS `status`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cross_border_report` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cross_border_report` AS string)), '') AS string) END as float64)
 as int64)
 AS `cross_border_report`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`smv_tmall_product` AS source_table

 ) AS un_ordered

;

