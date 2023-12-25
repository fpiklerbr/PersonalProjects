
























 

SELECT   `date`,  `customer`,  `total_cartons`,  `wms_po_`,  `external_po_`,  `multiple_sk_us`,  `qty`,  `vendor`,  `packing_slip_included`,  `sk_us_on_packing_slip`,  `bar_coded_product`,  `item_s_on_carton`,  `mixed_items`,  `scheduled_delivery`,  `existing_sk_us_items`,  `warehouse_labor_hours`,  `_of_people`,  `total_hours_worked`,  `comments`,  `file_name`,  `sheet_name`,  `file_time`,  `cap_client_center`
  FROM ( 

SELECT
    *

  , 
    safe_cast(left(file_name, 2) as string)
 AS `cap_client_center` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`date` AS string)), '') AS string) END as float64)
 AS `date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer` AS string)), '') AS string) END as float64)
 AS `customer`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_cartons` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_cartons` AS string)), '') AS string) END as float64)
 AS `total_cartons`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`wms_po_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`wms_po_` AS string)), '') AS string) END as float64)
 AS `wms_po_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`external_po_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`external_po_` AS string)), '') AS string) END as float64)
 AS `external_po_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`multiple_sk_us` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`multiple_sk_us` AS string)), '') AS string) END as float64)
 AS `multiple_sk_us`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qty` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qty` AS string)), '') AS string) END as float64)
 AS `qty`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vendor` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vendor` AS string)), '') AS string) END as float64)
 AS `vendor`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`packing_slip_included` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`packing_slip_included` AS string)), '') AS string) END as float64)
 AS `packing_slip_included`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sk_us_on_packing_slip` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sk_us_on_packing_slip` AS string)), '') AS string) END as float64)
 AS `sk_us_on_packing_slip`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bar_coded_product` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bar_coded_product` AS string)), '') AS string) END as float64)
 AS `bar_coded_product`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_s_on_carton` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_s_on_carton` AS string)), '') AS string) END as float64)
 AS `item_s_on_carton`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`mixed_items` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`mixed_items` AS string)), '') AS string) END as float64)
 AS `mixed_items`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`scheduled_delivery` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`scheduled_delivery` AS string)), '') AS string) END as float64)
 AS `scheduled_delivery`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`existing_sk_us_items` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`existing_sk_us_items` AS string)), '') AS string) END as float64)
 AS `existing_sk_us_items`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`warehouse_labor_hours` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`warehouse_labor_hours` AS string)), '') AS string) END as float64)
 AS `warehouse_labor_hours`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_of_people` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_of_people` AS string)), '') AS string) END as string)
 AS `_of_people`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_hours_worked` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_hours_worked` AS string)), '') AS string) END as string)
 AS `total_hours_worked`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`comments` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`comments` AS string)), '') AS string) END as float64)
 AS `comments`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sheet_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sheet_name` AS string)), '') AS string) END as string)
 AS `sheet_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`



FROM `ff-stadiumgoods-raw-live`.`imports`.`cap_invoice_non_compliant_receiving` AS source_table

 ) AS source_select_statement

 ) AS un_ordered

