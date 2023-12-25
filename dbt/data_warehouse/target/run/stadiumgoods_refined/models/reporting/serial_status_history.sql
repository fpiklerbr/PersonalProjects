

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`serial_status_history`
  
  
  OPTIONS()
  as (
    

SELECT serial_number
     , serial_log_id
     , log_event as log_type
     , CAST(old_status_id AS int64) AS old_status_id
     , CAST(status_id AS int64) AS status_id
     , log_timestamp_utc as start_timestamp
     , lead(log_timestamp_utc)
       OVER (PARTITION BY serial_number order by serial_row_number) as end_timestamp
     , ROW_NUMBER() OVER 
       (PARTITION BY serial_number ORDER BY serial_row_number) as serial_status_id_row
     , _synched_from_source_at
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_log_status_id_change_events`



UNION ALL

SELECT serial_number
    , NULL as serial_log_id
    , NULL as log_type
    , NULL as old_status_id
    , status_id
    , start_timestamp
    , end_timestamp
    , serial_status_id_row
    , NULL as _synched_from_source_at
FROM (
  SELECT *
  , row_number() OVER (PARTITION BY serial_number ORDER BY start_timestamp, end_timestamp) serial_status_id_row
  FROM
  (
    SELECT serial_number
    , 2 status_id
    , SAFE_CAST(TIMESTAMP(SAFE_CAST(original_intake_creation_nyc AS datetime), 'America/New_York') AS timestamp) AS start_timestamp
    , CAST(document_date AS timestamp) AS end_timestamp
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_serial_tmp_info` AS info
    WHERE info.original_intake_creation_nyc IS NOT NULL
    AND info.status_document IN ('Issue', 'Withdrawal')
    AND NOT EXISTS (SELECT * FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_log_status_id_change_events` WHERE serial_number = info.serial_number)
    
    UNION DISTINCT

    SELECT serial_number
    , 1 status_id
    , CAST(document_date AS timestamp) AS start_timestamp
    , CAST(NULL AS timestamp) AS end_timestamp
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_serial_tmp_info` AS info
    WHERE info.original_intake_creation_nyc IS NOT NULL
    AND info.status_document IN ('Issue', 'Withdrawal')
    AND NOT EXISTS (SELECT * FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_log_status_id_change_events` WHERE serial_number = info.serial_number)
    
    UNION DISTINCT

    SELECT serial_number
    , 2 status_id
    , SAFE_CAST(TIMESTAMP(SAFE_CAST(original_intake_creation_nyc AS datetime), 'America/New_York') AS timestamp) AS start_timestamp
    , NULL end_timestamp
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_serial_tmp_info` AS info
    WHERE info.original_intake_creation_nyc IS NOT NULL
    AND info.status_document NOT IN ('Issue', 'Withdrawal')
    AND NOT EXISTS (SELECT * FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_magento_log_status_id_change_events` WHERE serial_number = info.serial_number)
  ) x3_union
) missing_rows
  );
    