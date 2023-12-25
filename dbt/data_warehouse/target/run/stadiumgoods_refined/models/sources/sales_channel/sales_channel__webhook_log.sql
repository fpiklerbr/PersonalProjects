
        
    

    

    merge into `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`sales_channel__webhook_log` as DBT_INTERNAL_DEST
        using (
           















 

SELECT   `webhook_log_id`,  `webhook_log_type`,  `payload`,  `webhook_log_created_at`,  `channel`,  `_synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `webhook_log_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`type` AS string)), '') AS string) END as string)
 AS `webhook_log_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payload` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payload` AS string)), '') AS string) END as string)
 AS `payload`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'America/New_York') AS timestamp) AS `webhook_log_created_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`channel` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`channel` AS string)), '') AS string) END as string)
 AS `channel`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`



FROM `ff-stadiumgoods-raw-live`.`sales_channel`.`webhook_log` AS source_table

WHERE 
    safe_cast(
    safe_cast(id as float64)
 as int64)
 > (SELECT max(webhook_log_id) FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`sales_channel__webhook_log` )


 ) AS un_ordered


         ) as DBT_INTERNAL_SOURCE
        on FALSE

    

    when not matched then insert
        (`webhook_log_id`, `webhook_log_type`, `payload`, `webhook_log_created_at`, `channel`, `_synched_from_source_at`)
    values
        (`webhook_log_id`, `webhook_log_type`, `payload`, `webhook_log_created_at`, `channel`, `_synched_from_source_at`)


  