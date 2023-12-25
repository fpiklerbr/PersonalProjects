

  




 

SELECT   `tmall_order_id`,  `zebra_ship_reference`,  `serial_number`,  `processed_at`,  `order_reference_suffix`,  `zebra_order_reference`
  FROM ( 

SELECT
    *

  , 
    safe_cast(tmall_order_id || CASE WHEN order_reference_suffix IS NOT NULL THEN '-' || order_reference_suffix ELSE '' END as string)
 AS `zebra_order_reference` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tmall_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tmall_order_id` AS string)), '') AS string) END as string)
 AS `tmall_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_reference` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_reference` AS string)), '') AS string) END as string)
 AS `zebra_ship_reference`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`serial_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`serial_number` AS string)), '') AS string) END as string)
 AS `serial_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`processing_timestamp` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`processing_timestamp` AS string)), '') AS string) END as timestamp)
 AS `processed_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reference_suffix` AS string)), '') AS string) IN ('0','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reference_suffix` AS string)), '') AS string) END as string)
 AS `order_reference_suffix`



FROM `ff-stadiumgoods-raw-live`.`meta`.`match_tmall_order_id_to_ship_reference` AS source_table

 ) AS source_select_statement

 ) AS un_ordered

