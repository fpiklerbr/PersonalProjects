

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_entity_text`
  OPTIONS()
  as 

  






 

SELECT   `catalog_product_entity_text_id`,  `entity_type_id`,  `attribute_id`,  `store_id`,  `product_id`,  `attribute_value`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`value_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`value_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `catalog_product_entity_text_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_type_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_type_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `entity_type_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`attribute_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`attribute_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `attribute_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `store_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `product_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`value` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`value` AS string)), '') AS string) END as string)
 AS `attribute_value`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_entity_text` AS source_table

 ) AS un_ordered

;

