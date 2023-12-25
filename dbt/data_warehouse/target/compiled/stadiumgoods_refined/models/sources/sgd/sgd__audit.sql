


 




 

SELECT   `serial_number`,  `location`,  `audit_type`,  `audit_file`,  `audit_timestamp`,  `audit_date`
  FROM ( 

SELECT
    *

  , safe_cast(datetime(safe_cast(audit_timestamp AS timestamp), 'America/New_York') AS date) AS `audit_date` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`serial_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`serial_number` AS string)), '') AS string) END as string)
 AS `serial_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`location` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`location` AS string)), '') AS string) END as string)
 AS `location`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`audit_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`audit_type` AS string)), '') AS string) END as string)
 AS `audit_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`audit_file` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`audit_file` AS string)), '') AS string) END as string)
 AS `audit_file`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`audit_timestamp` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`audit_timestamp` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `audit_timestamp`



FROM `ff-stadiumgoods-raw-live`.`imports`.`sgd_audit_serials` AS source_table

 ) AS source_and_sql_select_statement

 ) AS un_ordered

