

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__financial_sales`
  
  
  OPTIONS()
  as (
    

    
                    
                    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_date` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `farfetch_order_created_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as string)
 AS `fps_order_id`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_date` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `shipped_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qty` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qty` AS string)), '') AS string) END as float64)
 as int64)
 AS `payment_item_quantity`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`items` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`items` AS string)), '') AS string) END as string)
 AS `items`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sales_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sales_price` AS string)), '') AS string) END as numeric)
 AS `payment_item_price_and_tax_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`net_sales_price_a_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`net_sales_price_a_` AS string)), '') AS string) END as numeric)
 AS `payment_item_price_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`promo_codes_e_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`promo_codes_e_` AS string)), '') AS string) END as numeric)
 / -1 AS `payment_item_discount_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sales_tax_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sales_tax_rate` AS string)), '') AS string) END as string)
 AS `sales_tax_rate`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_sales_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_sales_tax` AS string)), '') AS string) END as numeric)
 AS `payment_item_tax_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_items_paid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_items_paid` AS string)), '') AS string) END as string)
 AS `total_items_paid`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_ship_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_ship_` AS string)), '') AS string) END as string)
 AS `order_ship_`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`commission_base` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`commission_base` AS string)), '') AS string) END as string)
 AS `commission_base`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`standard_commission` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`standard_commission` AS string)), '') AS string) END as string)
 AS `standard_commission`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`effective_commission_d_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`effective_commission_d_` AS string)), '') AS string) END as numeric)
 / -1 AS `payment_effective_commission_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`partner_cost_with_promo_codes_e_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`partner_cost_with_promo_codes_e_` AS string)), '') AS string) END as numeric)
 / -1 AS `payment_partner_cost_on_promo_codes_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cc_fee_f_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cc_fee_f_` AS string)), '') AS string) END as string)
 AS `cc_fee_f_`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_subsidy_h_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_subsidy_h_` AS string)), '') AS string) END as numeric)
 / -1 AS `payment_shipping_subsidy_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`partner_contr_on_order_ship_i_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`partner_contr_on_order_ship_i_` AS string)), '') AS string) END as string)
 AS `partner_contr_on_order_ship_i_`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`row_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`row_type` AS string)), '') AS string) END as string)
 AS `row_type`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_cc_fee_f_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_cc_fee_f_` AS string)), '') AS string) END as string)
 AS `total_cc_fee_f_`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_partner_contr_on_order_ship_i_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_partner_contr_on_order_ship_i_` AS string)), '') AS string) END as string)
 AS `total_partner_contr_on_order_ship_i_`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_order_ship_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_order_ship_` AS string)), '') AS string) END as string)
 AS `total_order_ship_`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_sales_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_sales_price` AS string)), '') AS string) END as string)
 AS `total_sales_price`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_qty` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_qty` AS string)), '') AS string) END as string)
 AS `total_qty`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_cc_fee_f_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_cc_fee_f_` AS string)), '') AS string) END as numeric)
 / -1 AS `payment_credit_card_fee_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_partner_contr_on_order_ship_i_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_partner_contr_on_order_ship_i_` AS string)), '') AS string) END as numeric)
 / -1 AS `payment_partner_contribution_on_shipping_before_subsidy_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_order_ship_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_order_ship_` AS string)), '') AS string) END as numeric)
 AS `payment_shipping_price_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `payment_file_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `payment_file_time`
FROM `ff-stadiumgoods-raw-live`.`imports`.`farfetch_financial_sales`

WHERE 1=1
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast('Sale' as string)
 AS `payment_transaction_type`
  , 
    safe_cast(farfetch_order_created_at as timestamp)
 AS `payment_processed_at`
  , 
    safe_cast((payment_partner_cost_on_promo_codes_base_amount - payment_item_discount_base_amount) as numeric)
 AS `payment_marketing_discounts_co_payment_base_amount`
  , 
    safe_cast(((payment_item_price_and_tax_base_amount + payment_shipping_subsidy_base_amount) * -0.015) as numeric)
 AS `payment_free_return_contribution_base_amount`
  , 
    safe_cast((payment_partner_contribution_on_shipping_before_subsidy_base_amount - payment_shipping_subsidy_base_amount) as numeric)
 AS `payment_partner_contribution_on_shipping_base_amount`
