

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__profiles`
  OPTIONS()
  as 




























 

SELECT   `profile_id`,  `addr_line_1`,  `addr_line_2`,  `city`,  `state`,  `zip`,  `phone_number`,  `user_id`,  `created_at`,  `updated_at`,  `name`,  `birthdate`,  `guardian_name`,  `guardian_email`,  `agreement_id`,  `country`,  `cell_phone_number`,  `fax_phone_number`,  `addr_line_3`,  `website`,  `company`,  `first_name`,  `last_name`,  `full_name`,  `_synched_from_source_at`
    , `_raw_guardian_first_name`
    , `_raw_guardian_last_name`
    , `_raw_address_status`
  FROM ( 

SELECT
    *

  , 
    safe_cast(trim(coalesce(first_name, '') || ' ' || coalesce(last_name, '')) as string)
 AS `full_name` 
FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `profile_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`addr_line_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`addr_line_1` AS string)), '') AS string) END as string)
 AS `addr_line_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`addr_line_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`addr_line_2` AS string)), '') AS string) END as string)
 AS `addr_line_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`city` AS string)), '') AS string) END as string)
 AS `city`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`state` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`state` AS string)), '') AS string) END as string)
 AS `state`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`zip` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`zip` AS string)), '') AS string) END as string)
 AS `zip`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`phone_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`phone_number` AS string)), '') AS string) END as string)
 AS `phone_number`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`user_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`user_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `user_id`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`name` AS string)), '') AS string) END as string)
 AS `name`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`birthdate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`birthdate` AS string)), '') AS string) END as timestamp)
 as date)
 AS `birthdate`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`guardian_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`guardian_name` AS string)), '') AS string) END as string)
 AS `guardian_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`guardian_email` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`guardian_email` AS string)), '') AS string) END as string)
 AS `guardian_email`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`agreement_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`agreement_id` AS string)), '') AS string) END as string)
 AS `agreement_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`country` AS string)), '') AS string) END as string)
 AS `country`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cell_phone_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cell_phone_number` AS string)), '') AS string) END as string)
 AS `cell_phone_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fax_phone_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fax_phone_number` AS string)), '') AS string) END as string)
 AS `fax_phone_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`addr_line_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`addr_line_3` AS string)), '') AS string) END as string)
 AS `addr_line_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`website` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`website` AS string)), '') AS string) END as string)
 AS `website`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`company` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`company` AS string)), '') AS string) END as string)
 AS `company`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`first_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`first_name` AS string)), '') AS string) END as string)
 AS `first_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`last_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`last_name` AS string)), '') AS string) END as string)
 AS `last_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`


  , `guardian_first_name` AS `_raw_guardian_first_name`

  , `guardian_last_name` AS `_raw_guardian_last_name`

  , `address_status` AS `_raw_address_status`


FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`profiles` AS source_table

 ) AS source_select_statement

 ) AS un_ordered

;

