



    
                    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_oms_order_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`number` AS string)), '') AS string) END as string)
 AS `ether_order_number`
  , CAST(NULL AS string) AS `order_type`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_date` AS string)), '') AS string) END as timestamp)
 as date)
 AS `order_date`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`delivery_method_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`delivery_method_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_oms_delivery_method_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_email` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_email` AS string)), '') AS string) END as string)
 AS `customer_email`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ecommerce_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ecommerce_order_id` AS string)), '') AS string) END as string)
 AS `ecommerce_order_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ecommerce_order_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ecommerce_order_status` AS string)), '') AS string) END as string)
 AS `ecommerce_order_status`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sales_channel_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sales_channel_order_id` AS string)), '') AS string) END as string)
 AS `sales_channel_order_id`
  , 

    CASE 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`allocation_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`allocation_status` AS string)), '') AS string) END as float64)
 as int64)

WHEN 1 THEN cast( 'not_allocated' AS string)
WHEN 2 THEN cast( 'partially_allocated' AS string)
WHEN 3 THEN cast( 'allocated' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`allocation_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`allocation_status` AS string)), '') AS string) END AS string)
END AS `allocation_status`
  , 

    CASE 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`delivery_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`delivery_status` AS string)), '') AS string) END as float64)
 as int64)

WHEN 1 THEN cast( 'not_delivered' AS string)
WHEN 2 THEN cast( 'partially_delivered' AS string)
WHEN 3 THEN cast( 'delivered' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`delivery_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`delivery_status` AS string)), '') AS string) END AS string)
END AS `delivery_status`
  , CAST(NULL AS string) AS `hold_status`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_name` AS string)), '') AS string) END as string)
 AS `shipping_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_phone` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_phone` AS string)), '') AS string) END as string)
 AS `shipping_phone`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_address1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_address1` AS string)), '') AS string) END as string)
 AS `shipping_address_line_1`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_address2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_address2` AS string)), '') AS string) END as string)
 AS `shipping_address_line_2`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_city` AS string)), '') AS string) END as string)
 AS `shipping_city`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_region` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_region` AS string)), '') AS string) END as string)
 AS `shipping_region_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_region_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_region_code` AS string)), '') AS string) END as string)
 AS `shipping_region_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_postal` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_postal` AS string)), '') AS string) END as string)
 AS `shipping_postcode`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_country` AS string)), '') AS string) END as string)
 AS `shipping_country_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_country_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_country_code` AS string)), '') AS string) END as string)
 AS `shipping_country_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_name` AS string)), '') AS string) END as string)
 AS `billing_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_address1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_address1` AS string)), '') AS string) END as string)
 AS `billing_address_line_1`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_address2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_address2` AS string)), '') AS string) END as string)
 AS `billing_address_line_2`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_city` AS string)), '') AS string) END as string)
 AS `billing_city`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_region` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_region` AS string)), '') AS string) END as string)
 AS `billing_region_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_postal` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_postal` AS string)), '') AS string) END as string)
 AS `billing_postcode`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_country` AS string)), '') AS string) END as string)
 AS `billing_country_name`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sales_channel_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sales_channel_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_oms_sales_channel_id`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`
  , CAST(NULL AS date) AS `order_ship_date`
  , 

    CASE 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as float64)
 as int64)

