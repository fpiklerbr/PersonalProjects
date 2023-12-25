

/* N.B. raw data is in the location's timezone, so we'll need to update the logic here for the Chicago store when it opens */









 

SELECT   `file_name`,  `file_time`,  `foot_traffic`,  `location`,  `location_id`,  `reporting_period_duration`,  `reporting_period_ended_at`,  `reporting_period_started_at`,  `response_page`,  `foot_traffic_count`,  `foot_traffic_updated_at`,  `foot_traffic_completeness`,  `location_name`
  FROM ( 

SELECT
    *

  , 
    safe_cast(
    safe_cast(JSON_EXTRACT_SCALAR(foot_traffic, '$.count'
  ) as float64)
 as int64)
 AS `foot_traffic_count`
  , 
    safe_cast(JSON_EXTRACT_SCALAR(foot_traffic, '$.updated_at'
  ) as timestamp)
 AS `foot_traffic_updated_at`
  , (JSON_EXTRACT_SCALAR(foot_traffic, '$.completeness'
  ))
 AS `foot_traffic_completeness`
  , (JSON_EXTRACT_SCALAR(location, '$.name'
  ))
 AS `location_name` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`foot_traffic` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`foot_traffic` AS string)), '') AS string) END as string)
 AS `foot_traffic`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`location` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`location` AS string)), '') AS string) END as string)
 AS `location`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`location_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`location_id` AS string)), '') AS string) END as string)
 AS `location_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`interval` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`interval` AS string)), '') AS string) END as string)
 AS `reporting_period_duration`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`datetime_end` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`datetime_end` AS string)), '') AS string) END as timestamp)
 AS datetime), 'America/New_York') AS timestamp) AS `reporting_period_ended_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`datetime_start` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`datetime_start` AS string)), '') AS string) END as timestamp)
 AS datetime), 'America/New_York') AS timestamp) AS `reporting_period_started_at`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`response_page` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`response_page` AS string)), '') AS string) END as float64)
 as int64)
 AS `response_page`



FROM `ff-stadiumgoods-raw-live`.`imports`.`dor_api_location_metrics` AS source_table

 ) AS source_and_sql_select_statement

 ) AS un_ordered

