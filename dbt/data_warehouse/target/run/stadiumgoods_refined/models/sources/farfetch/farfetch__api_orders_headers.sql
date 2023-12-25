

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__api_orders_headers`
  
  
  OPTIONS()
  as (
    

    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`barcode` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`barcode` AS string)), '') AS string) END as string)
 AS `barcode`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_address1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_address1` AS string)), '') AS string) END as string)
 AS `billing_address1`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_address2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_address2` AS string)), '') AS string) END as string)
 AS `billing_address2`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_address_complement` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_address_complement` AS string)), '') AS string) END as string)
 AS `billing_address_complement`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_address_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_address_number` AS string)), '') AS string) END as string)
 AS `billing_address_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_cpf` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_cpf` AS string)), '') AS string) END as string)
 AS `billing_cpf`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_city` AS string)), '') AS string) END as string)
 AS `billing_city`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_city_dd` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_city_dd` AS string)), '') AS string) END as string)
 AS `billing_city_dd`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_country` AS string)), '') AS string) END as string)
 AS `billing_country`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_country_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_country_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `billing_country_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_mobile` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_mobile` AS string)), '') AS string) END as string)
 AS `billing_mobile`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_nick_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_nick_name` AS string)), '') AS string) END as string)
 AS `billing_nick_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_phone` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_phone` AS string)), '') AS string) END as string)
 AS `billing_phone`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_state` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_state` AS string)), '') AS string) END as string)
 AS `billing_state`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_zip` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_zip` AS string)), '') AS string) END as string)
 AS `billing_zip`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`collect_in_store` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`collect_in_store` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`collect_in_store` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`collect_in_store` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `is_collect_in_store`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`collect_point` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`collect_point` AS string)), '') AS string) END as string)
 AS `collect_point`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`country_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`country_id` AS string)), '') AS string) END as string)
 AS `country_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_address1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_address1` AS string)), '') AS string) END as string)
 AS `customer_address1`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_address2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_address2` AS string)), '') AS string) END as string)
 AS `customer_address2`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_address_complement` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_address_complement` AS string)), '') AS string) END as string)
 AS `customer_address_complement`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_address_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_address_number` AS string)), '') AS string) END as string)
 AS `customer_address_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_cpf` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_cpf` AS string)), '') AS string) END as string)
 AS `customer_cpf`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_city` AS string)), '') AS string) END as string)
 AS `customer_city`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_city_dd` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_city_dd` AS string)), '') AS string) END as string)
 AS `customer_city_dd`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_country` AS string)), '') AS string) END as string)
 AS `customer_country`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_country_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_country_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `customer_country_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_email` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_email` AS string)), '') AS string) END as string)
 AS `customer_email`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_mobile` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_mobile` AS string)), '') AS string) END as string)
 AS `customer_mobile`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_nick_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_nick_name` AS string)), '') AS string) END as string)
 AS `customer_nick_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_phone` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_phone` AS string)), '') AS string) END as string)
 AS `customer_phone`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_state` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_state` AS string)), '') AS string) END as string)
 AS `customer_state`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_total_tax_value` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_total_tax_value` AS string)), '') AS string) END as float64)
 AS `customer_total_tax_value`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_zip` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_zip` AS string)), '') AS string) END as string)
 AS `customer_zip`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`date_created` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`date_created` AS string)), '') AS string) END as timestamp)
 AS `farfetch_order_created_at`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`financial_values_processed` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`financial_values_processed` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`financial_values_processed` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`financial_values_processed` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `is_financial_values_processed`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`grand_total` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`grand_total` AS string)), '') AS string) END as float64)
 AS `grand_total`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_next_day` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_next_day` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_next_day` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_next_day` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `is_next_day`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_personal_shopper` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_personal_shopper` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_personal_shopper` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_personal_shopper` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `is_personal_shopper`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_same_day` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_same_day` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_same_day` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_same_day` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `is_same_day`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`items_total` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`items_total` AS string)), '') AS string) END as float64)
 AS `items_total`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`point_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`point_code` AS string)), '') AS string) END as string)
 AS `fps_stock_point_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as string)
 AS `farfetch_order_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_code` AS string)), '') AS string) END as string)
 AS `fps_order_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`point_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`point_id` AS string)), '') AS string) END as string)
 AS `fps_stock_point_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`promo_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`promo_code` AS string)), '') AS string) END as string)
 AS `promo_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`prop_invoice` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`prop_invoice` AS string)), '') AS string) END as float64)
 AS `prop_invoice`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_from_address` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_from_address` AS string)), '') AS string) END as string)
 AS `ship_from_address`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_tax_percent` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_tax_percent` AS string)), '') AS string) END as float64)
 AS `ship_tax_percent`
  , 

    coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_tax_value` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_tax_value` AS string)), '') AS string) END as numeric)
 , cast('0' AS numeric )) AS `order_shipping_tax_base_amount`
  , 

    coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping` AS string)), '') AS string) END as numeric)
 , cast('0' AS numeric )) AS `order_shipping_price_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_total_tax_value` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_total_tax_value` AS string)), '') AS string) END as float64)
 AS `store_total_tax_value`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tenant_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tenant_id` AS string)), '') AS string) END as string)
 AS `fps_tenant_id`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`zone_euro` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`zone_euro` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`zone_euro` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`zone_euro` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `is_zone_use_euro`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`selected_step` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`selected_step` AS string)), '') AS string) END as string)
 AS `selected_step`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_ddd` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_ddd` AS string)), '') AS string) END as string)
 AS `billing_ddd`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_neighborhood` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_neighborhood` AS string)), '') AS string) END as string)
 AS `billing_neighborhood`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_ddd` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_ddd` AS string)), '') AS string) END as string)
 AS `customer_ddd`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_neighborhood` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_neighborhood` AS string)), '') AS string) END as string)
 AS `customer_neighborhood`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`files_url` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`files_url` AS string)), '') AS string) END as string)
 AS `files_url`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`
  , `is_pre_oder_child` AS `_raw_is_pre_oder_child`
