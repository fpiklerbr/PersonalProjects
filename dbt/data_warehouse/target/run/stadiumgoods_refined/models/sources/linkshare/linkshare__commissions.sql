

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`linkshare__commissions`
  OPTIONS()
  as 


 












 

SELECT   `mag_order_id`,  `transaction_date`,  `transaction_time`,  `total_commission`,  `offer_name`,  `publisher_name`,  `publisher_group_name`,  `process_date`,  `process_time`,  `transaction_timestamp`,  `process_timestamp`,  `source_date`,  `file_time`
  FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as string)
 AS `mag_order_id`

  , 
    safe_cast(
    safe_cast(CASE
          WHEN


  regexp_contains(CASE WHEN cast(nullif(trim(cast(`transaction_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_date` AS string)), '') AS string) END, r'(?i)^[0-9]{1,2}/[0-9]{1,2}/[0-9]{2}$')


          THEN  parse_timestamp('%m/%d/%y', CASE WHEN cast(nullif(trim(cast(`transaction_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_date` AS string)), '') AS string) END)
        END as timestamp)


 as date)
 AS `transaction_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transaction_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_time` AS string)), '') AS string) END as string)
 AS `transaction_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_commission` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_commission` AS string)), '') AS string) END as float64)
 AS `total_commission`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`offer_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`offer_name` AS string)), '') AS string) END as string)
 AS `offer_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`publisher_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`publisher_name` AS string)), '') AS string) END as string)
 AS `publisher_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`publisher_group_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`publisher_group_name` AS string)), '') AS string) END as string)
 AS `publisher_group_name`

  , 
    safe_cast(
    safe_cast(CASE
          WHEN


  regexp_contains(CASE WHEN cast(nullif(trim(cast(`process_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`process_date` AS string)), '') AS string) END, r'(?i)^[0-9]{1,2}/[0-9]{1,2}/[0-9]{2}$')


          THEN  parse_timestamp('%m/%d/%y', CASE WHEN cast(nullif(trim(cast(`process_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`process_date` AS string)), '') AS string) END)
        END as timestamp)


 as date)
 AS `process_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`process_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`process_time` AS string)), '') AS string) END as string)
 AS `process_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transaction_timestamp` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_timestamp` AS string)), '') AS string) END as timestamp)
 AS `transaction_timestamp`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`process_timestamp` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`process_timestamp` AS string)), '') AS string) END as timestamp)
 AS `process_timestamp`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`source_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`source_date` AS string)), '') AS string) END as timestamp)
 as date)
 AS `source_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`



FROM `ff-stadiumgoods-raw-live`.`imports`.`linkshare_commissions` AS source_table

 ) AS un_ordered

;

