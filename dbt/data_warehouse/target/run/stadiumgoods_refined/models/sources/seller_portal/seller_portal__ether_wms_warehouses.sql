

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_wms_warehouses`
  OPTIONS()
  as 



    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_warehouse_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`code` AS string)), '') AS string) END as string)
 AS `warehouse_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`name` AS string)), '') AS string) END as string)
 AS `warehouse_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`street1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`street1` AS string)), '') AS string) END as string)
 AS `street1`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`street2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`street2` AS string)), '') AS string) END as string)
 AS `street2`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`city` AS string)), '') AS string) END as string)
 AS `city`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`state` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`state` AS string)), '') AS string) END as string)
 AS `state`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`zip` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`zip` AS string)), '') AS string) END as string)
 AS `zip`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`country` AS string)), '') AS string) END as string)
 AS `country`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`phone` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`phone` AS string)), '') AS string) END as string)
 AS `phone`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`email` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`email` AS string)), '') AS string) END as string)
 AS `email`
  , CAST(NULL AS boolean) AS `is_default`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`intake_enabled` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`intake_enabled` AS string)), '') AS string) END as float64)
 as int64)
 AS `intake_enabled`
  , CAST(NULL AS int64) AS `default_delivery_method`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transfer_bin_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transfer_bin_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `transfer_bin_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) END as float64)
 as int64)
 AS `lock_version`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`third_party` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`third_party` AS string)), '') AS string) END as float64)
 as int64)
 AS `third_party`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`active_for_reallocation` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`active_for_reallocation` AS string)), '') AS string) END as float64)
 as int64)
 AS `active_for_reallocation`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dss` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dss` AS string)), '') AS string) END as float64)
 as int64)
 AS `dss`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`intake_shipments_allocation_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`intake_shipments_allocation_rate` AS string)), '') AS string) END as float64)
 as int64)
 AS `intake_shipments_allocation_rate`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipments_enabled` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipments_enabled` AS string)), '') AS string) END as float64)
 as int64)
 AS `shipments_enabled`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
  , `number_of_carts` AS `_raw_number_of_carts`
  , `number_of_slots_per_cart` AS `_raw_number_of_slots_per_cart`
  , `number_of_items_per_slot` AS `_raw_number_of_items_per_slot`
  , `client_code_prefix` AS `_raw_client_code_prefix`
  , `digital` AS `_raw_digital`
  , `withdrawal_enabled` AS `_raw_withdrawal_enabled`
  , `audit_enabled` AS `_raw_audit_enabled`
  , `enabled` AS `_raw_enabled`
  , `transfer_enabled` AS `_raw_transfer_enabled`
  , `vendor_withdrawal_enabled` AS `_raw_vendor_withdrawal_enabled`
  , `currency` AS `_raw_currency`
  , `poly_bag_labels_enabled` AS `_raw_poly_bag_labels_enabled`
  , `sellable` AS `_raw_sellable`
  , `price_balancing_priority_group` AS `_raw_price_balancing_priority_group`
  , `price_balancing_priority_order` AS `_raw_price_balancing_priority_order`
  , `returns_warehouse_id` AS `_raw_returns_warehouse_id`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_warehouses`

WHERE 1=1
                 ) , final AS ( 
                    SELECT

    `ether_wms_warehouse_id` AS `ether_wms_warehouse_id`
  , `warehouse_code` AS `warehouse_code`
  , `warehouse_name` AS `warehouse_name`
  , `street1` AS `street1`
  , `street2` AS `street2`
  , `city` AS `city`
  , `state` AS `state`
  , `zip` AS `zip`
  , `country` AS `country`
  , `phone` AS `phone`
  , `email` AS `email`
  , `is_default` AS `is_default`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `intake_enabled` AS `intake_enabled`
  , `default_delivery_method` AS `default_delivery_method`
  , `transfer_bin_id` AS `transfer_bin_id`
  , `lock_version` AS `lock_version`
  , `third_party` AS `third_party`
  , `active_for_reallocation` AS `active_for_reallocation`
  , `dss` AS `dss`
  , `intake_shipments_allocation_rate` AS `intake_shipments_allocation_rate`
  , `shipments_enabled` AS `shipments_enabled`
  , `_synched_from_source_at` AS `_synched_from_source_at`
  , `_raw_number_of_carts` AS `_raw_number_of_carts`
  , `_raw_number_of_slots_per_cart` AS `_raw_number_of_slots_per_cart`
  , `_raw_number_of_items_per_slot` AS `_raw_number_of_items_per_slot`
  , `_raw_client_code_prefix` AS `_raw_client_code_prefix`
  , `_raw_digital` AS `_raw_digital`
  , `_raw_withdrawal_enabled` AS `_raw_withdrawal_enabled`
  , `_raw_audit_enabled` AS `_raw_audit_enabled`
  , `_raw_enabled` AS `_raw_enabled`
  , `_raw_transfer_enabled` AS `_raw_transfer_enabled`
  , `_raw_vendor_withdrawal_enabled` AS `_raw_vendor_withdrawal_enabled`
  , `_raw_currency` AS `_raw_currency`
  , `_raw_poly_bag_labels_enabled` AS `_raw_poly_bag_labels_enabled`
  , `_raw_sellable` AS `_raw_sellable`
  , `_raw_price_balancing_priority_group` AS `_raw_price_balancing_priority_group`
  , `_raw_price_balancing_priority_order` AS `_raw_price_balancing_priority_order`
  , `_raw_returns_warehouse_id` AS `_raw_returns_warehouse_id`
FROM layer_0
WHERE 1=1
                     ) SELECT * FROM final ;

