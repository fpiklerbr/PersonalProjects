

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_oms_order_items`
  OPTIONS()
  as 



    
                    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_oms_order_item_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_oms_order_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_number` AS string)), '') AS string) END as string)
 AS `ether_order_number`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_number` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_order_item_line_number`
  , 

    CASE 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as float64)
 as int64)

WHEN 0 THEN cast( 'pending' AS string)
WHEN 1 THEN cast( 'shortage' AS string)
WHEN 2 THEN cast( 'shipped' AS string)
WHEN 3 THEN cast( 'cancelled' AS string)
WHEN 4 THEN cast( 'cancellation_requested' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END AS string)
END AS `order_item_status`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`description` AS string)), '') AS string) END as string)
 AS `product_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`manufacturer_sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`manufacturer_sku` AS string)), '') AS string) END as string)
 AS `mfg_sku`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sgp` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sgp` AS string)), '') AS string) END as string)
 AS `product_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sku` AS string)), '') AS string) END as string)
 AS `simple_sku`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`variant_description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`variant_description` AS string)), '') AS string) END as string)
 AS `variant_size`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amount_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amount_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `item_price_base_amount`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_amount_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_amount_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `item_tax_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`requested_serial` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`requested_serial` AS string)), '') AS string) END as string)
 AS `requested_serial`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`allocated_serial` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`allocated_serial` AS string)), '') AS string) END as string)
 AS `allocated_serial`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`external_identifier` AS string)), '') AS string) IN ('`','nan','None','','NaT','0','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`external_identifier` AS string)), '') AS string) END as float64)
 as int64)
 AS `external_identifier`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`warehouse_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`warehouse_code` AS string)), '') AS string) END as string)
 AS `warehouse_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`size_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`size_code` AS string)), '') AS string) END as string)
 AS `size_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fulfillment_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fulfillment_status` AS string)), '') AS string) END as string)
 AS `fulfillment_status`
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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`returned_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`returned_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `returned_at`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ecommerce_inventory_unit_price_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ecommerce_inventory_unit_price_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `inventory_unit_price_base_amount`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount_amount_cents` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount_amount_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `item_discount_base_amount`
  , 

    CASE 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cancel_reason` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cancel_reason` AS string)), '') AS string) END as float64)
 as int64)

WHEN 0 THEN cast( 'conditional' AS string)
WHEN 1 THEN cast( 'withdrawn' AS string)
WHEN 2 THEN cast( 'available_prices_too_high' AS string)
WHEN 3 THEN cast( 'not_in_warehouse' AS string)
WHEN 4 THEN cast( 'past_sla' AS string)
WHEN 5 THEN cast( 'auto_cancelled' AS string)
WHEN 6 THEN cast( 'already_sold' AS string)
WHEN 7 THEN cast( 'donated' AS string)
WHEN 8 THEN cast( 'thrown_away' AS string)
WHEN 9 THEN cast( 'customer_issue' AS string)
WHEN 10 THEN cast( 'customer_request' AS string)
WHEN 11 THEN cast( 'fraud' AS string)
WHEN 12 THEN cast( 'integration_error' AS string)
WHEN 13 THEN cast( 'double_sold' AS string)
WHEN 14 THEN cast( 'damaged' AS string)
WHEN 15 THEN cast( 'ecommerce_cancelled' AS string)
WHEN 16 THEN cast( 'third_party_adjustment' AS string)
WHEN 17 THEN cast( 'integration_test' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`cancel_reason` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cancel_reason` AS string)), '') AS string) END AS string)
END AS `cancel_reason`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`source_updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`source_updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `source_updated_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`external_line_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`external_line_number` AS string)), '') AS string) END as string)
 AS `external_line_number`
  , `created_in_x3_at` AS `_raw_created_in_x3_at`
  , `last_modified_in_x3_at` AS `_raw_last_modified_in_x3_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_order_items`

WHERE 1=1
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast(coalesce(requested_serial, allocated_serial) as string)
 AS `serial_number`
  , 
    safe_cast(product_number || '+' || size_code as string)
 AS `variant_number`
FROM layer_0
WHERE 1=1
                     ) , layer_2 AS ( 
                    SELECT
    *
  , 
    CAST(regexp_extract(serial_number, 
  r'^d.*?-[A-Z]{2}-([0-9]{10})-'
) AS string) AS `dss_item_id`
FROM layer_1
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `ether_oms_order_item_id` AS `ether_oms_order_item_id`
  , `ether_oms_order_id` AS `ether_oms_order_id`
  , `ether_order_number` AS `ether_order_number`
  , `ether_order_item_line_number` AS `ether_order_item_line_number`
  , `order_item_status` AS `order_item_status`
  , `product_name` AS `product_name`
  , `mfg_sku` AS `mfg_sku`
  , `product_number` AS `product_number`
  , `simple_sku` AS `simple_sku`
  , `variant_size` AS `variant_size`
  , `item_price_base_amount` AS `item_price_base_amount`
  , `item_tax_base_amount` AS `item_tax_base_amount`
  , `serial_number` AS `serial_number`
  , `dss_item_id` AS `dss_item_id`
  , `external_identifier` AS `external_identifier`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `warehouse_code` AS `warehouse_code`
  , `size_code` AS `size_code`
  , `variant_number` AS `variant_number`
  , `fulfillment_status` AS `fulfillment_status`
  , `is_hazardous` AS `is_hazardous`
  , `returned_at` AS `returned_at`
  , `inventory_unit_price_base_amount` AS `inventory_unit_price_base_amount`
  , `item_discount_base_amount` AS `item_discount_base_amount`
  , `cancel_reason` AS `cancel_reason`
  , `source_updated_at` AS `source_updated_at`
  , `_synched_from_source_at` AS `_synched_from_source_at`
  , `external_line_number` AS `external_line_number`
  , `_raw_created_in_x3_at` AS `_raw_created_in_x3_at`
  , `_raw_last_modified_in_x3_at` AS `_raw_last_modified_in_x3_at`
FROM layer_2
WHERE 1=1
                     ) SELECT * FROM final ;

