

 























 

SELECT   `event_date`,  `event_timestamp`,  `event_name`,  `event_params`,  `event_previous_timestamp`,  `event_value_in_usd`,  `event_bundle_sequence_id`,  `event_server_timestamp_offset`,  `user_id`,  `user_pseudo_id`,  `privacy_info`,  `user_properties`,  `user_first_touch_timestamp`,  `user_ltv`,  `device`,  `geo`,  `app_info`,  `traffic_source`,  `stream_id`,  `platform`,  `event_dimensions`,  `ecommerce`,  `items`
    , `_raw_collected_traffic_source`
  FROM ( 

SELECT
    *

  , 
    safe_cast(TIMESTAMP_MICROS(_raw_event_timestamp) as timestamp)
 AS `event_timestamp`
  , 
    safe_cast(TIMESTAMP_MICROS(_raw_event_previous_timestamp) as timestamp)
 AS `event_previous_timestamp`
  , 
    safe_cast(TIMESTAMP_MICROS(_raw_user_first_touch_timestamp) as timestamp)
 AS `user_first_touch_timestamp` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`event_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`event_date` AS string)), '') AS string) END as string)
 AS `event_date`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`event_timestamp` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`event_timestamp` AS string)), '') AS string) END as float64)
 as int64)
 AS `_raw_event_timestamp`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`event_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`event_name` AS string)), '') AS string) END as string)
 AS `event_name`

  , `event_params` AS `event_params`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`event_previous_timestamp` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`event_previous_timestamp` AS string)), '') AS string) END as float64)
 as int64)
 AS `_raw_event_previous_timestamp`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`event_value_in_usd` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`event_value_in_usd` AS string)), '') AS string) END as float64)
 AS `event_value_in_usd`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`event_bundle_sequence_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`event_bundle_sequence_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `event_bundle_sequence_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`event_server_timestamp_offset` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`event_server_timestamp_offset` AS string)), '') AS string) END as float64)
 as int64)
 AS `event_server_timestamp_offset`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`user_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`user_id` AS string)), '') AS string) END as string)
 AS `user_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`user_pseudo_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`user_pseudo_id` AS string)), '') AS string) END as string)
 AS `user_pseudo_id`

  , `privacy_info` AS `privacy_info`

  , `user_properties` AS `user_properties`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`user_first_touch_timestamp` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`user_first_touch_timestamp` AS string)), '') AS string) END as float64)
 as int64)
 AS `_raw_user_first_touch_timestamp`

  , `user_ltv` AS `user_ltv`

  , `device` AS `device`

  , `geo` AS `geo`

  , `app_info` AS `app_info`

  , `traffic_source` AS `traffic_source`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stream_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stream_id` AS string)), '') AS string) END as string)
 AS `stream_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`platform` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`platform` AS string)), '') AS string) END as string)
 AS `platform`

  , `event_dimensions` AS `event_dimensions`

  , `ecommerce` AS `ecommerce`

  , `items` AS `items`


  , `collected_traffic_source` AS `_raw_collected_traffic_source`


FROM `ff-stadiumgoods-raw-live`.`analytics_195323050`.`events_*` AS source_table

 ) AS source_select_statement

 ) AS un_ordered

