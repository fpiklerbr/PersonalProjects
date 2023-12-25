

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`dsco__shipment`
  OPTIONS()
  as 












































































 

SELECT   `po_number`,  `package_tracking_number`,  `package_ship_carrier`,  `package_ship_method`,  `shipping_service_level_code`,  `package_ship_cost`,  `package_ship_date`,  `number_of_line_items`,  `line_item_line_number`,  `line_item_sku`,  `line_item_upc`,  `line_item_ean`,  `line_item_partner_sku`,  `line_item_quantity`,  `line_item_original_quantity`,  `supplier_order_number`,  `consumer_order_number`,  `currency_code`,  `ship_to_attention`,  `ship_to_first_name`,  `ship_to_last_name`,  `ship_to_company`,  `ship_to_address_1`,  `ship_to_address_2`,  `ship_to_city`,  `ship_to_region`,  `ship_to_postal`,  `ship_to_country`,  `ship_to_phone`,  `ship_to_email`,  `ship_to_store_number`,  `ship_from_attention`,  `ship_from_first_name`,  `ship_from_last_name`,  `ship_from_company`,  `ship_from_address_1`,  `ship_from_address_2`,  `ship_from_city`,  `ship_from_region`,  `ship_from_postal`,  `ship_from_country`,  `ship_from_phone`,  `ship_from_email`,  `ship_from_location_code`,  `dsco_ship_carrier`,  `dsco_ship_method`,  `dsco_shipping_service_level_code`,  `retailer_ship_carrier`,  `retailer_ship_method`,  `retailer_shipping_service_level_code`,  `retailer_expected_delivery_date`,  `retailer_required_delivery_date`,  `dsco_actual_ship_carrier`,  `dsco_actual_ship_method`,  `dsco_actual_shipping_service_level_code`,  `dsco_actual_ship_cost`,  `dsco_actual_delivery_date`,  `dsco_actual_pickup_date`,  `dsco_package_id`,  `dsco_order_id`,  `dsco_order_status`,  `dsco_item_id`,  `dsco_supplier_id`,  `dsco_supplier_name`,  `dsco_retailer_id`,  `dsco_retailer_name`,  `dsco_trading_partner_id`,  `dsco_trading_partner_name`,  `dsco_requested_ship_carrier`,  `dsco_requested_ship_method`,  `dsco_requested_shipping_service_level_code`,  `dsco_create_date`,  `dsco_last_update_date`,  `file_name`,  `file_timestamp`
  FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`po_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`po_number` AS string)), '') AS string) END as string)
 AS `po_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`package_tracking_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`package_tracking_number` AS string)), '') AS string) END as string)
 AS `package_tracking_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`package_ship_carrier` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`package_ship_carrier` AS string)), '') AS string) END as string)
 AS `package_ship_carrier`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`package_ship_method` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`package_ship_method` AS string)), '') AS string) END as string)
 AS `package_ship_method`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_service_level_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_service_level_code` AS string)), '') AS string) END as string)
 AS `shipping_service_level_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`package_ship_cost` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`package_ship_cost` AS string)), '') AS string) END as string)
 AS `package_ship_cost`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`package_ship_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`package_ship_date` AS string)), '') AS string) END as string)
 AS `package_ship_date`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_quantity` AS string)), '') AS string) END as string)
 AS `line_item_quantity`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_original_quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_original_quantity` AS string)), '') AS string) END as string)
 AS `line_item_original_quantity`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`supplier_order_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`supplier_order_number` AS string)), '') AS string) END as string)
 AS `supplier_order_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`consumer_order_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consumer_order_number` AS string)), '') AS string) END as string)
 AS `consumer_order_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`currency_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`currency_code` AS string)), '') AS string) END as string)
 AS `currency_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_to_attention` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_to_attention` AS string)), '') AS string) END as string)
 AS `ship_to_attention`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_to_first_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_to_first_name` AS string)), '') AS string) END as string)
 AS `ship_to_first_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_to_last_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_to_last_name` AS string)), '') AS string) END as string)
 AS `ship_to_last_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_to_company` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_to_company` AS string)), '') AS string) END as string)
 AS `ship_to_company`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_to_address_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_to_address_1` AS string)), '') AS string) END as string)
 AS `ship_to_address_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_to_address_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_to_address_2` AS string)), '') AS string) END as string)
 AS `ship_to_address_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_to_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_to_city` AS string)), '') AS string) END as string)
 AS `ship_to_city`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_to_region` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_to_region` AS string)), '') AS string) END as string)
 AS `ship_to_region`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_to_postal` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_to_postal` AS string)), '') AS string) END as string)
 AS `ship_to_postal`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_to_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_to_country` AS string)), '') AS string) END as string)
 AS `ship_to_country`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_to_phone` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_to_phone` AS string)), '') AS string) END as string)
 AS `ship_to_phone`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_to_email` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_to_email` AS string)), '') AS string) END as string)
 AS `ship_to_email`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_to_store_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_to_store_number` AS string)), '') AS string) END as string)
 AS `ship_to_store_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_from_attention` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_from_attention` AS string)), '') AS string) END as string)
 AS `ship_from_attention`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_from_first_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_from_first_name` AS string)), '') AS string) END as string)
 AS `ship_from_first_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_from_last_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_from_last_name` AS string)), '') AS string) END as string)
 AS `ship_from_last_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_from_company` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_from_company` AS string)), '') AS string) END as string)
 AS `ship_from_company`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_from_address_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_from_address_1` AS string)), '') AS string) END as string)
 AS `ship_from_address_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_from_address_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_from_address_2` AS string)), '') AS string) END as string)
 AS `ship_from_address_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_from_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_from_city` AS string)), '') AS string) END as string)
 AS `ship_from_city`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_from_region` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_from_region` AS string)), '') AS string) END as string)
 AS `ship_from_region`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_from_postal` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_from_postal` AS string)), '') AS string) END as string)
 AS `ship_from_postal`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_from_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_from_country` AS string)), '') AS string) END as string)
 AS `ship_from_country`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_from_phone` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_from_phone` AS string)), '') AS string) END as string)
 AS `ship_from_phone`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_from_email` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_from_email` AS string)), '') AS string) END as string)
 AS `ship_from_email`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_from_location_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_from_location_code` AS string)), '') AS string) END as string)
 AS `ship_from_location_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_ship_carrier` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_ship_carrier` AS string)), '') AS string) END as string)
 AS `dsco_ship_carrier`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_ship_method` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_ship_method` AS string)), '') AS string) END as string)
 AS `dsco_ship_method`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_shipping_service_level_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_shipping_service_level_code` AS string)), '') AS string) END as string)
 AS `dsco_shipping_service_level_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`retailer_ship_carrier` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`retailer_ship_carrier` AS string)), '') AS string) END as string)
 AS `retailer_ship_carrier`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`retailer_ship_method` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`retailer_ship_method` AS string)), '') AS string) END as string)
 AS `retailer_ship_method`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`retailer_shipping_service_level_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`retailer_shipping_service_level_code` AS string)), '') AS string) END as string)
 AS `retailer_shipping_service_level_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`retailer_expected_delivery_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`retailer_expected_delivery_date` AS string)), '') AS string) END as string)
 AS `retailer_expected_delivery_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`retailer_required_delivery_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`retailer_required_delivery_date` AS string)), '') AS string) END as string)
 AS `retailer_required_delivery_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_actual_ship_carrier` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_actual_ship_carrier` AS string)), '') AS string) END as string)
 AS `dsco_actual_ship_carrier`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_actual_ship_method` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_actual_ship_method` AS string)), '') AS string) END as string)
 AS `dsco_actual_ship_method`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_actual_shipping_service_level_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_actual_shipping_service_level_code` AS string)), '') AS string) END as string)
 AS `dsco_actual_shipping_service_level_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_actual_ship_cost` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_actual_ship_cost` AS string)), '') AS string) END as string)
 AS `dsco_actual_ship_cost`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_actual_delivery_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_actual_delivery_date` AS string)), '') AS string) END as string)
 AS `dsco_actual_delivery_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_actual_pickup_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_actual_pickup_date` AS string)), '') AS string) END as string)
 AS `dsco_actual_pickup_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_package_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_package_id` AS string)), '') AS string) END as string)
 AS `dsco_package_id`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_requested_ship_carrier` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_requested_ship_carrier` AS string)), '') AS string) END as string)
 AS `dsco_requested_ship_carrier`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_requested_ship_method` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_requested_ship_method` AS string)), '') AS string) END as string)
 AS `dsco_requested_ship_method`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_requested_shipping_service_level_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_requested_shipping_service_level_code` AS string)), '') AS string) END as string)
 AS `dsco_requested_shipping_service_level_code`

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



FROM `ff-stadiumgoods-raw-live`.`imports`.`dsco_shipment` AS source_table

 ) AS un_ordered

;

