

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`tmall__b2c_shipping`
  OPTIONS()
  as 













 

SELECT   `ship_reference`,  `currency`,  `ship_cost`,  `shipped_at`,  `ship_date`,  `file_name`,  `file_time`,  `seller_nickname`,  `service_product`,  `logistics_goods`,  `expense_item`
  FROM ( 

SELECT
    *

  , safe_cast(datetime(safe_cast(shipped_at AS timestamp), 'America/New_York') AS date) AS `ship_date` 
FROM ( 

SELECT
    *

  , 
    safe_cast(coalesce(_raw_lg_order_code, _raw_lp) as string)
 AS `ship_reference`
  , 
    safe_cast(coalesce(_raw_amount, _raw_amout) as float64)
 AS `ship_cost` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lg_order_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lg_order_code` AS string)), '') AS string) END as string)
 AS `_raw_lg_order_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lp` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lp` AS string)), '') AS string) END as string)
 AS `_raw_lp`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`currency` AS string)), '') AS string) END as string)
 AS `currency`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amount` AS string)), '') AS string) END as float64)
 AS `_raw_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amout` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amout` AS string)), '') AS string) END as float64)
 AS `_raw_amout`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`timestamp` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`timestamp` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Asia/Shanghai') AS timestamp) AS `shipped_at`

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



FROM `ff-stadiumgoods-raw-live`.`imports`.`tmall_b2c_shipping` AS source_table

 ) AS source_select_statement

 ) AS source_and_sql_select_statement

 ) AS un_ordered

;

