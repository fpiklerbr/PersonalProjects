

  


 

SELECT   `order_status`,  `order_status_label`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as string)
 AS `order_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`label` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`label` AS string)), '') AS string) END as string)
 AS `order_status_label`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_order_status` AS source_table

 ) AS un_ordered