WHEN 1 THEN cast( 'open' AS string)
WHEN 2 THEN cast( 'closed' AS string)
WHEN 3 THEN cast( 'cancellation_requested' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END AS string)
END AS `order_status`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`items_count` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`items_count` AS string)), '') AS string) END as float64)
 as int64)
 AS `total_qty`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipped_items_count` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipped_items_count` AS string)), '') AS string) END as float64)
 as int64)
 AS `shipped_qty`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`closed_items_count` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`closed_items_count` AS string)), '') AS string) END as float64)
 as int64)
 AS `closed_qty`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shortage_items_count` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shortage_items_count` AS string)), '') AS string) END as float64)
 as int64)
 AS `shortage_qty`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sla_fulfillment_deadline` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sla_fulfillment_deadline` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `sla_fulfillment_deadline`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`locked_for_x3_update_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`locked_for_x3_update_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `locked_for_x3_update_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ecommerce_customer_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ecommerce_customer_id` AS string)), '') AS string) END as string)
 AS `ecommerce_customer_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) END as float64)
 as int64)
 AS `lock_version`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_exception` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_exception` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_exception` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_exception` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `is_exception`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_vip` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_vip` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_vip` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_vip` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `is_vip`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`reallocation_escalated` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reallocation_escalated` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`reallocation_escalated` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reallocation_escalated` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `reallocation_is_escalated`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`locked_for_fulfillment_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`locked_for_fulfillment_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `locked_for_fulfillment_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`carrier_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`carrier_code` AS string)), '') AS string) END as string)
 AS `carrier_code`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`hazardous` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`hazardous` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`hazardous` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`hazardous` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `is_hazardous`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fulfillment_blocked_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fulfillment_blocked_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `fulfillment_blocked_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`active_items_count` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`active_items_count` AS string)), '') AS string) END as float64)
 as int64)
 AS `active_qty`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_region_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_region_code` AS string)), '') AS string) END as string)
 AS `billing_region_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bill_country_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bill_country_code` AS string)), '') AS string) END as string)
 AS `billing_country_code`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_amount_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_amount_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `shipping_price_base_amount`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_tax_amount_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_tax_amount_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `shipping_tax_base_amount`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_discount_amount_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_discount_amount_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `shipping_discount_base_amount`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`grand_total_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`grand_total_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `total_payment_base_amount`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credit_amount_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credit_amount_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `total_credit_base_amount`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_refunded_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_refunded_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `total_refunded_base_amount`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credit_total_refunded_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credit_total_refunded_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `credit_refunded_base_amount`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_invoiced_amount_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_invoiced_amount_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `total_invoiced_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ecommerce_shipping_method` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ecommerce_shipping_method` AS string)), '') AS string) END as string)
 AS `ecommerce_shipping_method`
  , 

    CASE 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fulfillment_channel` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fulfillment_channel` AS string)), '') AS string) END as float64)
 as int64)

WHEN 0 THEN cast( 'stadium_goods' AS string)
WHEN 1 THEN cast( 'dss' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`fulfillment_channel` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fulfillment_channel` AS string)), '') AS string) END AS string)
END AS `fulfillment_channel`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ecommerce_sales_channel` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ecommerce_sales_channel` AS string)), '') AS string) END as string)
 AS `ecommerce_sales_channel`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`source_updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`source_updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `source_updated_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ecommerce_discount_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ecommerce_discount_code` AS string)), '') AS string) END as string)
 AS `ecommerce_discount_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sent_to_farfetch_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sent_to_farfetch_at` AS string)), '') AS string) END as string)
 AS `sent_to_farfetch_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_source` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_source` AS string)), '') AS string) END as string)
 AS `tax_source`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_adjustment_amount_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_adjustment_amount_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `tax_adjustment_base_amount`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount_adjustment_amount_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount_adjustment_amount_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `discount_adjustment_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`currency` AS string)), '') AS string) END as string)
 AS `base_currency`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_by_employee_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_by_employee_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `created_by_employee_id`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_adjustment_amount_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_adjustment_amount_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `shipping_adjustment_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ecommerce_order_prefix` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ecommerce_order_prefix` AS string)), '') AS string) END as string)
 AS `ecommerce_order_prefix`
  , `placed_at` AS `_raw_placed_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_orders`

WHERE 1=1
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast(coalesce(shipping_region_code, shipping_region_name) as string)
 AS `shipping_region`
  , 
    safe_cast(coalesce(shipping_country_code, shipping_country_name) as string)
 AS `shipping_country`
