






























































































































 

SELECT   `po_number`,  `number_of_line_items`,  `line_item_line_number`,  `line_item_sku`,  `line_item_upc`,  `line_item_ean`,  `line_item_partner_sku`,  `line_item_quantity`,  `line_item_title`,  `line_item_color`,  `line_item_size`,  `line_item_expected_cost`,  `line_item_consumer_price`,  `line_item_personalization`,  `line_item_warehouse_code`,  `line_item_receipt_id`,  `line_item_gift_flag`,  `line_item_gift_receipt_id`,  `line_item_gift_to_name`,  `line_item_gift_from_name`,  `line_item_gift_message`,  `line_item_retail_price`,  `line_item_shipping_surcharge`,  `line_item_packing_slip_message`,  `line_item_packing_instructions`,  `line_item_returns_message`,  `line_item_ship_instructions`,  `line_item_message`,  `line_item_bogo_flag`,  `line_item_bogo_instructions`,  `line_item_tax_percentage_1`,  `line_item_tax_type_code_1`,  `line_item_tax_percentage_2`,  `line_item_tax_type_code_2`,  `line_item_tax_percentage_3`,  `line_item_tax_type_code_3`,  `ship_attention`,  `ship_first_name`,  `ship_last_name`,  `ship_company`,  `ship_address_1`,  `ship_address_2`,  `ship_city`,  `ship_region`,  `ship_postal`,  `ship_country`,  `ship_phone`,  `ship_email`,  `ship_store_number`,  `ship_carrier`,  `ship_method`,  `shipping_service_level_code`,  `expected_delivery_date`,  `required_delivery_date`,  `signature_required_flag`,  `ship_instructions`,  `retailer_create_date`,  `channel`,  `test_flag`,  `consumer_order_number`,  `currency_code`,  `marketing_message`,  `packing_instructions`,  `returns_message`,  `message`,  `gift_flag`,  `gift_message`,  `gift_to_name`,  `gift_from_name`,  `receipt_id`,  `gift_receipt_id`,  `shipping_surcharge`,  `tax_percentage_1`,  `tax_type_code_1`,  `tax_percentage_2`,  `tax_type_code_2`,  `tax_percentage_3`,  `tax_type_code_3`,  `coupon_amount_1`,  `coupon_percentage_1`,  `coupon_amount_2`,  `coupon_percentage_2`,  `coupon_amount_3`,  `coupon_percentage_3`,  `payment_card_type_1`,  `payment_card_last_four_1`,  `payment_card_type_2`,  `payment_card_last_four_2`,  `payment_card_type_3`,  `payment_card_last_four_3`,  `bill_to_attention`,  `bill_to_first_name`,  `bill_to_last_name`,  `bill_to_company`,  `bill_to_address_1`,  `bill_to_address_2`,  `bill_to_city`,  `bill_to_region`,  `bill_to_postal`,  `bill_to_country`,  `bill_to_phone`,  `bill_to_email`,  `acknowledge_by_date`,  `cancel_after_date`,  `ship_by_date`,  `invoice_by_date`,  `dsco_ship_carrier`,  `dsco_ship_method`,  `dsco_shipping_service_level_code`,  `retailer_ship_carrier`,  `retailer_ship_method`,  `retailer_shipping_service_level_code`,  `dsco_order_id`,  `dsco_order_status`,  `dsco_item_id`,  `dsco_supplier_id`,  `dsco_supplier_name`,  `dsco_retailer_id`,  `dsco_retailer_name`,  `dsco_trading_partner_id`,  `dsco_trading_partner_name`,  `dsco_create_date`,  `dsco_last_update_date`,  `file_name`,  `file_timestamp`
  FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`po_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`po_number` AS string)), '') AS string) END as string)
 AS `po_number`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_title` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_title` AS string)), '') AS string) END as string)
 AS `line_item_title`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_color` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_color` AS string)), '') AS string) END as string)
 AS `line_item_color`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_size` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_size` AS string)), '') AS string) END as string)
 AS `line_item_size`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_expected_cost` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_expected_cost` AS string)), '') AS string) END as string)
 AS `line_item_expected_cost`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_consumer_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_consumer_price` AS string)), '') AS string) END as string)
 AS `line_item_consumer_price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_personalization` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_personalization` AS string)), '') AS string) END as string)
 AS `line_item_personalization`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_warehouse_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_warehouse_code` AS string)), '') AS string) END as string)
 AS `line_item_warehouse_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_receipt_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_receipt_id` AS string)), '') AS string) END as string)
 AS `line_item_receipt_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_gift_flag` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_gift_flag` AS string)), '') AS string) END as string)
 AS `line_item_gift_flag`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_gift_receipt_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_gift_receipt_id` AS string)), '') AS string) END as string)
 AS `line_item_gift_receipt_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_gift_to_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_gift_to_name` AS string)), '') AS string) END as string)
 AS `line_item_gift_to_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_gift_from_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_gift_from_name` AS string)), '') AS string) END as string)
 AS `line_item_gift_from_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_gift_message` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_gift_message` AS string)), '') AS string) END as string)
 AS `line_item_gift_message`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_retail_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_retail_price` AS string)), '') AS string) END as string)
 AS `line_item_retail_price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_shipping_surcharge` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_shipping_surcharge` AS string)), '') AS string) END as string)
 AS `line_item_shipping_surcharge`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_packing_slip_message` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_packing_slip_message` AS string)), '') AS string) END as string)
 AS `line_item_packing_slip_message`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_packing_instructions` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_packing_instructions` AS string)), '') AS string) END as string)
 AS `line_item_packing_instructions`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_returns_message` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_returns_message` AS string)), '') AS string) END as string)
 AS `line_item_returns_message`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_ship_instructions` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_ship_instructions` AS string)), '') AS string) END as string)
 AS `line_item_ship_instructions`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_message` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_message` AS string)), '') AS string) END as string)
 AS `line_item_message`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_bogo_flag` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_bogo_flag` AS string)), '') AS string) END as string)
 AS `line_item_bogo_flag`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_bogo_instructions` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_bogo_instructions` AS string)), '') AS string) END as string)
 AS `line_item_bogo_instructions`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_tax_percentage_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_tax_percentage_1` AS string)), '') AS string) END as string)
 AS `line_item_tax_percentage_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_tax_type_code_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_tax_type_code_1` AS string)), '') AS string) END as string)
 AS `line_item_tax_type_code_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_tax_percentage_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_tax_percentage_2` AS string)), '') AS string) END as string)
 AS `line_item_tax_percentage_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_tax_type_code_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_tax_type_code_2` AS string)), '') AS string) END as string)
 AS `line_item_tax_type_code_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_tax_percentage_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_tax_percentage_3` AS string)), '') AS string) END as string)
 AS `line_item_tax_percentage_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_tax_type_code_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_tax_type_code_3` AS string)), '') AS string) END as string)
 AS `line_item_tax_type_code_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_attention` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_attention` AS string)), '') AS string) END as string)
 AS `ship_attention`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_first_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_first_name` AS string)), '') AS string) END as string)
 AS `ship_first_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_last_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_last_name` AS string)), '') AS string) END as string)
 AS `ship_last_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_company` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_company` AS string)), '') AS string) END as string)
 AS `ship_company`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_address_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_address_1` AS string)), '') AS string) END as string)
 AS `ship_address_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_address_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_address_2` AS string)), '') AS string) END as string)
 AS `ship_address_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_city` AS string)), '') AS string) END as string)
 AS `ship_city`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_region` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_region` AS string)), '') AS string) END as string)
 AS `ship_region`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_postal` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_postal` AS string)), '') AS string) END as string)
 AS `ship_postal`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_store_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_store_number` AS string)), '') AS string) END as string)
 AS `ship_store_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_carrier` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_carrier` AS string)), '') AS string) END as string)
 AS `ship_carrier`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_method` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_method` AS string)), '') AS string) END as string)
 AS `ship_method`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_service_level_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_service_level_code` AS string)), '') AS string) END as string)
 AS `shipping_service_level_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`expected_delivery_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`expected_delivery_date` AS string)), '') AS string) END as string)
 AS `expected_delivery_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`required_delivery_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`required_delivery_date` AS string)), '') AS string) END as string)
 AS `required_delivery_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`signature_required_flag` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`signature_required_flag` AS string)), '') AS string) END as string)
 AS `signature_required_flag`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_instructions` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_instructions` AS string)), '') AS string) END as string)
 AS `ship_instructions`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`retailer_create_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`retailer_create_date` AS string)), '') AS string) END as string)
 AS `retailer_create_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`channel` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`channel` AS string)), '') AS string) END as string)
 AS `channel`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`test_flag` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`test_flag` AS string)), '') AS string) END as string)
 AS `test_flag`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`consumer_order_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consumer_order_number` AS string)), '') AS string) END as string)
 AS `consumer_order_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`currency_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`currency_code` AS string)), '') AS string) END as string)
 AS `currency_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`marketing_message` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`marketing_message` AS string)), '') AS string) END as string)
 AS `marketing_message`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`packing_instructions` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`packing_instructions` AS string)), '') AS string) END as string)
 AS `packing_instructions`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`returns_message` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`returns_message` AS string)), '') AS string) END as string)
 AS `returns_message`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`message` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`message` AS string)), '') AS string) END as string)
 AS `message`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gift_flag` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gift_flag` AS string)), '') AS string) END as string)
 AS `gift_flag`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gift_message` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gift_message` AS string)), '') AS string) END as string)
 AS `gift_message`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gift_to_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gift_to_name` AS string)), '') AS string) END as string)
 AS `gift_to_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gift_from_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gift_from_name` AS string)), '') AS string) END as string)
 AS `gift_from_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`receipt_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`receipt_id` AS string)), '') AS string) END as string)
 AS `receipt_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gift_receipt_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gift_receipt_id` AS string)), '') AS string) END as string)
 AS `gift_receipt_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_surcharge` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_surcharge` AS string)), '') AS string) END as string)
 AS `shipping_surcharge`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_percentage_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_percentage_1` AS string)), '') AS string) END as string)
 AS `tax_percentage_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_type_code_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_type_code_1` AS string)), '') AS string) END as string)
 AS `tax_type_code_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_percentage_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_percentage_2` AS string)), '') AS string) END as string)
 AS `tax_percentage_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_type_code_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_type_code_2` AS string)), '') AS string) END as string)
 AS `tax_type_code_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_percentage_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_percentage_3` AS string)), '') AS string) END as string)
 AS `tax_percentage_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_type_code_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_type_code_3` AS string)), '') AS string) END as string)
 AS `tax_type_code_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`coupon_amount_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`coupon_amount_1` AS string)), '') AS string) END as string)
 AS `coupon_amount_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`coupon_percentage_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`coupon_percentage_1` AS string)), '') AS string) END as string)
 AS `coupon_percentage_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`coupon_amount_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`coupon_amount_2` AS string)), '') AS string) END as string)
 AS `coupon_amount_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`coupon_percentage_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`coupon_percentage_2` AS string)), '') AS string) END as string)
 AS `coupon_percentage_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`coupon_amount_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`coupon_amount_3` AS string)), '') AS string) END as string)
 AS `coupon_amount_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`coupon_percentage_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`coupon_percentage_3` AS string)), '') AS string) END as string)
 AS `coupon_percentage_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payment_card_type_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_card_type_1` AS string)), '') AS string) END as string)
 AS `payment_card_type_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payment_card_last_four_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_card_last_four_1` AS string)), '') AS string) END as string)
 AS `payment_card_last_four_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payment_card_type_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_card_type_2` AS string)), '') AS string) END as string)
 AS `payment_card_type_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payment_card_last_four_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_card_last_four_2` AS string)), '') AS string) END as string)
 AS `payment_card_last_four_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payment_card_type_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_card_type_3` AS string)), '') AS string) END as string)
 AS `payment_card_type_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payment_card_last_four_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_card_last_four_3` AS string)), '') AS string) END as string)
 AS `payment_card_last_four_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_to_attention` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_to_attention` AS string)), '') AS string) END as string)
 AS `bill_to_attention`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_to_first_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_to_first_name` AS string)), '') AS string) END as string)
 AS `bill_to_first_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_to_last_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_to_last_name` AS string)), '') AS string) END as string)
 AS `bill_to_last_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_to_company` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_to_company` AS string)), '') AS string) END as string)
 AS `bill_to_company`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_to_address_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_to_address_1` AS string)), '') AS string) END as string)
 AS `bill_to_address_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_to_address_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_to_address_2` AS string)), '') AS string) END as string)
 AS `bill_to_address_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_to_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_to_city` AS string)), '') AS string) END as string)
 AS `bill_to_city`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_to_region` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_to_region` AS string)), '') AS string) END as string)
 AS `bill_to_region`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_to_postal` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_to_postal` AS string)), '') AS string) END as string)
 AS `bill_to_postal`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_to_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_to_country` AS string)), '') AS string) END as string)
 AS `bill_to_country`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_to_phone` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_to_phone` AS string)), '') AS string) END as string)
 AS `bill_to_phone`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_to_email` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_to_email` AS string)), '') AS string) END as string)
 AS `bill_to_email`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`acknowledge_by_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`acknowledge_by_date` AS string)), '') AS string) END as string)
 AS `acknowledge_by_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cancel_after_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cancel_after_date` AS string)), '') AS string) END as string)
 AS `cancel_after_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_by_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_by_date` AS string)), '') AS string) END as string)
 AS `ship_by_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_by_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_by_date` AS string)), '') AS string) END as string)
 AS `invoice_by_date`

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



FROM `ff-stadiumgoods-raw-live`.`imports`.`dsco_order` AS source_table

 ) AS un_ordered