FROM layer_0
WHERE 1=1
                     ) , layer_2 AS ( 
                    SELECT
    *
  , 
    

    CAST(

    split(
        items,
        ' - '
        )[safe_offset(1)]

 AS string)

 AS `items_part_2`
  , 
    

    CAST(

    split(
        items,
        ' - '
        )[safe_offset(4)]

 AS string)

 AS `items_part_5`
FROM layer_1
WHERE 1=1
                     ) , layer_3 AS ( 
                    SELECT
    *
  , 
    safe_cast(coalesce(nullif(trim(items_part_2), ''), '(N/A)') as string)
 AS `fps_parent_product_id`
  , 
    safe_cast(coalesce(nullif(trim(items_part_5), ''), '(N/A)') as string)
 AS `fps_product_size`
  , 
    safe_cast((
  payment_effective_commission_base_amount
  + payment_marketing_discounts_co_payment_base_amount
  + payment_shipping_subsidy_base_amount
  + payment_free_return_contribution_base_amount
  + payment_credit_card_fee_base_amount
  + payment_partner_contribution_on_shipping_base_amount
) as numeric)
 AS `payment_fee_base_amount`
FROM layer_2
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `farfetch_order_created_at` AS `farfetch_order_created_at`
  , `fps_order_id` AS `fps_order_id`
  , `payment_transaction_type` AS `payment_transaction_type`
  , `payment_processed_at` AS `payment_processed_at`
  , `shipped_at` AS `shipped_at`
  , `payment_item_quantity` AS `payment_item_quantity`
  , `items` AS `items`
  , `fps_parent_product_id` AS `fps_parent_product_id`
  , `fps_product_size` AS `fps_product_size`
  , `payment_item_price_and_tax_base_amount` AS `payment_item_price_and_tax_base_amount`
  , `payment_item_price_base_amount` AS `payment_item_price_base_amount`
  , `payment_item_discount_base_amount` AS `payment_item_discount_base_amount`
  , `sales_tax_rate` AS `sales_tax_rate`
  , `payment_item_tax_base_amount` AS `payment_item_tax_base_amount`
  , `total_items_paid` AS `total_items_paid`
  , `order_ship_` AS `order_ship_`
  , `commission_base` AS `commission_base`
  , `standard_commission` AS `standard_commission`
  , `payment_effective_commission_base_amount` AS `payment_effective_commission_base_amount`
  , `payment_partner_cost_on_promo_codes_base_amount` AS `payment_partner_cost_on_promo_codes_base_amount`
  , `payment_marketing_discounts_co_payment_base_amount` AS `payment_marketing_discounts_co_payment_base_amount`
  , `cc_fee_f_` AS `cc_fee_f_`
  , `payment_shipping_subsidy_base_amount` AS `payment_shipping_subsidy_base_amount`
  , `payment_free_return_contribution_base_amount` AS `payment_free_return_contribution_base_amount`
  , `partner_contr_on_order_ship_i_` AS `partner_contr_on_order_ship_i_`
  , `row_type` AS `row_type`
  , `total_cc_fee_f_` AS `total_cc_fee_f_`
  , `total_partner_contr_on_order_ship_i_` AS `total_partner_contr_on_order_ship_i_`
  , `total_order_ship_` AS `total_order_ship_`
  , `total_sales_price` AS `total_sales_price`
  , `total_qty` AS `total_qty`
  , `payment_credit_card_fee_base_amount` AS `payment_credit_card_fee_base_amount`
  , `payment_partner_contribution_on_shipping_before_subsidy_base_amount` AS `payment_partner_contribution_on_shipping_before_subsidy_base_amount`
  , `payment_partner_contribution_on_shipping_base_amount` AS `payment_partner_contribution_on_shipping_base_amount`
  , `payment_shipping_price_base_amount` AS `payment_shipping_price_base_amount`
  , `payment_fee_base_amount` AS `payment_fee_base_amount`
  , `payment_file_name` AS `payment_file_name`
  , `payment_file_time` AS `payment_file_time`
FROM layer_3
WHERE 1=1
                     ) SELECT * FROM final 
  );
    