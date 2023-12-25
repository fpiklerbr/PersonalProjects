

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__financial_returns`
  
  
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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`return_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`return_date` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `refund_processed_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qty` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qty` AS string)), '') AS string) END as float64)
 as int64)
 / -1 AS `refund_item_quantity`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`items` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`items` AS string)), '') AS string) END as string)
 AS `items`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sales_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sales_price` AS string)), '') AS string) END as numeric)
 / -1 AS `refund_item_price_and_tax_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`net_sales_price_a2_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`net_sales_price_a2_` AS string)), '') AS string) END as numeric)
 / -1 AS `refund_item_price_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`promo_code_value_e_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`promo_code_value_e_` AS string)), '') AS string) END as numeric)
 AS `refund_item_discount_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sales_tax_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sales_tax_rate` AS string)), '') AS string) END as string)
 AS `sales_tax_rate`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_sales_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_sales_tax` AS string)), '') AS string) END as numeric)
 / -1 AS `refund_item_tax_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`commission_base` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`commission_base` AS string)), '') AS string) END as string)
 AS `commission_base`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`standard_commission` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`standard_commission` AS string)), '') AS string) END as string)
 AS `standard_commission`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`effective_commission_d_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`effective_commission_d_` AS string)), '') AS string) END as numeric)
 AS `refund_effective_commission_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`partner_cost_on_promo_codes_e_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`partner_cost_on_promo_codes_e_` AS string)), '') AS string) END as numeric)
 AS `refund_partner_cost_on_promo_codes_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_subsidy_h_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_subsidy_h_` AS string)), '') AS string) END as numeric)
 AS `refund_shipping_subsidy_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`row_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`row_type` AS string)), '') AS string) END as string)
 AS `row_type`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_sales_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_sales_price` AS string)), '') AS string) END as string)
 AS `total_sales_price`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_qty` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_qty` AS string)), '') AS string) END as string)
 AS `total_qty`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `refund_file_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `refund_file_time`
FROM `ff-stadiumgoods-raw-live`.`imports`.`farfetch_financial_returns`

WHERE 1=1
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast('Return' as string)
 AS `refund_transaction_type`
  , 
    safe_cast((refund_partner_cost_on_promo_codes_base_amount - refund_item_discount_base_amount) as numeric)
 AS `refund_marketing_discounts_co_payment_base_amount`
  , 
    safe_cast(((refund_item_price_and_tax_base_amount + refund_shipping_subsidy_base_amount) * -0.015) as numeric)
 AS `refund_free_return_contribution_base_amount`
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
  refund_effective_commission_base_amount
  + refund_marketing_discounts_co_payment_base_amount
  + refund_shipping_subsidy_base_amount
  + refund_free_return_contribution_base_amount
) as numeric)
 AS `refund_fee_base_amount`
FROM layer_2
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `farfetch_order_created_at` AS `farfetch_order_created_at`
  , `fps_order_id` AS `fps_order_id`
  , `refund_transaction_type` AS `refund_transaction_type`
  , `refund_processed_at` AS `refund_processed_at`
  , `refund_item_quantity` AS `refund_item_quantity`
  , `items` AS `items`
  , `fps_parent_product_id` AS `fps_parent_product_id`
  , `fps_product_size` AS `fps_product_size`
  , `refund_item_price_and_tax_base_amount` AS `refund_item_price_and_tax_base_amount`
  , `refund_item_price_base_amount` AS `refund_item_price_base_amount`
  , `refund_item_discount_base_amount` AS `refund_item_discount_base_amount`
  , `sales_tax_rate` AS `sales_tax_rate`
  , `refund_item_tax_base_amount` AS `refund_item_tax_base_amount`
  , `commission_base` AS `commission_base`
  , `standard_commission` AS `standard_commission`
  , `refund_effective_commission_base_amount` AS `refund_effective_commission_base_amount`
  , `refund_partner_cost_on_promo_codes_base_amount` AS `refund_partner_cost_on_promo_codes_base_amount`
  , `refund_marketing_discounts_co_payment_base_amount` AS `refund_marketing_discounts_co_payment_base_amount`
  , `refund_shipping_subsidy_base_amount` AS `refund_shipping_subsidy_base_amount`
  , `refund_free_return_contribution_base_amount` AS `refund_free_return_contribution_base_amount`
  , `row_type` AS `row_type`
  , `total_sales_price` AS `total_sales_price`
  , `total_qty` AS `total_qty`
  , `refund_fee_base_amount` AS `refund_fee_base_amount`
  , `refund_file_name` AS `refund_file_name`
  , `refund_file_time` AS `refund_file_time`
FROM layer_3
WHERE 1=1
                     ) SELECT * FROM final 
  );
    