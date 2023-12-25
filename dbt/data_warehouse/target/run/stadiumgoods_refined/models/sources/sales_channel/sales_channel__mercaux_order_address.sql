

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`sales_channel__mercaux_order_address`
  OPTIONS()
  as 


















 

SELECT   `mercaux_order_address_id`,  `mercaux_order_id`,  `fist_name`,  `last_name`,  `email`,  `line_1`,  `line_2`,  `city`,  `region`,  `country_code`,  `zip_code`,  `phone_number`,  `address_type`,  `created_at`,  `_synched_from_source_at`
    , `_raw_shipping_note`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `mercaux_order_address_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`mercaux_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`mercaux_order_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `mercaux_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`first_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`first_name` AS string)), '') AS string) END as string)
 AS `fist_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`last_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`last_name` AS string)), '') AS string) END as string)
 AS `last_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`email` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`email` AS string)), '') AS string) END as string)
 AS `email`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line1` AS string)), '') AS string) END as string)
 AS `line_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line2` AS string)), '') AS string) END as string)
 AS `line_2`

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

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`phone_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`phone_number` AS string)), '') AS string) END as string)
 AS `phone_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`type` AS string)), '') AS string) END as string)
 AS `address_type`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`


  , `shipping_note` AS `_raw_shipping_note`


FROM `ff-stadiumgoods-raw-live`.`sales_channel`.`mercaux_order_address` AS source_table

 ) AS un_ordered

;

