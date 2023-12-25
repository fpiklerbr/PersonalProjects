







 

SELECT   `reference`,  `cost`,  `file_name`,  `file_timestamp`,  `ship_timestamp`
  FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reference` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reference` AS string)), '') AS string) END as string)
 AS `reference`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cost` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cost` AS string)), '') AS string) END as float64)
 AS `cost`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_timestamp` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_timestamp` AS string)), '') AS string) END as timestamp)
 AS `file_timestamp`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_timestamp` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_timestamp` AS string)), '') AS string) END as timestamp)
 AS `ship_timestamp`



FROM `ff-stadiumgoods-raw-live`.`imports`.`zebra_shipping` AS source_table

 ) AS un_ordered

