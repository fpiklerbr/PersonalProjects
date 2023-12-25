

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`google_analytics__transactions`
  OPTIONS()
  as 











 

SELECT   `campaign`,  `device_category`,  `medium`,  `source`,  `transaction_id`,  `transaction_revenue`,  `source_date`,  `file_time`,  `channel_grouping`
  FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`campaign` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`campaign` AS string)), '') AS string) END as string)
 AS `campaign`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`device_category` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`device_category` AS string)), '') AS string) END as string)
 AS `device_category`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`medium` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`medium` AS string)), '') AS string) END as string)
 AS `medium`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`source` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`source` AS string)), '') AS string) END as string)
 AS `source`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transaction_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_id` AS string)), '') AS string) END as string)
 AS `transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transaction_revenue` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_revenue` AS string)), '') AS string) END as float64)
 AS `transaction_revenue`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`source_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`source_date` AS string)), '') AS string) END as timestamp)
 as date)
 AS `source_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`channel_grouping` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`channel_grouping` AS string)), '') AS string) END as string)
 AS `channel_grouping`



FROM `ff-stadiumgoods-raw-live`.`imports`.`ga_transactions` AS source_table

 ) AS un_ordered

;