FROM `ff-stadiumgoods-raw-live`.`imports`.`farfetch_orders_headers`

WHERE 1=1
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast(concat(fps_stock_point_code, farfetch_order_id) as string)
 AS `fps_order_id`
FROM layer_0
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `barcode` AS `barcode`
  , `billing_address1` AS `billing_address1`
  , `billing_address2` AS `billing_address2`
  , `billing_address_complement` AS `billing_address_complement`
  , `billing_address_number` AS `billing_address_number`
  , `billing_cpf` AS `billing_cpf`
  , `billing_city` AS `billing_city`
  , `billing_city_dd` AS `billing_city_dd`
  , `billing_country` AS `billing_country`
  , `billing_country_id` AS `billing_country_id`
  , `billing_mobile` AS `billing_mobile`
  , `billing_nick_name` AS `billing_nick_name`
  , `billing_phone` AS `billing_phone`
  , `billing_state` AS `billing_state`
  , `billing_zip` AS `billing_zip`
  , `is_collect_in_store` AS `is_collect_in_store`
  , `collect_point` AS `collect_point`
  , `country_id` AS `country_id`
  , `customer_address1` AS `customer_address1`
  , `customer_address2` AS `customer_address2`
  , `customer_address_complement` AS `customer_address_complement`
  , `customer_address_number` AS `customer_address_number`
  , `customer_cpf` AS `customer_cpf`
  , `customer_city` AS `customer_city`
  , `customer_city_dd` AS `customer_city_dd`
  , `customer_country` AS `customer_country`
  , `customer_country_id` AS `customer_country_id`
  , `customer_email` AS `customer_email`
  , `customer_mobile` AS `customer_mobile`
  , `customer_nick_name` AS `customer_nick_name`
  , `customer_phone` AS `customer_phone`
  , `customer_state` AS `customer_state`
  , `customer_total_tax_value` AS `customer_total_tax_value`
  , `customer_zip` AS `customer_zip`
  , `farfetch_order_created_at` AS `farfetch_order_created_at`
  , `is_financial_values_processed` AS `is_financial_values_processed`
  , `grand_total` AS `grand_total`
  , `is_next_day` AS `is_next_day`
  , `is_personal_shopper` AS `is_personal_shopper`
  , `is_same_day` AS `is_same_day`
  , `items_total` AS `items_total`
  , `fps_stock_point_code` AS `fps_stock_point_code`
  , `farfetch_order_id` AS `farfetch_order_id`
  , `fps_order_code` AS `fps_order_code`
  , `fps_stock_point_id` AS `fps_stock_point_id`
  , `promo_code` AS `promo_code`
  , `prop_invoice` AS `prop_invoice`
  , `ship_from_address` AS `ship_from_address`
  , `ship_tax_percent` AS `ship_tax_percent`
  , `order_shipping_tax_base_amount` AS `order_shipping_tax_base_amount`
  , `order_shipping_price_base_amount` AS `order_shipping_price_base_amount`
  , `store_total_tax_value` AS `store_total_tax_value`
  , `fps_tenant_id` AS `fps_tenant_id`
  , `is_zone_use_euro` AS `is_zone_use_euro`
  , `selected_step` AS `selected_step`
  , `billing_ddd` AS `billing_ddd`
  , `billing_neighborhood` AS `billing_neighborhood`
  , `customer_ddd` AS `customer_ddd`
  , `customer_neighborhood` AS `customer_neighborhood`
  , `files_url` AS `files_url`
  , `file_name` AS `file_name`
  , `file_time` AS `file_time`
  , `fps_order_id` AS `fps_order_id`
  , `_raw_is_pre_oder_child` AS `_raw_is_pre_oder_child`
FROM layer_1
WHERE 1=1
                     ) SELECT * FROM final 
  );
    