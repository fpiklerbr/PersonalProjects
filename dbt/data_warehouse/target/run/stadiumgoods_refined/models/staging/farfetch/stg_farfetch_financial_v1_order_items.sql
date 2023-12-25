

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_farfetch_financial_v1_order_items`
  
  
  OPTIONS()
  as (
    WITH order_item_transactions AS (



        (
            select

                cast('`ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__financial_sales`' as 
    string
) as _dbt_source_relation,
                
                    cast(`farfetch_order_created_at` as TIMESTAMP) as `farfetch_order_created_at` ,
                    cast(`fps_order_id` as STRING) as `fps_order_id` ,
                    cast(`payment_transaction_type` as STRING) as `payment_transaction_type` ,
                    cast(`payment_processed_at` as TIMESTAMP) as `payment_processed_at` ,
                    cast(`shipped_at` as TIMESTAMP) as `shipped_at` ,
                    cast(`payment_item_quantity` as INT64) as `payment_item_quantity` ,
                    cast(`items` as STRING) as `items` ,
                    cast(`fps_parent_product_id` as STRING) as `fps_parent_product_id` ,
                    cast(`fps_product_size` as STRING) as `fps_product_size` ,
                    cast(`payment_item_price_and_tax_base_amount` as NUMERIC) as `payment_item_price_and_tax_base_amount` ,
                    cast(`payment_item_price_base_amount` as NUMERIC) as `payment_item_price_base_amount` ,
                    cast(`payment_item_discount_base_amount` as NUMERIC) as `payment_item_discount_base_amount` ,
                    cast(`sales_tax_rate` as STRING) as `sales_tax_rate` ,
                    cast(`payment_item_tax_base_amount` as NUMERIC) as `payment_item_tax_base_amount` ,
                    cast(`total_items_paid` as STRING) as `total_items_paid` ,
                    cast(`order_ship_` as STRING) as `order_ship_` ,
                    cast(`commission_base` as STRING) as `commission_base` ,
                    cast(`standard_commission` as STRING) as `standard_commission` ,
                    cast(`payment_effective_commission_base_amount` as NUMERIC) as `payment_effective_commission_base_amount` ,
                    cast(`payment_partner_cost_on_promo_codes_base_amount` as NUMERIC) as `payment_partner_cost_on_promo_codes_base_amount` ,
                    cast(`payment_marketing_discounts_co_payment_base_amount` as NUMERIC) as `payment_marketing_discounts_co_payment_base_amount` ,
                    cast(`cc_fee_f_` as STRING) as `cc_fee_f_` ,
                    cast(`payment_shipping_subsidy_base_amount` as NUMERIC) as `payment_shipping_subsidy_base_amount` ,
                    cast(`payment_free_return_contribution_base_amount` as NUMERIC) as `payment_free_return_contribution_base_amount` ,
                    cast(`partner_contr_on_order_ship_i_` as STRING) as `partner_contr_on_order_ship_i_` ,
                    cast(`row_type` as STRING) as `row_type` ,
                    cast(`total_cc_fee_f_` as STRING) as `total_cc_fee_f_` ,
                    cast(`total_partner_contr_on_order_ship_i_` as STRING) as `total_partner_contr_on_order_ship_i_` ,
                    cast(`total_order_ship_` as STRING) as `total_order_ship_` ,
                    cast(`total_sales_price` as STRING) as `total_sales_price` ,
                    cast(`total_qty` as STRING) as `total_qty` ,
                    cast(`payment_credit_card_fee_base_amount` as NUMERIC) as `payment_credit_card_fee_base_amount` ,
                    cast(`payment_partner_contribution_on_shipping_before_subsidy_base_amount` as NUMERIC) as `payment_partner_contribution_on_shipping_before_subsidy_base_amount` ,
                    cast(`payment_partner_contribution_on_shipping_base_amount` as NUMERIC) as `payment_partner_contribution_on_shipping_base_amount` ,
                    cast(`payment_shipping_price_base_amount` as NUMERIC) as `payment_shipping_price_base_amount` ,
                    cast(`payment_fee_base_amount` as NUMERIC) as `payment_fee_base_amount` ,
                    cast(`payment_file_name` as STRING) as `payment_file_name` ,
                    cast(`payment_file_time` as TIMESTAMP) as `payment_file_time` ,
                    cast(null as STRING) as `refund_transaction_type` ,
                    cast(null as TIMESTAMP) as `refund_processed_at` ,
                    cast(null as FLOAT64) as `refund_item_quantity` ,
                    cast(null as NUMERIC) as `refund_item_price_and_tax_base_amount` ,
                    cast(null as NUMERIC) as `refund_item_price_base_amount` ,
                    cast(null as NUMERIC) as `refund_item_discount_base_amount` ,
                    cast(null as NUMERIC) as `refund_item_tax_base_amount` ,
                    cast(null as NUMERIC) as `refund_effective_commission_base_amount` ,
                    cast(null as NUMERIC) as `refund_partner_cost_on_promo_codes_base_amount` ,
                    cast(null as NUMERIC) as `refund_marketing_discounts_co_payment_base_amount` ,
                    cast(null as NUMERIC) as `refund_shipping_subsidy_base_amount` ,
                    cast(null as NUMERIC) as `refund_free_return_contribution_base_amount` ,
                    cast(null as NUMERIC) as `refund_fee_base_amount` ,
                    cast(null as STRING) as `refund_file_name` ,
                    cast(null as TIMESTAMP) as `refund_file_time` ,
                    cast(null as STRING) as `reason` ,
                    cast(null as NUMERIC) as `refund_no_stock_vouchers_base_amount` 

            from `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__financial_sales`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__financial_returns`' as 
    string
) as _dbt_source_relation,
                
                    cast(`farfetch_order_created_at` as TIMESTAMP) as `farfetch_order_created_at` ,
                    cast(`fps_order_id` as STRING) as `fps_order_id` ,
                    cast(null as STRING) as `payment_transaction_type` ,
                    cast(null as TIMESTAMP) as `payment_processed_at` ,
                    cast(null as TIMESTAMP) as `shipped_at` ,
                    cast(null as INT64) as `payment_item_quantity` ,
                    cast(`items` as STRING) as `items` ,
                    cast(`fps_parent_product_id` as STRING) as `fps_parent_product_id` ,
                    cast(`fps_product_size` as STRING) as `fps_product_size` ,
                    cast(null as NUMERIC) as `payment_item_price_and_tax_base_amount` ,
                    cast(null as NUMERIC) as `payment_item_price_base_amount` ,
                    cast(null as NUMERIC) as `payment_item_discount_base_amount` ,
                    cast(`sales_tax_rate` as STRING) as `sales_tax_rate` ,
                    cast(null as NUMERIC) as `payment_item_tax_base_amount` ,
                    cast(null as STRING) as `total_items_paid` ,
                    cast(null as STRING) as `order_ship_` ,
                    cast(`commission_base` as STRING) as `commission_base` ,
                    cast(`standard_commission` as STRING) as `standard_commission` ,
                    cast(null as NUMERIC) as `payment_effective_commission_base_amount` ,
                    cast(null as NUMERIC) as `payment_partner_cost_on_promo_codes_base_amount` ,
                    cast(null as NUMERIC) as `payment_marketing_discounts_co_payment_base_amount` ,
                    cast(null as STRING) as `cc_fee_f_` ,
                    cast(null as NUMERIC) as `payment_shipping_subsidy_base_amount` ,
                    cast(null as NUMERIC) as `payment_free_return_contribution_base_amount` ,
                    cast(null as STRING) as `partner_contr_on_order_ship_i_` ,
                    cast(`row_type` as STRING) as `row_type` ,
                    cast(null as STRING) as `total_cc_fee_f_` ,
                    cast(null as STRING) as `total_partner_contr_on_order_ship_i_` ,
                    cast(null as STRING) as `total_order_ship_` ,
                    cast(`total_sales_price` as STRING) as `total_sales_price` ,
                    cast(`total_qty` as STRING) as `total_qty` ,
                    cast(null as NUMERIC) as `payment_credit_card_fee_base_amount` ,
                    cast(null as NUMERIC) as `payment_partner_contribution_on_shipping_before_subsidy_base_amount` ,
                    cast(null as NUMERIC) as `payment_partner_contribution_on_shipping_base_amount` ,
                    cast(null as NUMERIC) as `payment_shipping_price_base_amount` ,
                    cast(null as NUMERIC) as `payment_fee_base_amount` ,
                    cast(null as STRING) as `payment_file_name` ,
                    cast(null as TIMESTAMP) as `payment_file_time` ,
                    cast(`refund_transaction_type` as STRING) as `refund_transaction_type` ,
                    cast(`refund_processed_at` as TIMESTAMP) as `refund_processed_at` ,
                    cast(`refund_item_quantity` as FLOAT64) as `refund_item_quantity` ,
                    cast(`refund_item_price_and_tax_base_amount` as NUMERIC) as `refund_item_price_and_tax_base_amount` ,
                    cast(`refund_item_price_base_amount` as NUMERIC) as `refund_item_price_base_amount` ,
                    cast(`refund_item_discount_base_amount` as NUMERIC) as `refund_item_discount_base_amount` ,
                    cast(`refund_item_tax_base_amount` as NUMERIC) as `refund_item_tax_base_amount` ,
                    cast(`refund_effective_commission_base_amount` as NUMERIC) as `refund_effective_commission_base_amount` ,
                    cast(`refund_partner_cost_on_promo_codes_base_amount` as NUMERIC) as `refund_partner_cost_on_promo_codes_base_amount` ,
                    cast(`refund_marketing_discounts_co_payment_base_amount` as NUMERIC) as `refund_marketing_discounts_co_payment_base_amount` ,
                    cast(`refund_shipping_subsidy_base_amount` as NUMERIC) as `refund_shipping_subsidy_base_amount` ,
                    cast(`refund_free_return_contribution_base_amount` as NUMERIC) as `refund_free_return_contribution_base_amount` ,
                    cast(`refund_fee_base_amount` as NUMERIC) as `refund_fee_base_amount` ,
                    cast(`refund_file_name` as STRING) as `refund_file_name` ,
                    cast(`refund_file_time` as TIMESTAMP) as `refund_file_time` ,
                    cast(null as STRING) as `reason` ,
                    cast(null as NUMERIC) as `refund_no_stock_vouchers_base_amount` 

            from `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__financial_returns`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__financial_refunds`' as 
    string
) as _dbt_source_relation,
                
                    cast(`farfetch_order_created_at` as TIMESTAMP) as `farfetch_order_created_at` ,
                    cast(`fps_order_id` as STRING) as `fps_order_id` ,
                    cast(null as STRING) as `payment_transaction_type` ,
                    cast(null as TIMESTAMP) as `payment_processed_at` ,
                    cast(null as TIMESTAMP) as `shipped_at` ,
                    cast(null as INT64) as `payment_item_quantity` ,
                    cast(`items` as STRING) as `items` ,
                    cast(`fps_parent_product_id` as STRING) as `fps_parent_product_id` ,
                    cast(`fps_product_size` as STRING) as `fps_product_size` ,
                    cast(null as NUMERIC) as `payment_item_price_and_tax_base_amount` ,
                    cast(null as NUMERIC) as `payment_item_price_base_amount` ,
                    cast(null as NUMERIC) as `payment_item_discount_base_amount` ,
                    cast(`sales_tax_rate` as STRING) as `sales_tax_rate` ,
                    cast(null as NUMERIC) as `payment_item_tax_base_amount` ,
                    cast(null as STRING) as `total_items_paid` ,
                    cast(null as STRING) as `order_ship_` ,
                    cast(`commission_base` as STRING) as `commission_base` ,
                    cast(`standard_commission` as STRING) as `standard_commission` ,
                    cast(null as NUMERIC) as `payment_effective_commission_base_amount` ,
                    cast(null as NUMERIC) as `payment_partner_cost_on_promo_codes_base_amount` ,
                    cast(null as NUMERIC) as `payment_marketing_discounts_co_payment_base_amount` ,
                    cast(null as STRING) as `cc_fee_f_` ,
                    cast(null as NUMERIC) as `payment_shipping_subsidy_base_amount` ,
                    cast(null as NUMERIC) as `payment_free_return_contribution_base_amount` ,
                    cast(null as STRING) as `partner_contr_on_order_ship_i_` ,
                    cast(`row_type` as STRING) as `row_type` ,
                    cast(null as STRING) as `total_cc_fee_f_` ,
                    cast(null as STRING) as `total_partner_contr_on_order_ship_i_` ,
                    cast(null as STRING) as `total_order_ship_` ,
                    cast(`total_sales_price` as STRING) as `total_sales_price` ,
                    cast(`total_qty` as STRING) as `total_qty` ,
                    cast(null as NUMERIC) as `payment_credit_card_fee_base_amount` ,
                    cast(null as NUMERIC) as `payment_partner_contribution_on_shipping_before_subsidy_base_amount` ,
                    cast(null as NUMERIC) as `payment_partner_contribution_on_shipping_base_amount` ,
                    cast(null as NUMERIC) as `payment_shipping_price_base_amount` ,
                    cast(null as NUMERIC) as `payment_fee_base_amount` ,
                    cast(null as STRING) as `payment_file_name` ,
                    cast(null as TIMESTAMP) as `payment_file_time` ,
                    cast(`refund_transaction_type` as STRING) as `refund_transaction_type` ,
                    cast(`refund_processed_at` as TIMESTAMP) as `refund_processed_at` ,
                    cast(`refund_item_quantity` as FLOAT64) as `refund_item_quantity` ,
                    cast(`refund_item_price_and_tax_base_amount` as NUMERIC) as `refund_item_price_and_tax_base_amount` ,
                    cast(`refund_item_price_base_amount` as NUMERIC) as `refund_item_price_base_amount` ,
                    cast(`refund_item_discount_base_amount` as NUMERIC) as `refund_item_discount_base_amount` ,
                    cast(`refund_item_tax_base_amount` as NUMERIC) as `refund_item_tax_base_amount` ,
                    cast(`refund_effective_commission_base_amount` as NUMERIC) as `refund_effective_commission_base_amount` ,
                    cast(`refund_partner_cost_on_promo_codes_base_amount` as NUMERIC) as `refund_partner_cost_on_promo_codes_base_amount` ,
                    cast(`refund_marketing_discounts_co_payment_base_amount` as NUMERIC) as `refund_marketing_discounts_co_payment_base_amount` ,
                    cast(`refund_shipping_subsidy_base_amount` as NUMERIC) as `refund_shipping_subsidy_base_amount` ,
                    cast(`refund_free_return_contribution_base_amount` as NUMERIC) as `refund_free_return_contribution_base_amount` ,
                    cast(`refund_fee_base_amount` as NUMERIC) as `refund_fee_base_amount` ,
                    cast(`refund_file_name` as STRING) as `refund_file_name` ,
                    cast(`refund_file_time` as TIMESTAMP) as `refund_file_time` ,
                    cast(`reason` as STRING) as `reason` ,
                    cast(null as NUMERIC) as `refund_no_stock_vouchers_base_amount` 

            from `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__financial_refunds`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__financial_no_stock_vouchers`' as 
    string
) as _dbt_source_relation,
                
                    cast(`farfetch_order_created_at` as TIMESTAMP) as `farfetch_order_created_at` ,
                    cast(`fps_order_id` as STRING) as `fps_order_id` ,
                    cast(null as STRING) as `payment_transaction_type` ,
                    cast(null as TIMESTAMP) as `payment_processed_at` ,
                    cast(null as TIMESTAMP) as `shipped_at` ,
                    cast(null as INT64) as `payment_item_quantity` ,
                    cast(`items` as STRING) as `items` ,
                    cast(`fps_parent_product_id` as STRING) as `fps_parent_product_id` ,
                    cast(`fps_product_size` as STRING) as `fps_product_size` ,
                    cast(null as NUMERIC) as `payment_item_price_and_tax_base_amount` ,
                    cast(null as NUMERIC) as `payment_item_price_base_amount` ,
                    cast(null as NUMERIC) as `payment_item_discount_base_amount` ,
                    cast(null as STRING) as `sales_tax_rate` ,
                    cast(null as NUMERIC) as `payment_item_tax_base_amount` ,
                    cast(null as STRING) as `total_items_paid` ,
                    cast(null as STRING) as `order_ship_` ,
                    cast(null as STRING) as `commission_base` ,
                    cast(null as STRING) as `standard_commission` ,
                    cast(null as NUMERIC) as `payment_effective_commission_base_amount` ,
                    cast(null as NUMERIC) as `payment_partner_cost_on_promo_codes_base_amount` ,
                    cast(null as NUMERIC) as `payment_marketing_discounts_co_payment_base_amount` ,
                    cast(null as STRING) as `cc_fee_f_` ,
                    cast(null as NUMERIC) as `payment_shipping_subsidy_base_amount` ,
                    cast(null as NUMERIC) as `payment_free_return_contribution_base_amount` ,
                    cast(null as STRING) as `partner_contr_on_order_ship_i_` ,
                    cast(`row_type` as STRING) as `row_type` ,
                    cast(null as STRING) as `total_cc_fee_f_` ,
                    cast(null as STRING) as `total_partner_contr_on_order_ship_i_` ,
                    cast(null as STRING) as `total_order_ship_` ,
                    cast(null as STRING) as `total_sales_price` ,
                    cast(`total_qty` as STRING) as `total_qty` ,
                    cast(null as NUMERIC) as `payment_credit_card_fee_base_amount` ,
                    cast(null as NUMERIC) as `payment_partner_contribution_on_shipping_before_subsidy_base_amount` ,
                    cast(null as NUMERIC) as `payment_partner_contribution_on_shipping_base_amount` ,
                    cast(null as NUMERIC) as `payment_shipping_price_base_amount` ,
                    cast(null as NUMERIC) as `payment_fee_base_amount` ,
                    cast(null as STRING) as `payment_file_name` ,
                    cast(null as TIMESTAMP) as `payment_file_time` ,
                    cast(`refund_transaction_type` as STRING) as `refund_transaction_type` ,
                    cast(`refund_processed_at` as TIMESTAMP) as `refund_processed_at` ,
                    cast(`refund_item_quantity` as FLOAT64) as `refund_item_quantity` ,
                    cast(null as NUMERIC) as `refund_item_price_and_tax_base_amount` ,
                    cast(null as NUMERIC) as `refund_item_price_base_amount` ,
                    cast(null as NUMERIC) as `refund_item_discount_base_amount` ,
                    cast(null as NUMERIC) as `refund_item_tax_base_amount` ,
                    cast(null as NUMERIC) as `refund_effective_commission_base_amount` ,
                    cast(null as NUMERIC) as `refund_partner_cost_on_promo_codes_base_amount` ,
                    cast(null as NUMERIC) as `refund_marketing_discounts_co_payment_base_amount` ,
                    cast(null as NUMERIC) as `refund_shipping_subsidy_base_amount` ,
                    cast(null as NUMERIC) as `refund_free_return_contribution_base_amount` ,
                    cast(`refund_fee_base_amount` as NUMERIC) as `refund_fee_base_amount` ,
                    cast(`refund_file_name` as STRING) as `refund_file_name` ,
                    cast(`refund_file_time` as TIMESTAMP) as `refund_file_time` ,
                    cast(`reason` as STRING) as `reason` ,
                    cast(`refund_no_stock_vouchers_base_amount` as NUMERIC) as `refund_no_stock_vouchers_base_amount` 

            from `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__financial_no_stock_vouchers`
        )

        

)

