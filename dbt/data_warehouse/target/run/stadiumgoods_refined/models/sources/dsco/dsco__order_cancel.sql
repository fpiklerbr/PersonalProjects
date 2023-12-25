

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`dsco__order_cancel`
  OPTIONS()
  as 



























 

SELECT   `po_number`,  `order_cancel_reason`,  `number_of_line_items`,  `line_item_line_number`,  `line_item_sku`,  `line_item_upc`,  `line_item_ean`,  `line_item_partner_sku`,  `line_item_status_quantity`,  `line_item_original_order_quantity`,  `line_item_cancel_reason`,  `supplier_order_number`,  `consumer_order_number`,  `dsco_order_id`,  `dsco_order_status`,  `dsco_item_id`,  `dsco_supplier_id`,  `dsco_supplier_name`,  `dsco_retailer_id`,  `dsco_retailer_name`,  `dsco_trading_partner_id`,  `dsco_trading_partner_name`,  `dsco_create_date`,  `dsco_last_update_date`,  `file_name`,  `file_timestamp`
  FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`po_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`po_number` AS string)), '') AS string) END as string)
 AS `po_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_cancel_reason` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_cancel_reason` AS string)), '') AS string) END as string)
 AS `order_cancel_reason`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`number_of_line_items` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`number_of_line_items` AS string)), '') AS string) END as string)
 AS `number_of_line_items`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_line_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_line_number` AS string)), '') AS string) END as string)
 AS `line_item_line_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_sku` AS string)), '') AS string) END as string)
 AS `line_item_sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_upc` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_upc` AS string)), '') AS string) END as string)
 AS `line_item_upc`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_ean` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_ean` AS string)), '') AS string) END as string)
 AS `line_item_ean`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_partner_sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_partner_sku` AS string)), '') AS string) END as string)
 AS `line_item_partner_sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_status_quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_status_quantity` AS string)), '') AS string) END as string)
 AS `line_item_status_quantity`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_original_order_quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_original_order_quantity` AS string)), '') AS string) END as string)
 AS `line_item_original_order_quantity`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_cancel_reason` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_cancel_reason` AS string)), '') AS string) END as string)
 AS `line_item_cancel_reason`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`supplier_order_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`supplier_order_number` AS string)), '') AS string) END as string)
 AS `supplier_order_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`consumer_order_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consumer_order_number` AS string)), '') AS string) END as string)
 AS `consumer_order_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_order_id` AS string)), '') AS string) END as string)
 AS `dsco_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_order_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_order_status` AS string)), '') AS string) END as string)
 AS `dsco_order_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_item_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_item_id` AS string)), '') AS string) END as string)
 AS `dsco_item_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_supplier_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_supplier_id` AS string)), '') AS string) END as string)
 AS `dsco_supplier_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_supplier_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_supplier_name` AS string)), '') AS string) END as string)
 AS `dsco_supplier_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_retailer_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_retailer_id` AS string)), '') AS string) END as string)
 AS `dsco_retailer_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_retailer_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_retailer_name` AS string)), '') AS string) END as string)
 AS `dsco_retailer_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_trading_partner_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_trading_partner_id` AS string)), '') AS string) END as string)
 AS `dsco_trading_partner_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_trading_partner_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_trading_partner_name` AS string)), '') AS string) END as string)
 AS `dsco_trading_partner_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_create_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_create_date` AS string)), '') AS string) END as string)
 AS `dsco_create_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_last_update_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_last_update_date` AS string)), '') AS string) END as string)
 AS `dsco_last_update_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_timestamp` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_timestamp` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `file_timestamp`



FROM `ff-stadiumgoods-raw-live`.`imports`.`dsco_order_cancel` AS source_table

 ) AS un_ordered

;

