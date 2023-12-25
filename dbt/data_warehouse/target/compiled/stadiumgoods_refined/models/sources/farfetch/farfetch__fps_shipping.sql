

  

















 

SELECT   `shipper`,  `fps_stock_point_id`,  `line_type_invoice`,  `reference`,  `_raw_invoice_date`,  `_int_invoice_date`,  `_date_invoice_date`,  `invoice_date`,  `fps_order_id`,  `awb`,  `shipping_country`,  `site_name`,  `base_currency`,  `base_cost`,  `base_customer_paid`,  `base_balance`,  `file_name`,  `file_time`,  `weight_unit`,  `weight_type`,  `weight`
  FROM ( SELECT
    *

  , 
    safe_cast(coalesce(_date_invoice_date, cast('1899-12-30' AS date) + _int_invoice_date) as date)
 AS `invoice_date` 

 

FROM ( 

SELECT
    *

  , 
    safe_cast(CASE WHEN length(_raw_invoice_date) < 19 THEN _raw_invoice_date END as int64)
 AS `_int_invoice_date`
  , 
    safe_cast(CASE WHEN length(_raw_invoice_date) = 19 THEN _raw_invoice_date END as date)
 AS `_date_invoice_date` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipper` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipper` AS string)), '') AS string) END as string)
 AS `shipper`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_id` AS string)), '') AS string) END as string)
 AS `fps_stock_point_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_type_invoice` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_type_invoice` AS string)), '') AS string) END as string)
 AS `line_type_invoice`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reference` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reference` AS string)), '') AS string) END as string)
 AS `reference`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_date` AS string)), '') AS string) END as string)
 AS `_raw_invoice_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_code` AS string)), '') AS string) END as string)
 AS `fps_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`awb` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`awb` AS string)), '') AS string) END as string)
 AS `awb`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_country` AS string)), '') AS string) END as string)
 AS `shipping_country`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`site_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`site_name` AS string)), '') AS string) END as string)
 AS `site_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`carrier_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`carrier_currency` AS string)), '') AS string) END as string)
 AS `base_currency`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cost_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cost_` AS string)), '') AS string) END as float64)
 AS `base_cost`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_paid_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_paid_` AS string)), '') AS string) END as float64)
 AS `base_customer_paid`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`balance_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`balance_` AS string)), '') AS string) END as float64)
 AS `base_balance`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`weight_unit` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`weight_unit` AS string)), '') AS string) END as string)
 AS `weight_unit`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`weight_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`weight_type` AS string)), '') AS string) END as string)
 AS `weight_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`weight` AS string)), '') AS string) IN ('(blank)','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`weight` AS string)), '') AS string) END as float64)
 AS `weight`



FROM `ff-stadiumgoods-raw-live`.`imports`.`farfetch_fps_shipping` AS source_table

 ) AS source_select_statement

 ) AS macro_statement

 ) AS un_ordered

