



    
                    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_inventory_unit_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`user_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`user_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `user_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`warehouse_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`warehouse_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_warehouse_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bin_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bin_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_warehouse_bin_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`serial_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`serial_number` AS string)), '') AS string) END as string)
 AS `serial_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price_currency` AS string)), '') AS string) END as string)
 AS `base_currency`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price_cents` AS string)), '') AS string) IN ('0','0.0','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `price_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payout_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payout_currency` AS string)), '') AS string) END as string)
 AS `payout_currency`
  , CAST(NULL AS numeric) AS `_3p_payout_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cost_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cost_currency` AS string)), '') AS string) END as string)
 AS `cost_currency`
  , 

    round(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cost_cents` AS string)), '') AS string) IN ('0','0.0','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cost_cents` AS string)), '') AS string) END as numeric)
 / 100, 2) AS `_1p_cost_base_amount`
  , 

    CASE 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`consignor_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consignor_status` AS string)), '') AS string) END as float64)
 as int64)

WHEN 0 THEN cast( 'in_stock' AS string)
WHEN 1 THEN cast( 'in_stock_allocated' AS string)
WHEN 2 THEN cast( 'in_transit' AS string)
WHEN 3 THEN cast( 'requested_withdrawal' AS string)
WHEN 4 THEN cast( 'review' AS string)
WHEN 5 THEN cast( 'sold_pos' AS string)
WHEN 6 THEN cast( 'sold_web' AS string)
WHEN 7 THEN cast( 'withdrawn' AS string)
WHEN 8 THEN cast( 'in_stock_allocated_transfer' AS string)
WHEN 9 THEN cast( 'quarantine' AS string)
WHEN 10 THEN cast( 'consignor_return' AS string)
WHEN 11 THEN cast( 'rejected' AS string)
WHEN 12 THEN cast( 'returned' AS string)
WHEN 13 THEN cast( 'draft' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`consignor_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`consignor_status` AS string)), '') AS string) END AS string)
END AS `consignment_status`
  , 

    CASE 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`paid_out_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`paid_out_status` AS string)), '') AS string) END as float64)
 as int64)

WHEN 0 THEN cast( 'invoiced' AS string)
WHEN 1 THEN cast( 'paid_out' AS string)
WHEN 2 THEN cast( 'pending' AS string)
WHEN 3 THEN cast( 'in_review' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`paid_out_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`paid_out_status` AS string)), '') AS string) END AS string)
END AS `paid_out_status`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`received_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`received_date` AS string)), '') AS string) END as timestamp)
 as date)
 AS `intake_date`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_date` AS string)), '') AS string) IN ('1900-01-01 00:00:00','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_date` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `sold_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_in_x3_at` AS string)), '') AS string) IN ('1900-01-01 00:00:00','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_in_x3_at` AS string)), '') AS string) END as timestamp)
 as date)
 AS `x3_creation_date`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`source` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`source` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`source` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`source` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `is_dropshipped`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`condition1_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`condition1_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_pim_product_condition_id_1`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`condition2_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`condition2_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_pim_product_condition_id_2`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`condition3_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`condition3_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_pim_product_condition_id_3`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`condition4_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`condition4_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_pim_product_condition_id_4`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`condition5_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`condition5_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_pim_product_condition_id_5`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`issue_date` AS string)), '') AS string) IN ('1753-01-01 00:00:00','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`issue_date` AS string)), '') AS string) END as timestamp)
 as date)
 AS `issue_date`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`lock_version` AS string)), '') AS string) END as float64)
 as int64)
 AS `lock_version`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`locked_for_x3_update_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`locked_for_x3_update_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `locked_for_x3_update_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_number` AS string)), '') AS string) END as string)
 AS `invoice_number`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`returned_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`returned_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `returned_at`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`original_inventory_unit_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`original_inventory_unit_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `original_ether_wms_inventory_unit_id`
  , CAST(NULL AS string) AS `size`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `product_id`
  , 

    CASE 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stock_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stock_status` AS string)), '') AS string) END as float64)
 as int64)

