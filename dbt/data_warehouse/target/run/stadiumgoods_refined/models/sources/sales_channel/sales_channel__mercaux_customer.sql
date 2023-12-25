

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`sales_channel__mercaux_customer`
  OPTIONS()
  as 












 

SELECT   `mercaux_customer_id`,  `first_name`,  `last_name`,  `email`,  `created_at`,  `_synched_from_source_at`
    , `_raw_title`
    , `_raw_phone_number`
    , `_raw_is_employee`
    , `_raw_employee_id`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `mercaux_customer_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`first_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`first_name` AS string)), '') AS string) END as string)
 AS `first_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`last_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`last_name` AS string)), '') AS string) END as string)
 AS `last_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`email` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`email` AS string)), '') AS string) END as string)
 AS `email`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`


  , `title` AS `_raw_title`

  , `phone_number` AS `_raw_phone_number`

  , `is_employee` AS `_raw_is_employee`

  , `employee_id` AS `_raw_employee_id`


FROM `ff-stadiumgoods-raw-live`.`sales_channel`.`mercaux_customer` AS source_table

 ) AS un_ordered

;

