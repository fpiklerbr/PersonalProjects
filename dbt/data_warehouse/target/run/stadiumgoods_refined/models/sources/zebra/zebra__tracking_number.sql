

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`zebra__tracking_number`
  OPTIONS()
  as 






 

SELECT   `zebra_order_reference`,  `tracking_number`,  `file_time`,  `file_name`
  FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tmall_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tmall_order_id` AS string)), '') AS string) END as string)
 AS `zebra_order_reference`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`zebra_tracking_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`zebra_tracking_number` AS string)), '') AS string) END as string)
 AS `tracking_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`



FROM `ff-stadiumgoods-raw-live`.`imports`.`zebra_tracking_number` AS source_table

 ) AS un_ordered

;