FROM layer_0
WHERE 1=1
                     ) , layer_2 AS ( 
                    SELECT
    *
  , 
    CAST(regexp_extract(ecommerce_order_id, 
  r'[0-9]{9}'
) AS string) AS `ecommerce_order_regex`
FROM layer_1
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `ether_oms_order_id` AS `ether_oms_order_id`
  , `ether_order_number` AS `ether_order_number`
  , `order_type` AS `order_type`
  , `order_date` AS `order_date`
  , `ether_oms_delivery_method_id` AS `ether_oms_delivery_method_id`
  , `customer_email` AS `customer_email`
  , `ecommerce_order_id` AS `ecommerce_order_id`
  , `ecommerce_order_status` AS `ecommerce_order_status`
  , `sales_channel_order_id` AS `sales_channel_order_id`
  , `allocation_status` AS `allocation_status`
  , `delivery_status` AS `delivery_status`
  , `hold_status` AS `hold_status`
  , to_hex(md5(cast(`shipping_name` as 
    string
))) AS `shipping_name`
  , to_hex(md5(cast(`shipping_phone` as 
    string
))) AS `shipping_phone`
  , to_hex(md5(cast(`shipping_address_line_1` as 
    string
))) AS `shipping_address_line_1`
  , to_hex(md5(cast(`shipping_address_line_2` as 
    string
))) AS `shipping_address_line_2`
  , `shipping_city` AS `shipping_city`
  , `shipping_region_name` AS `shipping_region_name`
  , `shipping_region_code` AS `shipping_region_code`
  , `shipping_region` AS `shipping_region`
  , `shipping_postcode` AS `shipping_postcode`
  , `shipping_country_name` AS `shipping_country_name`
  , `shipping_country_code` AS `shipping_country_code`
  , `shipping_country` AS `shipping_country`
  , to_hex(md5(cast(`billing_name` as 
    string
))) AS `billing_name`
  , to_hex(md5(cast(`billing_address_line_1` as 
    string
))) AS `billing_address_line_1`
  , to_hex(md5(cast(`billing_address_line_2` as 
    string
))) AS `billing_address_line_2`
  , `billing_city` AS `billing_city`
  , `billing_region_name` AS `billing_region_name`
  , `billing_postcode` AS `billing_postcode`
  , `billing_country_name` AS `billing_country_name`
  , `ether_oms_sales_channel_id` AS `ether_oms_sales_channel_id`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `order_ship_date` AS `order_ship_date`
  , `order_status` AS `order_status`
  , `total_qty` AS `total_qty`
  , `shipped_qty` AS `shipped_qty`
  , `closed_qty` AS `closed_qty`
  , `shortage_qty` AS `shortage_qty`
  , `sla_fulfillment_deadline` AS `sla_fulfillment_deadline`
  , `locked_for_x3_update_at` AS `locked_for_x3_update_at`
  , `ecommerce_customer_id` AS `ecommerce_customer_id`
  , `lock_version` AS `lock_version`
  , `is_exception` AS `is_exception`
  , `is_vip` AS `is_vip`
  , `reallocation_is_escalated` AS `reallocation_is_escalated`
  , `locked_for_fulfillment_at` AS `locked_for_fulfillment_at`
  , `carrier_code` AS `carrier_code`
  , `is_hazardous` AS `is_hazardous`
  , `fulfillment_blocked_at` AS `fulfillment_blocked_at`
  , `active_qty` AS `active_qty`
  , `billing_region_code` AS `billing_region_code`
  , `billing_country_code` AS `billing_country_code`
  , `shipping_price_base_amount` AS `shipping_price_base_amount`
  , `shipping_tax_base_amount` AS `shipping_tax_base_amount`
  , `shipping_discount_base_amount` AS `shipping_discount_base_amount`
  , `total_payment_base_amount` AS `total_payment_base_amount`
  , `total_credit_base_amount` AS `total_credit_base_amount`
  , `total_refunded_base_amount` AS `total_refunded_base_amount`
  , `credit_refunded_base_amount` AS `credit_refunded_base_amount`
  , `total_invoiced_base_amount` AS `total_invoiced_base_amount`
  , `ecommerce_shipping_method` AS `ecommerce_shipping_method`
  , `fulfillment_channel` AS `fulfillment_channel`
  , `ecommerce_sales_channel` AS `ecommerce_sales_channel`
  , `source_updated_at` AS `source_updated_at`
  , `ecommerce_discount_code` AS `ecommerce_discount_code`
  , `_synched_from_source_at` AS `_synched_from_source_at`
  , `sent_to_farfetch_at` AS `sent_to_farfetch_at`
  , `tax_source` AS `tax_source`
  , `tax_adjustment_base_amount` AS `tax_adjustment_base_amount`
  , `discount_adjustment_base_amount` AS `discount_adjustment_base_amount`
  , `base_currency` AS `base_currency`
  , `created_by_employee_id` AS `created_by_employee_id`
  , `shipping_adjustment_base_amount` AS `shipping_adjustment_base_amount`
  , `ecommerce_order_prefix` AS `ecommerce_order_prefix`
  , `ecommerce_order_regex` AS `ecommerce_order_regex`
  , `_raw_placed_at` AS `_raw_placed_at`
FROM layer_2
WHERE 1=1
                     ) SELECT * FROM final 