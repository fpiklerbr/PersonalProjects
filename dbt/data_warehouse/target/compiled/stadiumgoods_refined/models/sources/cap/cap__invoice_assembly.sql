


















 

SELECT   `order_id`,  `warehouse_id`,  `external_order_id`,  `po_number`,  `order_status`,  `sales_date`,  `finished_sku`,  `ship_comment`,  `total_pieces`,  `time_materials`,  `rate`,  `cost`,  `comments_`,  `file_name`,  `sheet_name`,  `file_time`,  `cap_client_center`
  FROM ( 

SELECT
    *

  , 
    safe_cast(left(file_name, 2) as string)
 AS `cap_client_center` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as string)
 AS `order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`warehouse_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`warehouse_id` AS string)), '') AS string) END as string)
 AS `warehouse_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`external_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`external_order_id` AS string)), '') AS string) END as float64)
 AS `external_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`po_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`po_number` AS string)), '') AS string) END as float64)
 AS `po_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_status` AS string)), '') AS string) END as string)
 AS `order_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sales_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sales_date` AS string)), '') AS string) END as string)
 AS `sales_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`finished_sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`finished_sku` AS string)), '') AS string) END as string)
 AS `finished_sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_comment` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_comment` AS string)), '') AS string) END as string)
 AS `ship_comment`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_pieces` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_pieces` AS string)), '') AS string) END as string)
 AS `total_pieces`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`time_materials` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`time_materials` AS string)), '') AS string) END as string)
 AS `time_materials`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rate` AS string)), '') AS string) END as string)
 AS `rate`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cost` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cost` AS string)), '') AS string) END as string)
 AS `cost`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`comments_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`comments_` AS string)), '') AS string) END as string)
 AS `comments_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sheet_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sheet_name` AS string)), '') AS string) END as string)
 AS `sheet_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`



FROM `ff-stadiumgoods-raw-live`.`imports`.`cap_invoice_assembly` AS source_table

 ) AS source_select_statement

 ) AS un_ordered