WHEN 0 THEN cast( 'A - Available' AS string)
WHEN 1 THEN cast( 'AC - Being Cheffed' AS string)
WHEN 2 THEN cast( 'Q - Quarantine' AS string)
WHEN 3 THEN cast( 'RW - Requested Withdrawal' AS string)
WHEN 4 THEN cast( 'R - Rejected' AS string)
WHEN 5 THEN cast( 'A1 - Being Cheffed' AS string)
WHEN 6 THEN cast( 'A2 - Remove From Web' AS string)
WHEN 7 THEN cast( 'A3 - In Photos' AS string)
WHEN 8 THEN cast( 'AD - Item On display' AS string)
WHEN 9 THEN cast( 'AZ - FBA Preparation' AS string)
WHEN 10 THEN cast( 'Q1 - Hidden' AS string)
WHEN 11 THEN cast( 'A4 - Photos' AS string)
WHEN 12 THEN cast( 'No Status' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`stock_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stock_status` AS string)), '') AS string) END AS string)
END AS `stock_status_label`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`source_updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`source_updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `source_updated_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dss_item_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dss_item_id` AS string)), '') AS string) END as string)
 AS `dss_item_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dss_incremental_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dss_incremental_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `dss_incremental_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`wms_variant_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`wms_variant_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `ether_wms_product_variant_id`
  , 

    CASE 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sales_channel` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sales_channel` AS string)), '') AS string) END as float64)
 as int64)

WHEN 0 THEN cast( 'web' AS string)
WHEN 1 THEN cast( 'pos' AS string)
WHEN 2 THEN cast( 'source' AS string)
ELSE cast(CASE WHEN cast(nullif(trim(cast(`sales_channel` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sales_channel` AS string)), '') AS string) END AS string)
END AS `sales_channel`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`label_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`label_number` AS string)), '') AS string) END as string)
 AS `label_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`
  , `in_display_case` AS `_raw_in_display_case`
  , `label_generated_at` AS `_raw_label_generated_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_inventory_units`

WHERE 1=1
AND id NOT IN ('12677628')
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast(CASE WHEN base_currency = 'EUR' THEN 'STADIUM GOODS EU' ELSE 'STADIUM GOODS USA' END as string)
 AS `business_entity`
FROM layer_0
WHERE 1=1
                     ) , layer_2 AS ( 
                    SELECT
    *
  , 
    

    CAST(

    split(
        stock_status_label,
        ' - '
        )[safe_offset(0)]

 AS string)

 AS `stock_status`
FROM layer_1
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `ether_wms_inventory_unit_id` AS `ether_wms_inventory_unit_id`
  , `user_id` AS `user_id`
  , `ether_wms_warehouse_id` AS `ether_wms_warehouse_id`
  , `ether_wms_warehouse_bin_id` AS `ether_wms_warehouse_bin_id`
  , `serial_number` AS `serial_number`
  , `base_currency` AS `base_currency`
  , `business_entity` AS `business_entity`
  , `price_base_amount` AS `price_base_amount`
  , `_3p_payout_base_amount` AS `_3p_payout_base_amount`
  , `_1p_cost_base_amount` AS `_1p_cost_base_amount`
  , `consignment_status` AS `consignment_status`
  , `paid_out_status` AS `paid_out_status`
  , `intake_date` AS `intake_date`
  , `sold_at` AS `sold_at`
  , `x3_creation_date` AS `x3_creation_date`
  , `is_dropshipped` AS `is_dropshipped`
  , `ether_pim_product_condition_id_1` AS `ether_pim_product_condition_id_1`
  , `ether_pim_product_condition_id_2` AS `ether_pim_product_condition_id_2`
  , `ether_pim_product_condition_id_3` AS `ether_pim_product_condition_id_3`
  , `ether_pim_product_condition_id_4` AS `ether_pim_product_condition_id_4`
  , `ether_pim_product_condition_id_5` AS `ether_pim_product_condition_id_5`
  , `issue_date` AS `issue_date`
  , `lock_version` AS `lock_version`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `locked_for_x3_update_at` AS `locked_for_x3_update_at`
  , `invoice_number` AS `invoice_number`
  , `returned_at` AS `returned_at`
  , `original_ether_wms_inventory_unit_id` AS `original_ether_wms_inventory_unit_id`
  , `size` AS `size`
  , `product_id` AS `product_id`
  , `stock_status_label` AS `stock_status_label`
  , `stock_status` AS `stock_status`
  , `source_updated_at` AS `source_updated_at`
  , `dss_item_id` AS `dss_item_id`
  , `dss_incremental_id` AS `dss_incremental_id`
  , `ether_wms_product_variant_id` AS `ether_wms_product_variant_id`
  , `sales_channel` AS `sales_channel`
  , `label_number` AS `label_number`
  , `_synched_from_source_at` AS `_synched_from_source_at`
  , `_raw_in_display_case` AS `_raw_in_display_case`
  , `_raw_label_generated_at` AS `_raw_label_generated_at`
FROM layer_2
WHERE 1=1
                     ) SELECT * FROM final 