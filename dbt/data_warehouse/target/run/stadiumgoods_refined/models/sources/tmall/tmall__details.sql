

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`tmall__details`
  OPTIONS()
  as 


  












 

SELECT   `order_number`,  `product_title`,  `item_price`,  `item_quantity`,  `external_system_number`,  `commodity_attributes`,  `package_information`,  `remarks`,  `order_status`,  `merchant_sku`,  `tmall_order_id`,  `tmall_file`,  `file_time`,  `tmall_file_extract`,  `file_timestamp`
  FROM ( SELECT
    *
 


    , 
    safe_cast(CASE
          WHEN


  regexp_contains(tmall_file_extract, r'(?i)^[0-9]{4}[0-9]{1,2}[0-9]{1,2}[0-9]{1,2}[0-9]{2}$')


          THEN  parse_timestamp('%Y%m%d%H%M', tmall_file_extract)
        END as datetime)


 AS `file_timestamp` 

FROM ( 

SELECT
    *

  , CAST(regexp_extract(tmall_file, 
  r'[0-9]{12}'
) AS string) AS `tmall_file_extract` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_number` AS string)), '') AS string) END as string)
 AS `order_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_title` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_title` AS string)), '') AS string) END as string)
 AS `product_title`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_price` AS string)), '') AS string) END as float64)
 AS `item_price`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_quantity` AS string)), '') AS string) END as float64)
 as int64)
 AS `item_quantity`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`external_system_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`external_system_number` AS string)), '') AS string) END as string)
 AS `external_system_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`commodity_attributes` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`commodity_attributes` AS string)), '') AS string) END as string)
 AS `commodity_attributes`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`package_information` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`package_information` AS string)), '') AS string) END as string)
 AS `package_information`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`remarks` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`remarks` AS string)), '') AS string) END as string)
 AS `remarks`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_status` AS string)), '') AS string) END as string)
 AS `order_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`merchant_sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`merchant_sku` AS string)), '') AS string) END as string)
 AS `merchant_sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tmall_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tmall_order_id` AS string)), '') AS string) END as string)
 AS `tmall_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tmall_file` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tmall_file` AS string)), '') AS string) END as string)
 AS `tmall_file`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`



FROM `ff-stadiumgoods-raw-live`.`imports`.`tmall_details` AS source_table

 ) AS source_and_sql_select_statement

 ) AS macro_statement

 ) AS un_ordered

;

