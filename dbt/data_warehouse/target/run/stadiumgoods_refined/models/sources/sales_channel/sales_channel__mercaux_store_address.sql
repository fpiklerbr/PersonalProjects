

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`sales_channel__mercaux_store_address`
  OPTIONS()
  as 













 

SELECT   `mercaux_store_id`,  `mercaux_store_name`,  `address_line_1`,  `address_line_2`,  `city`,  `region`,  `country_code`,  `zip_code`,  `created_at`,  `_synched_from_source_at`,  `phone_number`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `mercaux_store_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`name` AS string)), '') AS string) END as string)
 AS `mercaux_store_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`address_line1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`address_line1` AS string)), '') AS string) END as string)
 AS `address_line_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`address_line2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`address_line2` AS string)), '') AS string) END as string)
 AS `address_line_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`city` AS string)), '') AS string) END as string)
 AS `city`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`region` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`region` AS string)), '') AS string) END as string)
 AS `region`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`country_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`country_code` AS string)), '') AS string) END as string)
 AS `country_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`zip_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`zip_code` AS string)), '') AS string) END as string)
 AS `zip_code`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`phone_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`phone_number` AS string)), '') AS string) END as string)
 AS `phone_number`



FROM `ff-stadiumgoods-raw-live`.`sales_channel`.`mercaux_store_address` AS source_table

 ) AS un_ordered

;

