

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m2epro_order_item`
  OPTIONS()
  as 

  









 

SELECT   `id`,  `order_id`,  `product_id`,  `product_details`,  `component_mode`,  `qty_reserved`,  `update_date`,  `create_date`,  `serializedproduct_id`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `order_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `product_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_details` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_details` AS string)), '') AS string) END as string)
 AS `product_details`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`component_mode` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`component_mode` AS string)), '') AS string) END as string)
 AS `component_mode`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qty_reserved` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qty_reserved` AS string)), '') AS string) END as float64)
 as int64)
 AS `qty_reserved`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`update_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`update_date` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `update_date`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`create_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`create_date` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `create_date`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`serializedproduct_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`serializedproduct_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `serializedproduct_id`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_order_item` AS source_table

 ) AS un_ordered

;

