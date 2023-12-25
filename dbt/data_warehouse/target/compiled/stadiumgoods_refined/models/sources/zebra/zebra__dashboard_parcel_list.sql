



























 

SELECT   `tracking_number`,  `ship_reference`,  `sender_name`,  `sender_address`,  `sender_phone`,  `recipient_name`,  `recipient_phone`,  `recipient_city`,  `recipient_province`,  `recipient_postcode`,  `recipient_address`,  `package_name`,  `package_weight_kg`,  `declared_value`,  `sender_country`,  `shipped_at`,  `customer_reference_number`,  `transit_order_number`,  `package_status`,  `updated_at`,  `file_name`,  `sheet_name`,  `file_time`,  `tax`,  `ship_cost`
  FROM ( 

SELECT
    *

  , CAST(regexp_extract(_raw_tax, 
  r'[0-9]+\.?[0-9]{0,2}'
) AS float64) AS `tax`
  , CAST(regexp_extract(_raw_ship_cost, 
  r'[0-9]+\.?[0-9]{0,2}'
) AS float64) AS `ship_cost` 
FROM ( 

SELECT
    *

  , 
    safe_cast(UPPER(_raw_ship_reference) as string)
 AS `ship_reference` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tracking_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tracking_number` AS string)), '') AS string) END as string)
 AS `tracking_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_reference` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_reference` AS string)), '') AS string) END as string)
 AS `_raw_ship_reference`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sender_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sender_name` AS string)), '') AS string) END as string)
 AS `sender_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sender_address` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sender_address` AS string)), '') AS string) END as string)
 AS `sender_address`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sender_phone` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sender_phone` AS string)), '') AS string) END as string)
 AS `sender_phone`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_name` AS string)), '') AS string) END as string)
 AS `recipient_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_phone` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_phone` AS string)), '') AS string) END as string)
 AS `recipient_phone`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_city` AS string)), '') AS string) END as string)
 AS `recipient_city`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_province` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_province` AS string)), '') AS string) END as string)
 AS `recipient_province`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_postcode` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_postcode` AS string)), '') AS string) END as string)
 AS `recipient_postcode`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`recipient_address` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`recipient_address` AS string)), '') AS string) END as string)
 AS `recipient_address`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`package_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`package_name` AS string)), '') AS string) END as string)
 AS `package_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`package_weight_kg` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`package_weight_kg` AS string)), '') AS string) END as string)
 AS `package_weight_kg`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`declared_value` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`declared_value` AS string)), '') AS string) END as string)
 AS `declared_value`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sender_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sender_country` AS string)), '') AS string) END as string)
 AS `sender_country`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipped_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipped_at` AS string)), '') AS string) END as timestamp)
 AS `shipped_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_reference_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_reference_number` AS string)), '') AS string) END as string)
 AS `customer_reference_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transit_order_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transit_order_number` AS string)), '') AS string) END as string)
 AS `transit_order_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`package_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`package_status` AS string)), '') AS string) END as string)
 AS `package_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS `updated_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_cost` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_cost` AS string)), '') AS string) END as string)
 AS `_raw_ship_cost`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax` AS string)), '') AS string) END as string)
 AS `_raw_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sheet_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sheet_name` AS string)), '') AS string) END as string)
 AS `sheet_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`



FROM `ff-stadiumgoods-raw-live`.`imports`.`zebra_dashboard_parcel_list` AS source_table

 ) AS source_select_statement

 ) AS source_and_sql_select_statement

 ) AS un_ordered

