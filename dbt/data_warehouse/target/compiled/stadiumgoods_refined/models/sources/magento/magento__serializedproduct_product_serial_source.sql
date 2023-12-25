

 



 

SELECT   `source_id`,  `source_name`,  `source_code`,  `is_dropshipped`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    *

  , 
    safe_cast(CASE WHEN source_name IN ('DSS','DSCO') THEN True ELSE False END as boolean)
 AS `is_dropshipped` 
FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `source_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`name` AS string)), '') AS string) END as string)
 AS `source_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`code` AS string)), '') AS string) END as string)
 AS `source_code`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`serializedproduct_product_serial_source` AS source_table

 ) AS source_select_statement

 ) AS un_ordered

