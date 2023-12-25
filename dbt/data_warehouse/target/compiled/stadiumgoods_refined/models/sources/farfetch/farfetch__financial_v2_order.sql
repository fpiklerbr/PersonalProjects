



    
                    
                    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`adjustment` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`adjustment` AS string)), '') AS string) END as numeric)
 AS `adjustments_base_amount`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`adjustment_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`adjustment_date` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `adjusted_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`air_way_bill_no` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`air_way_bill_no` AS string)), '') AS string) END as string)
 AS `air_way_bill_no`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`brand` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`brand` AS string)), '') AS string) END as string)
 AS `brand`
  , 

    coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cc_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cc_fee` AS string)), '') AS string) END as numeric)
 / -1 , cast('0' AS numeric )) AS `credit_card_fee_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`channel` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`channel` AS string)), '') AS string) END as string)
 AS `fps_channel_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`commission_base` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`commission_base` AS string)), '') AS string) END as string)
 AS `commission_base`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`correction` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`correction` AS string)), '') AS string) END as string)
 AS `correction`
  , 

    coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cost_of_promo_codes` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cost_of_promo_codes` AS string)), '') AS string) END as numeric)
 , cast('0' AS numeric )) AS `cost_of_promo_codes_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`courier_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`courier_name` AS string)), '') AS string) END as string)
 AS `courier_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`currency` AS string)), '') AS string) END as string)
 AS `base_currency`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`description` AS string)), '') AS string) END as string)
 AS `description`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`designer_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`designer_id` AS string)), '') AS string) END as string)
 AS `designer_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`destination_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`destination_country` AS string)), '') AS string) END as string)
 AS `customer_country`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`destination_state` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`destination_state` AS string)), '') AS string) END as string)
 AS `destination_state`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dst_base` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dst_base` AS string)), '') AS string) END as string)
 AS `dst_base`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dst_destination_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dst_destination_amount` AS string)), '') AS string) END as string)
 AS `dst_destination_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dst_destination_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dst_destination_rate` AS string)), '') AS string) END as string)
 AS `dst_destination_rate`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dst_origin_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dst_origin_amount` AS string)), '') AS string) END as string)
 AS `dst_origin_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dst_origin_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dst_origin_rate` AS string)), '') AS string) END as string)
 AS `dst_origin_rate`
  , 

    coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`effective_commission` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`effective_commission` AS string)), '') AS string) END as numeric)
 / -1 , cast('0' AS numeric )) AS `effective_commission_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`effective_commission_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`effective_commission_rate` AS string)), '') AS string) END as string)
 AS `effective_commission_rate`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entry_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entry_type` AS string)), '') AS string) END as string)
 AS `entry_type`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`external_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`external_order_id` AS string)), '') AS string) END as string)
 AS `external_order_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`
  , 

    coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`free_return_contribution` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`free_return_contribution` AS string)), '') AS string) END as numeric)
 / -1 , cast('0' AS numeric )) AS `free_return_contribution_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`from_billing_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`from_billing_country` AS string)), '') AS string) END as string)
 AS `from_billing_country`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`from_shipping_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`from_shipping_country` AS string)), '') AS string) END as string)
 AS `from_shipping_country`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gender` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gender` AS string)), '') AS string) END as string)
 AS `gender`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_no` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_no` AS string)), '') AS string) END as string)
 AS `invoice_no`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`net_retail_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`net_retail_price` AS string)), '') AS string) END as string)
 AS `net_retail_price`
  , 

    coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`net_sales_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`net_sales_price` AS string)), '') AS string) END as numeric)
 , cast('0' AS numeric )) AS `item_price_base_amount`
  , 

    coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`no_stock_voucher` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`no_stock_voucher` AS string)), '') AS string) END as numeric)
 , cast('0' AS numeric )) AS `no_stock_vouchers_base_amount`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`no_stock_voucher_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`no_stock_voucher_date` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `no_stock_voucher_created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_date` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `farfetch_order_created_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as string)
 AS `fps_order_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_ship_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_ship_` AS string)), '') AS string) END as numeric)
 AS `shipping_price_base_amount`
  , 

    coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`partner_contr_on_order_ship` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`partner_contr_on_order_ship` AS string)), '') AS string) END as numeric)
 / -1 , cast('0' AS numeric )) AS `partner_contribution_on_shipping_base_amount`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`posting_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`posting_date` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `posted_at`
  , 

    coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pricing_difference_capture` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pricing_difference_capture` AS string)), '') AS string) END as numeric)
 / -1 , cast('0' AS numeric )) AS `pricing_difference_capture_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_id` AS string)), '') AS string) END as string)
 AS `product_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_origin` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_origin` AS string)), '') AS string) END as string)
 AS `product_origin`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`promo_code_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`promo_code_rate` AS string)), '') AS string) END as string)
 AS `promo_code_rate`
  , 

    coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`promo_codes` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`promo_codes` AS string)), '') AS string) END as numeric)
 , cast('0' AS numeric )) AS `promo_codes_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_promo_code_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_promo_code_amount` AS string)), '') AS string) END as numeric)
 AS `customer_promo_code_base_amount`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qty` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qty` AS string)), '') AS string) END as float64)
 as int64)
 AS `item_quantity`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reason` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reason` AS string)), '') AS string) END as string)
 AS `reason`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`refund_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`refund_date` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `refunded_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`refund_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`refund_fee` AS string)), '') AS string) END as string)
 AS `refund_fee`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`report_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`report_country` AS string)), '') AS string) END as string)
 AS `report_country`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`report_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`report_status` AS string)), '') AS string) END as string)
 AS `report_status`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`return_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`return_date` AS string)), '') AS string) END as timestamp)
 AS `returned_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`return_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`return_fee` AS string)), '') AS string) END as string)
 AS `return_fee`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sales_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sales_price` AS string)), '') AS string) END as string)
 AS `sales_price`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`season` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`season` AS string)), '') AS string) END as string)
 AS `season`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_date` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `shipped_at`
  , 

    coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_subsidy` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_subsidy` AS string)), '') AS string) END as numeric)
 / -1 , cast('0' AS numeric )) AS `shipping_subsidy_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_to_address` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_to_address` AS string)), '') AS string) END as string)
 AS `ship_to_address`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_to_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_to_city` AS string)), '') AS string) END as string)
 AS `ship_to_city`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_to_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_to_name` AS string)), '') AS string) END as string)
 AS `ship_to_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_to_phone` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_to_phone` AS string)), '') AS string) END as string)
 AS `ship_to_phone`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_to_zip_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_to_zip_code` AS string)), '') AS string) END as string)
 AS `ship_to_zip_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`size` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`size` AS string)), '') AS string) END as string)
 AS `size`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sku` AS string)), '') AS string) END as string)
 AS `sku`
  , 

    coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`special_payment` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`special_payment` AS string)), '') AS string) END as numeric)
 / -1 , cast('0' AS numeric )) AS `special_payments_base_amount`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`special_payment_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`special_payment_date` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `special_payment_created_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`standard_commission` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`standard_commission` AS string)), '') AS string) END as string)
 AS `standard_commission`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`standard_commission_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`standard_commission_rate` AS string)), '') AS string) END as string)
 AS `standard_commission_rate`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stock_point_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stock_point_id` AS string)), '') AS string) END as string)
 AS `fps_stock_point_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stock_point_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stock_point_name` AS string)), '') AS string) END as string)
 AS `stock_point_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sub_category` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sub_category` AS string)), '') AS string) END as string)
 AS `sub_category`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_non_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_non_tax` AS string)), '') AS string) END as string)
 AS `tax_non_tax`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_rate` AS string)), '') AS string) END as string)
 AS `tax_rate`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tenant` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tenant` AS string)), '') AS string) END as string)
 AS `fps_tenant_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`to_billing_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`to_billing_country` AS string)), '') AS string) END as string)
 AS `to_billing_country`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_items_paid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_items_paid` AS string)), '') AS string) END as string)
 AS `total_items_paid`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_tax` AS string)), '') AS string) END as numeric)
 AS `total_tax_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_vat` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_vat` AS string)), '') AS string) END as numeric)
 AS `total_vat_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tracking_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tracking_code` AS string)), '') AS string) END as string)
 AS `tracking_number`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transaction_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_date` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `transaction_timestamp`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transaction_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_type` AS string)), '') AS string) END as string)
 AS `transaction_type`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tree_category` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tree_category` AS string)), '') AS string) END as string)
 AS `tree_category`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vat_non_vat` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vat_non_vat` AS string)), '') AS string) END as string)
 AS `vat_non_vat`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vat_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vat_rate` AS string)), '') AS string) END as string)
 AS `vat_rate`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`version` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`version` AS string)), '') AS string) END as float64)
 as int64)
 AS `transaction_version`
  , `entity` AS `_raw_entity`
  , `special_refund_date` AS `_raw_special_refund_date`
  , `special_refund_reason` AS `_raw_special_refund_reason`
  , `special_refund` AS `_raw_special_refund`
  , `sbi_sbc_number` AS `_raw_sbi_sbc_number`
  , `hs_code` AS `_raw_hs_code`
  , `tax_registration_number` AS `_raw_tax_registration_number`
  , `business_model` AS `_raw_business_model`
  , `promo_codes_non_bond` AS `_raw_promo_codes_non_bond`
  , `cost_of_promo_codes_non_bond` AS `_raw_cost_of_promo_codes_non_bond`
  , `total_vat_non_bond` AS `_raw_total_vat_non_bond`
  , `total_items_paid_non_bond` AS `_raw_total_items_paid_non_bond`
  , `original_sbi_number` AS `_raw_original_sbi_number`
  , `duties_and_cross_border_related_fees` AS `_raw_duties_and_cross_border_related_fees`
  , `sales_taxes` AS `_raw_sales_taxes`
  , `price_type` AS `_raw_price_type`
FROM `ff-stadiumgoods-raw-live`.`imports`.`farfetch_financial_v2_order`

WHERE 1=1
AND file_name NOT IN ('Financial Report STADIUM GOODS- 20210101-20210131_docs_V2.zip: Financial Report STADIUM GOODS_11218 2021-01 V2.xlsx', 'Financial Report STADIUM GOODS_20210301-20210331_docs_V2.zip: Financial Report STADIUM GOODS_11218 2021-03 V3.xlsx', 'Financial Report STADIUM GOODS US SELLERS 2021-04_V2_12949_2021-04-01_2021-04-30.xlsx', 'Financial Report STADIUM GOODS IT WH 2021-04_V2_12388_2021-04-01_2021-04-30.xlsx', 'Financial Report STADIUM GOODS 2021-05_v2_11218_2021-05-01_2021-05-31.xlsx.xlsx', 'Financial Report STADIUM GOODS IT WH 2021-05_v2_11218_2021-05-01_2021-05-31.xlsx.xlsx', 'Financial Report STADIUM GOODS US SELLERS 2021-05_v2_11218_2021-05-01_2021-05-31.xlsx.xlsx', 'Financial Report STADIUM GOODS 2022_12_v3_11218_2022-12-16_2022-12-31.xlsx (duplicates)', 'Financial Report STADIUM GOODS 2022_12_v3_11218_2022-12-16_2022-12-31.xlsx', 'Financial Report STADIUM GOODS 2022_12_v3_11218_2022-12-01_2022-12-15.xlsx', 'Financial Report STADIUM GOODS 2023_10_v3_11218_2023-10-01_2023-10-31.xlsx', 'Financial Report STADIUM GOODS 2023_09_v3_11218_2023-09-01_2023-09-30.xlsx')
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast(-1 * (cost_of_promo_codes_base_amount + promo_codes_base_amount) as numeric)
 AS `marketing_discounts_co_payment_base_amount`
  , 
    safe_cast(posted_at as date)
 AS `posted_date`
  , 
    safe_cast(CASE WHEN transaction_type IN ('Sale', 'Return', 'Refund') THEN coalesce( customer_promo_code_base_amount, promo_codes_base_amount) ELSE 0 END as numeric)
 AS `item_discount_base_amount`
  , 
    safe_cast(coalesce(total_tax_base_amount, total_vat_base_amount) as numeric)
 AS `item_tax_base_amount`
  , 
    safe_cast(CASE WHEN transaction_type = 'Sale' THEN 'payment' ELSE 'refund' END as string)
 AS `transaction_description`
  , 
    safe_cast(CASE WHEN transaction_type = 'Sale' THEN farfetch_order_created_at ELSE transaction_timestamp END as timestamp)
 AS `transaction_processed_at`
FROM layer_0
WHERE 1=1
                     ) , layer_2 AS ( 
                    SELECT
    *
  , 
    

    CAST(

    split(
        description,
        ' - '
        )[safe_offset(1)]

 AS string)

 AS `description_part_2`
  , 
    

    CAST(

    split(
        description,
        ' - '
        )[safe_offset(4)]

 AS string)

 AS `description_part_5`
FROM layer_1
WHERE 1=1
                     ) , layer_3 AS ( 
                    SELECT
    *
  , 
    safe_cast(coalesce(product_id, description_part_2, '(N/A)') as string)
 AS `fps_parent_product_id`
  , 
    safe_cast(coalesce(CASE WHEN report_country = 'italy' THEN size END, description_part_5, '(N/A)') as string)
 AS `fps_product_size`
FROM layer_2
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `adjustments_base_amount` AS `adjustments_base_amount`
  , `adjusted_at` AS `adjusted_at`
  , `air_way_bill_no` AS `air_way_bill_no`
  , `brand` AS `brand`
  , `credit_card_fee_base_amount` AS `credit_card_fee_base_amount`
  , `fps_channel_id` AS `fps_channel_id`
  , `commission_base` AS `commission_base`
  , `correction` AS `correction`
  , `cost_of_promo_codes_base_amount` AS `cost_of_promo_codes_base_amount`
  , `marketing_discounts_co_payment_base_amount` AS `marketing_discounts_co_payment_base_amount`
  , `courier_name` AS `courier_name`
  , `base_currency` AS `base_currency`
  , `description` AS `description`
  , `designer_id` AS `designer_id`
  , `customer_country` AS `customer_country`
  , `destination_state` AS `destination_state`
  , `dst_base` AS `dst_base`
  , `dst_destination_amount` AS `dst_destination_amount`
  , `dst_destination_rate` AS `dst_destination_rate`
  , `dst_origin_amount` AS `dst_origin_amount`
  , `dst_origin_rate` AS `dst_origin_rate`
  , `effective_commission_base_amount` AS `effective_commission_base_amount`
  , `effective_commission_rate` AS `effective_commission_rate`
  , `entry_type` AS `entry_type`
  , `external_order_id` AS `external_order_id`
  , `file_name` AS `file_name`
  , `file_time` AS `file_time`
  , `free_return_contribution_base_amount` AS `free_return_contribution_base_amount`
  , `from_billing_country` AS `from_billing_country`
  , `from_shipping_country` AS `from_shipping_country`
  , `gender` AS `gender`
  , `invoice_no` AS `invoice_no`
  , `net_retail_price` AS `net_retail_price`
  , `item_price_base_amount` AS `item_price_base_amount`
  , `no_stock_vouchers_base_amount` AS `no_stock_vouchers_base_amount`
  , `no_stock_voucher_created_at` AS `no_stock_voucher_created_at`
  , `farfetch_order_created_at` AS `farfetch_order_created_at`
  , `fps_order_id` AS `fps_order_id`
  , `shipping_price_base_amount` AS `shipping_price_base_amount`
  , `partner_contribution_on_shipping_base_amount` AS `partner_contribution_on_shipping_base_amount`
  , `posted_at` AS `posted_at`
  , `posted_date` AS `posted_date`
  , `pricing_difference_capture_base_amount` AS `pricing_difference_capture_base_amount`
  , `product_id` AS `product_id`
  , `product_origin` AS `product_origin`
  , `promo_code_rate` AS `promo_code_rate`
  , `promo_codes_base_amount` AS `promo_codes_base_amount`
  , `customer_promo_code_base_amount` AS `customer_promo_code_base_amount`
  , `item_discount_base_amount` AS `item_discount_base_amount`
  , `item_quantity` AS `item_quantity`
  , `reason` AS `reason`
  , `refunded_at` AS `refunded_at`
  , `refund_fee` AS `refund_fee`
  , `report_country` AS `report_country`
  , `report_status` AS `report_status`
  , `returned_at` AS `returned_at`
  , `return_fee` AS `return_fee`
  , `sales_price` AS `sales_price`
  , `season` AS `season`
  , `shipped_at` AS `shipped_at`
  , `shipping_subsidy_base_amount` AS `shipping_subsidy_base_amount`
  , `ship_to_address` AS `ship_to_address`
  , `ship_to_city` AS `ship_to_city`
  , `ship_to_name` AS `ship_to_name`
  , `ship_to_phone` AS `ship_to_phone`
  , `ship_to_zip_code` AS `ship_to_zip_code`
  , `size` AS `size`
  , `sku` AS `sku`
  , `special_payments_base_amount` AS `special_payments_base_amount`
  , `special_payment_created_at` AS `special_payment_created_at`
  , `standard_commission` AS `standard_commission`
  , `standard_commission_rate` AS `standard_commission_rate`
  , `fps_stock_point_id` AS `fps_stock_point_id`
  , `stock_point_name` AS `stock_point_name`
  , `sub_category` AS `sub_category`
  , `tax_non_tax` AS `tax_non_tax`
  , `tax_rate` AS `tax_rate`
  , `fps_tenant_id` AS `fps_tenant_id`
  , `to_billing_country` AS `to_billing_country`
  , `total_items_paid` AS `total_items_paid`
  , `total_tax_base_amount` AS `total_tax_base_amount`
  , `total_vat_base_amount` AS `total_vat_base_amount`
  , `item_tax_base_amount` AS `item_tax_base_amount`
  , `tracking_number` AS `tracking_number`
  , `transaction_type` AS `transaction_type`
  , `transaction_description` AS `transaction_description`
  , `transaction_processed_at` AS `transaction_processed_at`
  , `tree_category` AS `tree_category`
  , `vat_non_vat` AS `vat_non_vat`
  , `vat_rate` AS `vat_rate`
  , `transaction_version` AS `transaction_version`
  , `fps_parent_product_id` AS `fps_parent_product_id`
  , `fps_product_size` AS `fps_product_size`
  , `_raw_entity` AS `_raw_entity`
  , `_raw_special_refund_date` AS `_raw_special_refund_date`
  , `_raw_special_refund_reason` AS `_raw_special_refund_reason`
  , `_raw_special_refund` AS `_raw_special_refund`
  , `_raw_sbi_sbc_number` AS `_raw_sbi_sbc_number`
  , `_raw_hs_code` AS `_raw_hs_code`
  , `_raw_tax_registration_number` AS `_raw_tax_registration_number`
  , `_raw_business_model` AS `_raw_business_model`
  , `_raw_promo_codes_non_bond` AS `_raw_promo_codes_non_bond`
  , `_raw_cost_of_promo_codes_non_bond` AS `_raw_cost_of_promo_codes_non_bond`
  , `_raw_total_vat_non_bond` AS `_raw_total_vat_non_bond`
  , `_raw_total_items_paid_non_bond` AS `_raw_total_items_paid_non_bond`
  , `_raw_original_sbi_number` AS `_raw_original_sbi_number`
  , `_raw_duties_and_cross_border_related_fees` AS `_raw_duties_and_cross_border_related_fees`
  , `_raw_sales_taxes` AS `_raw_sales_taxes`
  , `_raw_price_type` AS `_raw_price_type`
FROM layer_3
WHERE 1=1
                     ) SELECT * FROM final 