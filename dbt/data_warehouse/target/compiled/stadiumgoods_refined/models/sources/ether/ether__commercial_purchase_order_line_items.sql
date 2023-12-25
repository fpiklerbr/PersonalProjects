



    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_commercial_purchase_order_line_item_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`purchase_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`purchase_order_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_commercial_purchase_order_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sku` AS string)), '') AS string) END as string)
 AS `mfg_sku`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`size` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`size` AS string)), '') AS string) END as string)
 AS `size`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`expected_quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`expected_quantity` AS string)), '') AS string) END as float64)
 as int64)
 AS `expected_quantity`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`received_quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`received_quantity` AS string)), '') AS string) END as float64)
 as int64)
 AS `received_quantity`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`rejected_quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`rejected_quantity` AS string)), '') AS string) END as float64)
 as int64)
 AS `rejected_quantity`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price_currency` AS string)), '') AS string) END as string)
 AS `base_currency`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price_cents` AS string)), '') AS string) IN ('0','0.0','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `price_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cost_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cost_currency` AS string)), '') AS string) END as string)
 AS `cost_currency`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cost_cents` AS string)), '') AS string) IN ('0','0.0','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cost_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `cost_base_amount`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
  , `variant_id` AS `_raw_variant_id`
  , `product_id` AS `_raw_product_id`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_purchase_order_line_items`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `ether_commercial_purchase_order_line_item_id` AS `ether_commercial_purchase_order_line_item_id`
  , `ether_commercial_purchase_order_id` AS `ether_commercial_purchase_order_id`
  , `mfg_sku` AS `mfg_sku`
  , `size` AS `size`
  , `expected_quantity` AS `expected_quantity`
  , `received_quantity` AS `received_quantity`
  , `rejected_quantity` AS `rejected_quantity`
  , `base_currency` AS `base_currency`
  , `price_base_amount` AS `price_base_amount`
  , `cost_base_amount` AS `cost_base_amount`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `_synched_from_source_at` AS `_synched_from_source_at`
  , `_raw_variant_id` AS `_raw_variant_id`
  , `_raw_product_id` AS `_raw_product_id`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final 