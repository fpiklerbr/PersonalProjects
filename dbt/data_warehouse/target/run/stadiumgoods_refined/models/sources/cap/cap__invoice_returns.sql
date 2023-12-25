

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`cap__invoice_returns`
  OPTIONS()
  as 

























 

SELECT   `client_name`,  `log_date`,  `order_`,  `ra_client_ref_`,  `customer`,  `sku`,  `description`,  `total_products_rec_d`,  `qty_bts`,  `qty_rfd`,  `qty_dmg`,  `reason_for_return_comments_if_provided_`,  `po`,  `unnamed_13`,  `postage_due`,  `file_name`,  `sheet_name`,  `file_time`,  `cap_client_center`
    , `_raw_tracking_number`
    , `_raw_lot_`
    , `_raw_epiration_date_`
    , `_raw_usps_surcharge`
    , `_raw_requested_ship_method`
  FROM ( 

SELECT
    *

  , 
    safe_cast(left(file_name, 2) as string)
 AS `cap_client_center` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`client_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`client_name` AS string)), '') AS string) END as string)
 AS `client_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`log_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`log_date` AS string)), '') AS string) END as string)
 AS `log_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_` AS string)), '') AS string) END as string)
 AS `order_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ra_client_ref_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ra_client_ref_` AS string)), '') AS string) END as string)
 AS `ra_client_ref_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer` AS string)), '') AS string) END as string)
 AS `customer`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sku` AS string)), '') AS string) END as string)
 AS `sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`description` AS string)), '') AS string) END as string)
 AS `description`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_products_rec_d` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_products_rec_d` AS string)), '') AS string) END as string)
 AS `total_products_rec_d`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qty_bts` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qty_bts` AS string)), '') AS string) END as string)
 AS `qty_bts`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qty_rfd` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qty_rfd` AS string)), '') AS string) END as string)
 AS `qty_rfd`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qty_dmg` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qty_dmg` AS string)), '') AS string) END as string)
 AS `qty_dmg`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reason_for_return_comments_if_provided_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reason_for_return_comments_if_provided_` AS string)), '') AS string) END as string)
 AS `reason_for_return_comments_if_provided_`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`po` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`po` AS string)), '') AS string) END as string)
 AS `po`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`unnamed_13` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`unnamed_13` AS string)), '') AS string) END as string)
 AS `unnamed_13`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`postage_due` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`postage_due` AS string)), '') AS string) END as string)
 AS `postage_due`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sheet_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sheet_name` AS string)), '') AS string) END as string)
 AS `sheet_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`


  , `tracking_number` AS `_raw_tracking_number`

  , `lot_` AS `_raw_lot_`

  , `epiration_date_` AS `_raw_epiration_date_`

  , `usps_surcharge` AS `_raw_usps_surcharge`

  , `requested_ship_method` AS `_raw_requested_ship_method`


FROM `ff-stadiumgoods-raw-live`.`imports`.`cap_invoice_returns` AS source_table

 ) AS source_select_statement

 ) AS un_ordered

;

