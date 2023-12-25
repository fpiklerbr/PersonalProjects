

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order_item`
  OPTIONS()
  as 

  
























































































 

SELECT   `sales_flat_order_item_id`,  `sales_flat_order_id`,  `parent_sales_flat_order_item_id`,  `quote_item_id`,  `store_id`,  `created_at`,  `updated_at`,  `product_id`,  `product_type`,  `product_options`,  `weight`,  `is_virtual`,  `sku`,  `name`,  `description`,  `applied_rule_ids`,  `additional_data`,  `free_shipping`,  `is_qty_decimal`,  `no_discount`,  `qty_backordered`,  `qty_canceled`,  `qty_invoiced`,  `qty_ordered`,  `qty_refunded`,  `qty_shipped`,  `base_cost`,  `price`,  `base_price`,  `original_price`,  `base_original_price`,  `tax_percent`,  `tax_amount`,  `base_tax_amount`,  `tax_invoiced`,  `base_tax_invoiced`,  `discount_percent`,  `discount_amount`,  `base_discount_amount`,  `discount_invoiced`,  `base_discount_invoiced`,  `amount_refunded`,  `base_amount_refunded`,  `row_total`,  `base_row_total`,  `row_invoiced`,  `base_row_invoiced`,  `row_weight`,  `base_tax_before_discount`,  `tax_before_discount`,  `ext_order_item_id`,  `locked_do_invoice`,  `locked_do_ship`,  `price_incl_tax`,  `base_price_incl_tax`,  `row_total_incl_tax`,  `base_row_total_incl_tax`,  `hidden_tax_amount`,  `base_hidden_tax_amount`,  `hidden_tax_invoiced`,  `base_hidden_tax_invoiced`,  `hidden_tax_refunded`,  `base_hidden_tax_refunded`,  `is_nominal`,  `tax_canceled`,  `hidden_tax_canceled`,  `tax_refunded`,  `base_tax_refunded`,  `discount_refunded`,  `base_discount_refunded`,  `gift_message_id`,  `gift_message_available`,  `base_weee_tax_applied_amount`,  `base_weee_tax_applied_row_amnt`,  `weee_tax_applied_amount`,  `weee_tax_applied_row_amount`,  `weee_tax_applied`,  `weee_tax_disposition`,  `weee_tax_row_disposition`,  `base_weee_tax_disposition`,  `base_weee_tax_row_disposition`,  `serializedproduct_product_serial_id`,  `dsco_item_id`,  `dsco_po_line_number`,  `custom_discount`
    , `_raw_final_sale`
    , `_raw_x3_order_id`
    , `_raw_channel_line_id`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sales_flat_order_item_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sales_flat_order_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`parent_item_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`parent_item_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `parent_sales_flat_order_item_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`quote_item_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`quote_item_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `quote_item_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `store_id`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `product_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_type` AS string)), '') AS string) END as string)
 AS `product_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_options` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_options` AS string)), '') AS string) END as string)
 AS `product_options`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`weight` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`weight` AS string)), '') AS string) END as numeric)
 AS `weight`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_virtual` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_virtual` AS string)), '') AS string) END as float64)
 as int64)
 AS `is_virtual`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sku` AS string)), '') AS string) END as string)
 AS `sku`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`name` AS string)), '') AS string) END as string)
 AS `name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`description` AS string)), '') AS string) END as string)
 AS `description`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`applied_rule_ids` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`applied_rule_ids` AS string)), '') AS string) END as string)
 AS `applied_rule_ids`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`additional_data` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`additional_data` AS string)), '') AS string) END as string)
 AS `additional_data`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`free_shipping` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`free_shipping` AS string)), '') AS string) END as float64)
 as int64)
 AS `free_shipping`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_qty_decimal` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_qty_decimal` AS string)), '') AS string) END as float64)
 as int64)
 AS `is_qty_decimal`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`no_discount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`no_discount` AS string)), '') AS string) END as float64)
 as int64)
 AS `no_discount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qty_backordered` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qty_backordered` AS string)), '') AS string) END as numeric)
 AS `qty_backordered`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qty_canceled` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qty_canceled` AS string)), '') AS string) END as float64)
 as int64)
 AS `qty_canceled`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qty_invoiced` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qty_invoiced` AS string)), '') AS string) END as numeric)
 AS `qty_invoiced`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qty_ordered` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qty_ordered` AS string)), '') AS string) END as float64)
 as int64)
 AS `qty_ordered`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qty_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qty_refunded` AS string)), '') AS string) END as float64)
 as int64)
 AS `qty_refunded`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qty_shipped` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qty_shipped` AS string)), '') AS string) END as float64)
 as int64)
 AS `qty_shipped`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_cost` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_cost` AS string)), '') AS string) END as numeric)
 AS `base_cost`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price` AS string)), '') AS string) END as numeric)
 AS `price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_price` AS string)), '') AS string) END as float64)
 AS `base_price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`original_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`original_price` AS string)), '') AS string) END as numeric)
 AS `original_price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_original_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_original_price` AS string)), '') AS string) END as float64)
 AS `base_original_price`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_percent` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_percent` AS string)), '') AS string) END as numeric)
 AS `tax_percent`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_amount` AS string)), '') AS string) END as numeric)
 AS `tax_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_tax_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_tax_amount` AS string)), '') AS string) END as float64)
 AS `base_tax_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_invoiced` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_invoiced` AS string)), '') AS string) END as numeric)
 AS `tax_invoiced`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_tax_invoiced` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_tax_invoiced` AS string)), '') AS string) END as numeric)
 AS `base_tax_invoiced`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount_percent` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount_percent` AS string)), '') AS string) END as numeric)
 AS `discount_percent`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount_amount` AS string)), '') AS string) END as numeric)
 AS `discount_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_discount_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_discount_amount` AS string)), '') AS string) END as float64)
 AS `base_discount_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount_invoiced` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount_invoiced` AS string)), '') AS string) END as numeric)
 AS `discount_invoiced`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_discount_invoiced` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_discount_invoiced` AS string)), '') AS string) END as numeric)
 AS `base_discount_invoiced`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amount_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amount_refunded` AS string)), '') AS string) END as numeric)
 AS `amount_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_amount_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_amount_refunded` AS string)), '') AS string) END as numeric)
 AS `base_amount_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`row_total` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`row_total` AS string)), '') AS string) END as numeric)
 AS `row_total`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_row_total` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_row_total` AS string)), '') AS string) END as numeric)
 AS `base_row_total`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`row_invoiced` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`row_invoiced` AS string)), '') AS string) END as numeric)
 AS `row_invoiced`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_row_invoiced` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_row_invoiced` AS string)), '') AS string) END as numeric)
 AS `base_row_invoiced`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`row_weight` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`row_weight` AS string)), '') AS string) END as numeric)
 AS `row_weight`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_tax_before_discount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_tax_before_discount` AS string)), '') AS string) END as numeric)
 AS `base_tax_before_discount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_before_discount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_before_discount` AS string)), '') AS string) END as numeric)
 AS `tax_before_discount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ext_order_item_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ext_order_item_id` AS string)), '') AS string) END as string)
 AS `ext_order_item_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`locked_do_invoice` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`locked_do_invoice` AS string)), '') AS string) END as float64)
 as int64)
 AS `locked_do_invoice`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`locked_do_ship` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`locked_do_ship` AS string)), '') AS string) END as float64)
 as int64)
 AS `locked_do_ship`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price_incl_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price_incl_tax` AS string)), '') AS string) END as numeric)
 AS `price_incl_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_price_incl_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_price_incl_tax` AS string)), '') AS string) END as numeric)
 AS `base_price_incl_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`row_total_incl_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`row_total_incl_tax` AS string)), '') AS string) END as numeric)
 AS `row_total_incl_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_row_total_incl_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_row_total_incl_tax` AS string)), '') AS string) END as numeric)
 AS `base_row_total_incl_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`hidden_tax_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`hidden_tax_amount` AS string)), '') AS string) END as numeric)
 AS `hidden_tax_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_hidden_tax_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_hidden_tax_amount` AS string)), '') AS string) END as numeric)
 AS `base_hidden_tax_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`hidden_tax_invoiced` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`hidden_tax_invoiced` AS string)), '') AS string) END as numeric)
 AS `hidden_tax_invoiced`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_hidden_tax_invoiced` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_hidden_tax_invoiced` AS string)), '') AS string) END as numeric)
 AS `base_hidden_tax_invoiced`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`hidden_tax_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`hidden_tax_refunded` AS string)), '') AS string) END as numeric)
 AS `hidden_tax_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_hidden_tax_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_hidden_tax_refunded` AS string)), '') AS string) END as numeric)
 AS `base_hidden_tax_refunded`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_nominal` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_nominal` AS string)), '') AS string) END as float64)
 as int64)
 AS `is_nominal`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_canceled` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_canceled` AS string)), '') AS string) END as numeric)
 AS `tax_canceled`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`hidden_tax_canceled` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`hidden_tax_canceled` AS string)), '') AS string) END as numeric)
 AS `hidden_tax_canceled`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_refunded` AS string)), '') AS string) END as numeric)
 AS `tax_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_tax_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_tax_refunded` AS string)), '') AS string) END as numeric)
 AS `base_tax_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount_refunded` AS string)), '') AS string) END as numeric)
 AS `discount_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_discount_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_discount_refunded` AS string)), '') AS string) END as numeric)
 AS `base_discount_refunded`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gift_message_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gift_message_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `gift_message_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gift_message_available` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gift_message_available` AS string)), '') AS string) END as float64)
 as int64)
 AS `gift_message_available`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_weee_tax_applied_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_weee_tax_applied_amount` AS string)), '') AS string) END as numeric)
 AS `base_weee_tax_applied_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_weee_tax_applied_row_amnt` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_weee_tax_applied_row_amnt` AS string)), '') AS string) END as numeric)
 AS `base_weee_tax_applied_row_amnt`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`weee_tax_applied_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`weee_tax_applied_amount` AS string)), '') AS string) END as numeric)
 AS `weee_tax_applied_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`weee_tax_applied_row_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`weee_tax_applied_row_amount` AS string)), '') AS string) END as numeric)
 AS `weee_tax_applied_row_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`weee_tax_applied` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`weee_tax_applied` AS string)), '') AS string) END as string)
 AS `weee_tax_applied`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`weee_tax_disposition` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`weee_tax_disposition` AS string)), '') AS string) END as numeric)
 AS `weee_tax_disposition`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`weee_tax_row_disposition` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`weee_tax_row_disposition` AS string)), '') AS string) END as numeric)
 AS `weee_tax_row_disposition`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_weee_tax_disposition` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_weee_tax_disposition` AS string)), '') AS string) END as numeric)
 AS `base_weee_tax_disposition`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_weee_tax_row_disposition` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_weee_tax_row_disposition` AS string)), '') AS string) END as numeric)
 AS `base_weee_tax_row_disposition`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`serializedproduct_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`serializedproduct_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `serializedproduct_product_serial_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_item_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_item_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `dsco_item_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_po_line_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_po_line_number` AS string)), '') AS string) END as float64)
 as int64)
 AS `dsco_po_line_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`custom_discount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`custom_discount` AS string)), '') AS string) END as numeric)
 AS `custom_discount`


  , `final_sale` AS `_raw_final_sale`

  , `x3_order_id` AS `_raw_x3_order_id`

  , `channel_line_id` AS `_raw_channel_line_id`

  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_order_item` AS source_table

 ) AS un_ordered

;

