

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`tmall__b2c_duties`
  OPTIONS()
  as 















 

SELECT   `ship_reference`,  `shipped_at`,  `ship_date`,  `currency`,  `duties_cost`,  `file_name`,  `file_time`,  `seller_nickname`,  `service_product`,  `logistics_goods`,  `expense_item`
  FROM ( 

SELECT
    *

  , safe_cast(datetime(safe_cast(shipped_at AS timestamp), 'America/New_York') AS date) AS `ship_date` 
FROM ( 

SELECT
    *

  , 
    safe_cast(coalesce(_raw_ship_reference, _raw_lg_order_code) as string)
 AS `ship_reference`
  , 
    safe_cast(coalesce(_raw_shipped_at, _raw_timestamp) as timestamp)
 AS `shipped_at`
  , 
    safe_cast(coalesce(_raw_currency_tag, _raw_currency)  as string)
 AS `currency`
  , 
    safe_cast(coalesce(_raw_duties_cost, _raw_amount) as float64)
 AS `duties_cost` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_reference` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_reference` AS string)), '') AS string) END as string)
 AS `_raw_ship_reference`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lg_order_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lg_order_code` AS string)), '') AS string) END as string)
 AS `_raw_lg_order_code`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipped_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipped_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Asia/Shanghai') AS timestamp) AS `_raw_shipped_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`timestamp` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`timestamp` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Asia/Shanghai') AS timestamp) AS `_raw_timestamp`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`currency_tag` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`currency_tag` AS string)), '') AS string) END as string)
 AS `_raw_currency_tag`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`currency` AS string)), '') AS string) END as string)
 AS `_raw_currency`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`duties_cost` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`duties_cost` AS string)), '') AS string) END as float64)
 AS `_raw_duties_cost`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amount` AS string)), '') AS string) END as float64)
 AS `_raw_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`seller_nickname` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`seller_nickname` AS string)), '') AS string) END as string)
 AS `seller_nickname`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`service_product` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`service_product` AS string)), '') AS string) END as string)
 AS `service_product`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`logistics_goods` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`logistics_goods` AS string)), '') AS string) END as string)
 AS `logistics_goods`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`expense_item` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`expense_item` AS string)), '') AS string) END as string)
 AS `expense_item`



FROM `ff-stadiumgoods-raw-live`.`imports`.`tmall_b2c_duties` AS source_table

 ) AS source_select_statement

 ) AS source_and_sql_select_statement

 ) AS un_ordered

;

