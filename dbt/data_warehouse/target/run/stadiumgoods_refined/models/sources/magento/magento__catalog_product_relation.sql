

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_product_relation`
  OPTIONS()
  as 

  


 

SELECT   `configurable_product_id`,  `simple_product_id`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`parent_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`parent_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `configurable_product_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`child_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`child_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `simple_product_id`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_relation` AS source_table

 ) AS un_ordered

;