SELECT
    fps_order_id
  , fps_parent_product_id
  , fps_product_size
  , min(payment_processed_at) AS payment_processed_at
  , string_agg(DISTINCT payment_transaction_type, ', ') AS payment_transaction_type
  , string_agg(DISTINCT payment_file_name, ', ') AS payment_file_name
  , max(payment_file_time) AS payment_file_time
  , sum(payment_item_quantity) AS payment_item_quantity
  , sum(payment_item_price_base_amount) AS payment_item_price_base_amount
  , sum(payment_item_discount_base_amount) AS payment_item_discount_base_amount
  , sum(payment_item_tax_base_amount) AS payment_item_tax_base_amount
  , sum(payment_shipping_price_base_amount) AS payment_shipping_price_base_amount
  , sum(payment_effective_commission_base_amount) AS payment_effective_commission_base_amount
  , sum(payment_marketing_discounts_co_payment_base_amount) AS payment_marketing_discounts_co_payment_base_amount
  , sum(payment_shipping_subsidy_base_amount) AS payment_shipping_subsidy_base_amount
  , sum(payment_free_return_contribution_base_amount) AS payment_free_return_contribution_base_amount
  , sum(payment_credit_card_fee_base_amount) AS payment_credit_card_fee_base_amount
  , sum(payment_partner_contribution_on_shipping_base_amount) AS payment_partner_contribution_on_shipping_base_amount
  , sum(cast(CASE WHEN payment_transaction_type IS NOT NULL THEN 0 END AS numeric)) AS payment_no_stock_vouchers_base_amount
  , sum(payment_fee_base_amount) AS payment_fee_base_amount
  , min(refund_processed_at) AS refund_processed_at
  , string_agg(DISTINCT refund_transaction_type, ', ') AS refund_transaction_type
  , string_agg(DISTINCT refund_file_name, ', ') AS refund_file_name
  , max(refund_file_time) AS refund_file_time
  , sum(refund_item_quantity) AS refund_item_quantity
  , sum(coalesce(refund_item_price_base_amount, CASE WHEN refund_transaction_type = 'No Stock Voucher' THEN 0 END)) AS refund_item_price_base_amount
  , sum(coalesce(refund_item_discount_base_amount, CASE WHEN refund_transaction_type = 'No Stock Voucher' THEN 0 END)) AS refund_item_discount_base_amount
  , sum(coalesce(refund_item_tax_base_amount, CASE WHEN refund_transaction_type = 'No Stock Voucher' THEN 0 END)) AS refund_item_tax_base_amount
  , sum(CASE WHEN refund_transaction_type IS NOT NULL THEN cast(0 AS numeric) END) AS refund_shipping_price_base_amount
  , sum(coalesce(refund_effective_commission_base_amount, CASE WHEN refund_transaction_type = 'No Stock Voucher' THEN 0 END)) AS refund_effective_commission_base_amount
  , sum(coalesce(refund_marketing_discounts_co_payment_base_amount, CASE WHEN refund_transaction_type = 'No Stock Voucher' THEN 0 END)) AS refund_marketing_discounts_co_payment_base_amount
  , sum(coalesce(refund_shipping_subsidy_base_amount, CASE WHEN refund_transaction_type = 'No Stock Voucher' THEN 0 END)) AS refund_shipping_subsidy_base_amount
  , sum(coalesce(refund_free_return_contribution_base_amount, CASE WHEN refund_transaction_type = 'No Stock Voucher' THEN 0 END)) AS refund_free_return_contribution_base_amount
  , sum(CASE WHEN refund_transaction_type IS NOT NULL THEN cast(0 AS numeric) END) AS refund_credit_card_fee_base_amount
  , sum(CASE WHEN refund_transaction_type IS NOT NULL THEN cast(0 AS numeric) END) AS refund_partner_contribution_on_shipping_base_amount
  , sum(coalesce(refund_no_stock_vouchers_base_amount, CASE WHEN refund_transaction_type IS NOT NULL THEN cast(0 AS numeric) END)) AS refund_no_stock_vouchers_base_amount
  , sum(refund_fee_base_amount) AS refund_fee_base_amount
  , min(CASE WHEN refund_transaction_type = 'Return' THEN refund_processed_at END) AS return_timestamp
  , max(CASE WHEN refund_transaction_type = 'Return' THEN refund_file_time END) AS return_file_time
  , sum(CASE WHEN refund_transaction_type = 'Return' THEN refund_item_quantity END) AS return_item_quantity
FROM order_item_transactions
GROUP BY 1, 2, 3
  );
    