

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__eav_attribute_option_value`
  OPTIONS()
  as 

  




 

SELECT   `value_id`,  `option_id`,  `store_id`,  `option_value`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`value_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`value_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `value_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`option_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`option_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `option_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `store_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`value` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`value` AS string)), '') AS string) END as string)
 AS `option_value`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`eav_attribute_option_value` AS source_table

 ) AS un_ordered

;

