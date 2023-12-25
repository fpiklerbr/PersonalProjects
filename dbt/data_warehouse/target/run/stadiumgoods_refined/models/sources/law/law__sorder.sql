

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`law__sorder`
  OPTIONS()
  as 

  





































































 

SELECT   `pick_id`,  `x3_order_id`,  `release_flag`,  `reship850_flag`,  `order_type`,  `special_processing_flag`,  `capacity_import_id`,  `po_number`,  `retailer_code`,  `store_number`,  `ship_to_location`,  `client_code`,  `dropship_id`,  `external_customer_id`,  `ship_business_name`,  `ship_name`,  `ship_address1`,  `ship_address2`,  `ship_city`,  `ship_state`,  `ship_zip`,  `ship_country`,  `ship_phone`,  `ship_email`,  `ship_residential_flag`,  `ship_method`,  `third_party_account`,  `signature_required`,  `ship_comment`,  `gift_wrap_flag`,  `gift_from`,  `gift_to`,  `gift_message`,  `bill_business_name`,  `bill_name`,  `bill_address1`,  `bill_address2`,  `bill_city`,  `bill_state`,  `bill_zip`,  `bill_country`,  `bill_phone`,  `payment_terms`,  `order_date`,  `requested_ship_date`,  `cancel_date`,  `requested_delivery_date`,  `delivery_by_date`,  `shipping_amount`,  `shipping_tax_rate`,  `order_discount_rate`,  `order_discount_amount`,  `x3_order_line`,  `item_product_id`,  `item_unit_amount`,  `item_discount_rate`,  `item_tax_rate`,  `item_order_quantity`,  `item_ship_quantity`,  `buyer_item_number`,  `item_product_desc`,  `cod_flag`,  `cod_amount`,  `cod_add_ship_charges`,  `cod_cashier_check`,  `saturday_delivery`,  `end_of_line`,  `file_name`,  `file_time`,  `law_import_id`
  FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pick_ticket_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pick_ticket_id` AS string)), '') AS string) END as string)
 AS `pick_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`master_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`master_order_id` AS string)), '') AS string) END as string)
 AS `x3_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`release_flag` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`release_flag` AS string)), '') AS string) END as string)
 AS `release_flag`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reship850_flag` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reship850_flag` AS string)), '') AS string) END as string)
 AS `reship850_flag`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_type` AS string)), '') AS string) END as string)
 AS `order_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`special_processing_flag` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`special_processing_flag` AS string)), '') AS string) END as string)
 AS `special_processing_flag`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`capacity_import_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`capacity_import_id` AS string)), '') AS string) END as string)
 AS `capacity_import_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`po_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`po_number` AS string)), '') AS string) END as string)
 AS `po_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`retailer_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`retailer_code` AS string)), '') AS string) END as string)
 AS `retailer_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_number` AS string)), '') AS string) END as string)
 AS `store_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_to_location` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_to_location` AS string)), '') AS string) END as string)
 AS `ship_to_location`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`client_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`client_code` AS string)), '') AS string) END as string)
 AS `client_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dropship_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dropship_id` AS string)), '') AS string) END as string)
 AS `dropship_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`external_customer_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`external_customer_id` AS string)), '') AS string) END as string)
 AS `external_customer_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_business_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_business_name` AS string)), '') AS string) END as string)
 AS `ship_business_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_name` AS string)), '') AS string) END as string)
 AS `ship_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_address1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_address1` AS string)), '') AS string) END as string)
 AS `ship_address1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_address2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_address2` AS string)), '') AS string) END as string)
 AS `ship_address2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_city` AS string)), '') AS string) END as string)
 AS `ship_city`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_state` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_state` AS string)), '') AS string) END as string)
 AS `ship_state`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_zip` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_zip` AS string)), '') AS string) END as string)
 AS `ship_zip`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_country` AS string)), '') AS string) END as string)
 AS `ship_country`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_phone` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_phone` AS string)), '') AS string) END as string)
 AS `ship_phone`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_email` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_email` AS string)), '') AS string) END as string)
 AS `ship_email`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_residential_flag` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_residential_flag` AS string)), '') AS string) END as string)
 AS `ship_residential_flag`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_method` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_method` AS string)), '') AS string) END as string)
 AS `ship_method`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`third_party_account` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`third_party_account` AS string)), '') AS string) END as string)
 AS `third_party_account`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`signature_required` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`signature_required` AS string)), '') AS string) END as string)
 AS `signature_required`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_comment` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_comment` AS string)), '') AS string) END as string)
 AS `ship_comment`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gift_wrap_flag` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gift_wrap_flag` AS string)), '') AS string) END as string)
 AS `gift_wrap_flag`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gift_from` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gift_from` AS string)), '') AS string) END as string)
 AS `gift_from`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gift_to` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gift_to` AS string)), '') AS string) END as string)
 AS `gift_to`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gift_message` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gift_message` AS string)), '') AS string) END as string)
 AS `gift_message`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_business_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_business_name` AS string)), '') AS string) END as string)
 AS `bill_business_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_name` AS string)), '') AS string) END as string)
 AS `bill_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_address1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_address1` AS string)), '') AS string) END as string)
 AS `bill_address1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_address2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_address2` AS string)), '') AS string) END as string)
 AS `bill_address2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_city` AS string)), '') AS string) END as string)
 AS `bill_city`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_state` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_state` AS string)), '') AS string) END as string)
 AS `bill_state`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_zip` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_zip` AS string)), '') AS string) END as string)
 AS `bill_zip`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_country` AS string)), '') AS string) END as string)
 AS `bill_country`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_phone` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_phone` AS string)), '') AS string) END as string)
 AS `bill_phone`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payment_terms` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_terms` AS string)), '') AS string) END as string)
 AS `payment_terms`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_date` AS string)), '') AS string) END as string)
 AS `order_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`requested_ship_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`requested_ship_date` AS string)), '') AS string) END as string)
 AS `requested_ship_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cancel_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cancel_date` AS string)), '') AS string) END as string)
 AS `cancel_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`requested_delivery_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`requested_delivery_date` AS string)), '') AS string) END as string)
 AS `requested_delivery_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`delivery_by_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`delivery_by_date` AS string)), '') AS string) END as string)
 AS `delivery_by_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_amount` AS string)), '') AS string) END as string)
 AS `shipping_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_tax_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_tax_rate` AS string)), '') AS string) END as string)
 AS `shipping_tax_rate`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_discount_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_discount_rate` AS string)), '') AS string) END as string)
 AS `order_discount_rate`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_discount_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_discount_amount` AS string)), '') AS string) END as string)
 AS `order_discount_amount`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_line_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_line_number` AS string)), '') AS string) END as float64)
 as int64)
 AS `x3_order_line`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_product_id` AS string)), '') AS string) END as string)
 AS `item_product_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_unit_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_unit_amount` AS string)), '') AS string) END as string)
 AS `item_unit_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_discount_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_discount_rate` AS string)), '') AS string) END as string)
 AS `item_discount_rate`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_tax_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_tax_rate` AS string)), '') AS string) END as string)
 AS `item_tax_rate`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_order_quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_order_quantity` AS string)), '') AS string) END as string)
 AS `item_order_quantity`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_ship_quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_ship_quantity` AS string)), '') AS string) END as string)
 AS `item_ship_quantity`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`buyer_item_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`buyer_item_number` AS string)), '') AS string) END as string)
 AS `buyer_item_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_product_desc` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_product_desc` AS string)), '') AS string) END as string)
 AS `item_product_desc`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cod_flag` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cod_flag` AS string)), '') AS string) END as string)
 AS `cod_flag`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cod_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cod_amount` AS string)), '') AS string) END as string)
 AS `cod_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cod_add_ship_charges` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cod_add_ship_charges` AS string)), '') AS string) END as string)
 AS `cod_add_ship_charges`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cod_cashier_check` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cod_cashier_check` AS string)), '') AS string) END as string)
 AS `cod_cashier_check`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`saturday_delivery` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`saturday_delivery` AS string)), '') AS string) END as string)
 AS `saturday_delivery`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`end_of_line` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`end_of_line` AS string)), '') AS string) END as string)
 AS `end_of_line`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`law_import_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`law_import_id` AS string)), '') AS string) END as string)
 AS `law_import_id`



FROM `ff-stadiumgoods-raw-live`.`imports`.`law_sorder` AS source_table

 ) AS un_ordered

;

