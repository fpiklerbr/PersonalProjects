




  




 

SELECT   `x3_order_id`,  `x3_order_line`,  `mag_order_item_id`,  `matched_at`,  `match_method`
  FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`x3_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`x3_order_id` AS string)), '') AS string) END as string)
 AS `x3_order_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_line` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_line` AS string)), '') AS string) END as float64)
 as int64)
 AS `x3_order_line`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_item_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_item_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `mag_order_item_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`match_timestamp` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`match_timestamp` AS string)), '') AS string) END as timestamp)
 AS `matched_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`match_method` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`match_method` AS string)), '') AS string) END as string)
 AS `match_method`



FROM `ff-stadiumgoods-raw-live`.`meta`.`match_x3_order_line_to_mag_order_item` AS source_table

 ) AS un_ordered

