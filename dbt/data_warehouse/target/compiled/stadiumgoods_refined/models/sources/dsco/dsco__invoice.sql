




















































































































 

SELECT   `invoice_id`,  `po_number`,  `invoice_total_amount`,  `invoice_date`,  `invoice_currency_code`,  `invoice_subtotal_excluding_line_items`,  `invoice_line_items_subtotal`,  `invoice_handling_amount`,  `invoice_freight_amount`,  `invoice_sales_tax_amount`,  `invoice_number_of_line_items`,  `line_item_line_number`,  `line_item_sku`,  `line_item_upc`,  `line_item_ean`,  `line_item_partner_sku`,  `line_item_title`,  `line_item_unit_price`,  `line_item_basis_of_unit_price`,  `line_item_quantity`,  `line_item_original_quantity`,  `line_item_unit_of_measure`,  `line_item_extended_amount`,  `line_item_handling_amount`,  `line_item_ship_date`,  `line_item_tracking_number`,  `line_item_ship_amount`,  `line_item_ship_carrier`,  `line_item_ship_method`,  `line_item_shipping_service_level_code`,  `line_item_dsco_package_id`,  `line_item_ship_weight`,  `line_item_ship_weight_units`,  `line_item_promotion_reference`,  `line_item_promotion_amount`,  `line_item_tax_amount`,  `line_item_subtotal`,  `invoice_charge_title_1`,  `invoice_charge_amount_1`,  `invoice_charge_title_2`,  `invoice_charge_amount_2`,  `invoice_charge_title_3`,  `invoice_charge_amount_3`,  `invoice_total_amount_subject_to_terms_discount`,  `invoice_terms_type`,  `invoice_terms_basis_date`,  `invoice_terms_discount_percent`,  `invoice_terms_discount_due_date`,  `invoice_terms_discount_days_due`,  `invoice_terms_net_due_date`,  `invoice_terms_net_days`,  `invoice_terms_discount_amount`,  `invoice_terms_day_of_month`,  `ship_from_attention`,  `ship_from_first_name`,  `ship_from_last_name`,  `ship_from_company`,  `ship_from_address_1`,  `ship_from_address_2`,  `ship_from_city`,  `ship_from_region`,  `ship_from_postal`,  `ship_from_country`,  `ship_from_phone`,  `ship_from_email`,  `ship_from_location_code`,  `ship_to_attention`,  `ship_to_first_name`,  `ship_to_last_name`,  `ship_to_company`,  `ship_to_address_1`,  `ship_to_address_2`,  `ship_to_city`,  `ship_to_region`,  `ship_to_postal`,  `ship_to_country`,  `ship_to_phone`,  `ship_to_email`,  `ship_to_store_number`,  `ship_number_of_units_shipped`,  `ship_unit_of_measurement_code`,  `ship_weight`,  `ship_weight_units`,  `ship_date`,  `ship_tracking_number`,  `dsco_package_id`,  `ship_carrier`,  `ship_method`,  `shipping_service_level_code`,  `ship_transportation_method_code`,  `ship_reference_number_qualifier`,  `invoice_buyer_id`,  `invoice_seller_id`,  `invoice_seller_invoice_number`,  `supplier_order_number`,  `consumer_order_number`,  `external_batch_id`,  `dsco_invoice_id`,  `dsco_order_id`,  `dsco_item_id`,  `dsco_invoice_status`,  `dsco_expected_line_item_amount`,  `dsco_expected_line_item_difference`,  `dsco_expected_order_total_amount`,  `dsco_expected_order_total_difference`,  `dsco_supplier_id`,  `dsco_supplier_name`,  `dsco_retailer_id`,  `dsco_retailer_name`,  `dsco_trading_partner_id`,  `dsco_trading_partner_name`,  `dsco_invoice_create_date`,  `dsco_invoice_last_update_date`,  `file_name`,  `file_timestamp`
  FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_id` AS string)), '') AS string) END as string)
 AS `invoice_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`po_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`po_number` AS string)), '') AS string) END as string)
 AS `po_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_total_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_total_amount` AS string)), '') AS string) END as string)
 AS `invoice_total_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_date` AS string)), '') AS string) END as string)
 AS `invoice_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_currency_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_currency_code` AS string)), '') AS string) END as string)
 AS `invoice_currency_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_subtotal_excluding_line_items` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_subtotal_excluding_line_items` AS string)), '') AS string) END as string)
 AS `invoice_subtotal_excluding_line_items`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_line_items_subtotal` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_line_items_subtotal` AS string)), '') AS string) END as string)
 AS `invoice_line_items_subtotal`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_handling_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_handling_amount` AS string)), '') AS string) END as string)
 AS `invoice_handling_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_freight_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_freight_amount` AS string)), '') AS string) END as string)
 AS `invoice_freight_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_sales_tax_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_sales_tax_amount` AS string)), '') AS string) END as string)
 AS `invoice_sales_tax_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_number_of_line_items` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_number_of_line_items` AS string)), '') AS string) END as string)
 AS `invoice_number_of_line_items`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_title` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_title` AS string)), '') AS string) END as string)
 AS `line_item_title`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_unit_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_unit_price` AS string)), '') AS string) END as string)
 AS `line_item_unit_price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_basis_of_unit_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_basis_of_unit_price` AS string)), '') AS string) END as string)
 AS `line_item_basis_of_unit_price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_quantity` AS string)), '') AS string) END as string)
 AS `line_item_quantity`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_original_quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_original_quantity` AS string)), '') AS string) END as string)
 AS `line_item_original_quantity`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_unit_of_measure` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_unit_of_measure` AS string)), '') AS string) END as string)
 AS `line_item_unit_of_measure`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_extended_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_extended_amount` AS string)), '') AS string) END as string)
 AS `line_item_extended_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_handling_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_handling_amount` AS string)), '') AS string) END as string)
 AS `line_item_handling_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_ship_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_ship_date` AS string)), '') AS string) END as string)
 AS `line_item_ship_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_tracking_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_tracking_number` AS string)), '') AS string) END as string)
 AS `line_item_tracking_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_ship_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_ship_amount` AS string)), '') AS string) END as string)
 AS `line_item_ship_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_ship_carrier` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_ship_carrier` AS string)), '') AS string) END as string)
 AS `line_item_ship_carrier`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_ship_method` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_ship_method` AS string)), '') AS string) END as string)
 AS `line_item_ship_method`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_shipping_service_level_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_shipping_service_level_code` AS string)), '') AS string) END as string)
 AS `line_item_shipping_service_level_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_dsco_package_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_dsco_package_id` AS string)), '') AS string) END as string)
 AS `line_item_dsco_package_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_ship_weight` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_ship_weight` AS string)), '') AS string) END as string)
 AS `line_item_ship_weight`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_ship_weight_units` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_ship_weight_units` AS string)), '') AS string) END as string)
 AS `line_item_ship_weight_units`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_promotion_reference` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_promotion_reference` AS string)), '') AS string) END as string)
 AS `line_item_promotion_reference`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_promotion_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_promotion_amount` AS string)), '') AS string) END as string)
 AS `line_item_promotion_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_tax_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_tax_amount` AS string)), '') AS string) END as string)
 AS `line_item_tax_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_item_subtotal` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_item_subtotal` AS string)), '') AS string) END as string)
 AS `line_item_subtotal`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_charge_title_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_charge_title_1` AS string)), '') AS string) END as string)
 AS `invoice_charge_title_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_charge_amount_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_charge_amount_1` AS string)), '') AS string) END as string)
 AS `invoice_charge_amount_1`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_charge_title_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_charge_title_2` AS string)), '') AS string) END as string)
 AS `invoice_charge_title_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_charge_amount_2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_charge_amount_2` AS string)), '') AS string) END as string)
 AS `invoice_charge_amount_2`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_charge_title_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_charge_title_3` AS string)), '') AS string) END as string)
 AS `invoice_charge_title_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_charge_amount_3` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_charge_amount_3` AS string)), '') AS string) END as string)
 AS `invoice_charge_amount_3`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_total_amount_subject_to_terms_discount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_total_amount_subject_to_terms_discount` AS string)), '') AS string) END as string)
 AS `invoice_total_amount_subject_to_terms_discount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_terms_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_terms_type` AS string)), '') AS string) END as string)
 AS `invoice_terms_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_terms_basis_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_terms_basis_date` AS string)), '') AS string) END as string)
 AS `invoice_terms_basis_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_terms_discount_percent` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_terms_discount_percent` AS string)), '') AS string) END as string)
 AS `invoice_terms_discount_percent`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_terms_discount_due_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_terms_discount_due_date` AS string)), '') AS string) END as string)
 AS `invoice_terms_discount_due_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_terms_discount_days_due` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_terms_discount_days_due` AS string)), '') AS string) END as string)
 AS `invoice_terms_discount_days_due`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_terms_net_due_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_terms_net_due_date` AS string)), '') AS string) END as string)
 AS `invoice_terms_net_due_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_terms_net_days` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_terms_net_days` AS string)), '') AS string) END as string)
 AS `invoice_terms_net_days`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_terms_discount_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_terms_discount_amount` AS string)), '') AS string) END as string)
 AS `invoice_terms_discount_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_terms_day_of_month` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_terms_day_of_month` AS string)), '') AS string) END as string)
 AS `invoice_terms_day_of_month`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_number_of_units_shipped` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_number_of_units_shipped` AS string)), '') AS string) END as string)
 AS `ship_number_of_units_shipped`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_unit_of_measurement_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_unit_of_measurement_code` AS string)), '') AS string) END as string)
 AS `ship_unit_of_measurement_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_weight` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_weight` AS string)), '') AS string) END as string)
 AS `ship_weight`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_weight_units` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_weight_units` AS string)), '') AS string) END as string)
 AS `ship_weight_units`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_date` AS string)), '') AS string) END as string)
 AS `ship_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_tracking_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_tracking_number` AS string)), '') AS string) END as string)
 AS `ship_tracking_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_package_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_package_id` AS string)), '') AS string) END as string)
 AS `dsco_package_id`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_transportation_method_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_transportation_method_code` AS string)), '') AS string) END as string)
 AS `ship_transportation_method_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_reference_number_qualifier` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_reference_number_qualifier` AS string)), '') AS string) END as string)
 AS `ship_reference_number_qualifier`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_buyer_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_buyer_id` AS string)), '') AS string) END as string)
 AS `invoice_buyer_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_seller_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_seller_id` AS string)), '') AS string) END as string)
 AS `invoice_seller_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_seller_invoice_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_seller_invoice_number` AS string)), '') AS string) END as string)
 AS `invoice_seller_invoice_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`supplier_order_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`supplier_order_number` AS string)), '') AS string) END as string)
 AS `supplier_order_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`consumer_order_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consumer_order_number` AS string)), '') AS string) END as string)
 AS `consumer_order_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`external_batch_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`external_batch_id` AS string)), '') AS string) END as string)
 AS `external_batch_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_invoice_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_invoice_id` AS string)), '') AS string) END as string)
 AS `dsco_invoice_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_order_id` AS string)), '') AS string) END as string)
 AS `dsco_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_item_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_item_id` AS string)), '') AS string) END as string)
 AS `dsco_item_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_invoice_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_invoice_status` AS string)), '') AS string) END as string)
 AS `dsco_invoice_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_expected_line_item_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_expected_line_item_amount` AS string)), '') AS string) END as string)
 AS `dsco_expected_line_item_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_expected_line_item_difference` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_expected_line_item_difference` AS string)), '') AS string) END as string)
 AS `dsco_expected_line_item_difference`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_expected_order_total_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_expected_order_total_amount` AS string)), '') AS string) END as string)
 AS `dsco_expected_order_total_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_expected_order_total_difference` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_expected_order_total_difference` AS string)), '') AS string) END as string)
 AS `dsco_expected_order_total_difference`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_invoice_create_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_invoice_create_date` AS string)), '') AS string) END as string)
 AS `dsco_invoice_create_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_invoice_last_update_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_invoice_last_update_date` AS string)), '') AS string) END as string)
 AS `dsco_invoice_last_update_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_timestamp` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_timestamp` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `file_timestamp`



FROM `ff-stadiumgoods-raw-live`.`imports`.`dsco_invoice` AS source_table

 ) AS un_ordered

