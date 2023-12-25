

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__catalog_category_product`
  OPTIONS()
  as 

  





 

SELECT   `category_id`,  `configurable_product_id`,  `position`
    , `_raw_feature_position`
    , `_raw_is_feature`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`category_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`category_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `category_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `configurable_product_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`position` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`position` AS string)), '') AS string) END as float64)
 as int64)
 AS `position`


  , `feature_position` AS `_raw_feature_position`

  , `is_feature` AS `_raw_is_feature`

  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_category_product` AS source_table

 ) AS un_ordered

;

