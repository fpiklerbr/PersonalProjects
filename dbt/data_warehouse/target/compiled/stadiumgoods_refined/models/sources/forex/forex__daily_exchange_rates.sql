

    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base` AS string)), '') AS string) END as string)
 , cast('USD' AS string )) AS `base`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`currency` AS string)), '') AS string) END as string)
 AS `currency`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transaction_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_date` AS string)), '') AS string) END as timestamp)
 as date)
 AS `request_date`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`response_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`response_date` AS string)), '') AS string) END as timestamp)
 as date)
 AS `response_date`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`in_usd` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`in_usd` AS string)), '') AS string) END as numeric)
 AS `in_usd`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`per_usd` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`per_usd` AS string)), '') AS string) END as numeric)
 AS `per_usd`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_id` AS string)), '') AS string) END as string)
 AS `_id`
  , `obs_value` AS `_raw_obs_value`
FROM `ff-stadiumgoods-raw-live`.`imports`.`daily_exchange_rates`

WHERE 1=1
AND coalesce(base, 'USD') NOT IN ('EUR')
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast(coalesce(response_date, request_date) as date)
 AS `rate_source_date`
FROM layer_0
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `base` AS `base`
  , `currency` AS `currency`
  , `request_date` AS `request_date`
  , `response_date` AS `response_date`
  , `rate_source_date` AS `rate_source_date`
  , `in_usd` AS `in_usd`
  , `per_usd` AS `per_usd`
  , `file_time` AS `file_time`
  , `file_name` AS `file_name`
  , `_id` AS `_id`
  , `_raw_obs_value` AS `_raw_obs_value`
FROM layer_1
WHERE 1=1
                     ) SELECT * FROM final 