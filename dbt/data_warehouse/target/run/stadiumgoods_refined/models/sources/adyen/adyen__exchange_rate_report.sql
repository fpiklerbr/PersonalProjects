

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`adyen__exchange_rate_report`
  OPTIONS()
  as 

  










 

SELECT   `base_currency`,  `target_currency`,  `symbol`,  `currency_description`,  `exponent`,  `exchange_rate`,  `valid_from`,  `file_suffix`,  `file_name`,  `file_time`
    , `_raw_exchange_rate_platform_settlement_`
  FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_currency` AS string)), '') AS string) END as string)
 AS `base_currency`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`target_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`target_currency` AS string)), '') AS string) END as string)
 AS `target_currency`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`symbol` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`symbol` AS string)), '') AS string) END as string)
 AS `symbol`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`currency_description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`currency_description` AS string)), '') AS string) END as string)
 AS `currency_description`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`exponent` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`exponent` AS string)), '') AS string) END as string)
 AS `exponent`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`exchange_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`exchange_rate` AS string)), '') AS string) END as string)
 AS `exchange_rate`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`valid_from` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`valid_from` AS string)), '') AS string) END as string)
 AS `valid_from`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_suffix` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_suffix` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `file_suffix`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `file_time`


  , `exchange_rate_platform_settlement_` AS `_raw_exchange_rate_platform_settlement_`


FROM `ff-stadiumgoods-raw-live`.`imports`.`adyen_exchange_rate_report` AS source_table

 ) AS un_ordered

;

