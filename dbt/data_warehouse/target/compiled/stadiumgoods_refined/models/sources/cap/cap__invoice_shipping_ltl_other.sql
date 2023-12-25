




    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as string)
 AS `order_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`warehouse_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`warehouse_id` AS string)), '') AS string) END as string)
 AS `warehouse_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`external_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`external_order_id` AS string)), '') AS string) END as string)
 AS `external_order_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`po_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`po_number` AS string)), '') AS string) END as string)
 AS `po_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_source` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_source` AS string)), '') AS string) END as string)
 AS `order_source`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_order_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_order_type` AS string)), '') AS string) END as string)
 AS `billing_order_type`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sales_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sales_date` AS string)), '') AS string) END as timestamp)
 as date)
 AS `sales_date`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`business_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`business_name` AS string)), '') AS string) END as string)
 AS `business_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_name` AS string)), '') AS string) END as string)
 AS `customer_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_comment` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_comment` AS string)), '') AS string) END as string)
 AS `ship_comment`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_carrier` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_carrier` AS string)), '') AS string) END as string)
 AS `ship_carrier`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tracking_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tracking_number` AS string)), '') AS string) END as string)
 AS `tracking_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`unnamed_12` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`unnamed_12` AS string)), '') AS string) END as string)
 AS `unnamed_12`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`unnamed_13` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`unnamed_13` AS string)), '') AS string) END as string)
 AS `unnamed_13`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_cost` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_cost` AS string)), '') AS string) END as float64)
 AS `ship_cost`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cartons_created` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cartons_created` AS string)), '') AS string) END as string)
 AS `cartons_created`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pallet_count` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pallet_count` AS string)), '') AS string) END as string)
 AS `pallet_count`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pallet_charge` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pallet_charge` AS string)), '') AS string) END as string)
 AS `pallet_charge`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`stretch_wrap_charge` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`stretch_wrap_charge` AS string)), '') AS string) END as string)
 AS `stretch_wrap_charge`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`freight_terms` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`freight_terms` AS string)), '') AS string) END as string)
 AS `freight_terms`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`third_party_bol_charge` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`third_party_bol_charge` AS string)), '') AS string) END as string)
 AS `third_party_bol_charge`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipped_from` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipped_from` AS string)), '') AS string) END as string)
 AS `shipped_from`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`warehouse` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`warehouse` AS string)), '') AS string) END as string)
 AS `warehouse`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_weight` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_weight` AS string)), '') AS string) END as string)
 AS `order_weight`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`number_of_cartons` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`number_of_cartons` AS string)), '') AS string) END as string)
 AS `number_of_cartons`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cartons_created_1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cartons_created_1` AS string)), '') AS string) END as string)
 AS `cartons_created_1`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipped_on_bol` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipped_on_bol` AS string)), '') AS string) END as string)
 AS `shipped_on_bol`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bol_pallet_count` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bol_pallet_count` AS string)), '') AS string) END as string)
 AS `bol_pallet_count`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bol_carton_count` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bol_carton_count` AS string)), '') AS string) END as string)
 AS `bol_carton_count`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pro_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pro_number` AS string)), '') AS string) END as string)
 AS `pro_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`load_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`load_number` AS string)), '') AS string) END as string)
 AS `load_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_pallet_count` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_pallet_count` AS string)), '') AS string) END as string)
 AS `shipment_pallet_count`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_number` AS string)), '') AS string) END as string)
 AS `shipment_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bol_weight` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bol_weight` AS string)), '') AS string) END as string)
 AS `bol_weight`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`bol_volume` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`bol_volume` AS string)), '') AS string) END as string)
 AS `bol_volume`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`already_invoiced` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`already_invoiced` AS string)), '') AS string) END as string)
 AS `already_invoiced`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_to_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_to_country` AS string)), '') AS string) END as string)
 AS `ship_to_country`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sheet_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sheet_name` AS string)), '') AS string) END as string)
 AS `sheet_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`
FROM `ff-stadiumgoods-raw-live`.`imports`.`cap_invoice_shipping_ltl_other`

WHERE 1=1
AND file_name NOT IN ('ZD Transaction History - 10_31_20 FOR ZD (1).xlsx', 'ZF Transaction History - 2.29.20 FOR ZF (2).xlsx', 'ZI Transaction History - 2.29.20 FOR ZI (2).xlsx', 'ZJ Transaction History - 2.29.20 FOR ZJ (2).xlsx', 'ZN Transaction History - 2.29.20 FOR ZN (2).xlsx')
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast(left(file_name, 2) as string)
 AS `cap_client_center`
FROM layer_0
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `order_id` AS `order_id`
  , `warehouse_id` AS `warehouse_id`
  , `external_order_id` AS `external_order_id`
  , `po_number` AS `po_number`
  , `order_source` AS `order_source`
  , `billing_order_type` AS `billing_order_type`
  , `sales_date` AS `sales_date`
  , `business_name` AS `business_name`
  , `customer_name` AS `customer_name`
  , `ship_comment` AS `ship_comment`
  , `ship_carrier` AS `ship_carrier`
  , `tracking_number` AS `tracking_number`
  , `unnamed_12` AS `unnamed_12`
  , `unnamed_13` AS `unnamed_13`
  , `ship_cost` AS `ship_cost`
  , `cartons_created` AS `cartons_created`
  , `pallet_count` AS `pallet_count`
  , `pallet_charge` AS `pallet_charge`
  , `stretch_wrap_charge` AS `stretch_wrap_charge`
  , `freight_terms` AS `freight_terms`
  , `third_party_bol_charge` AS `third_party_bol_charge`
  , `shipped_from` AS `shipped_from`
  , `warehouse` AS `warehouse`
  , `order_weight` AS `order_weight`
  , `number_of_cartons` AS `number_of_cartons`
  , `cartons_created_1` AS `cartons_created_1`
  , `shipped_on_bol` AS `shipped_on_bol`
  , `bol_pallet_count` AS `bol_pallet_count`
  , `bol_carton_count` AS `bol_carton_count`
  , `pro_number` AS `pro_number`
  , `load_number` AS `load_number`
  , `shipment_pallet_count` AS `shipment_pallet_count`
  , `shipment_number` AS `shipment_number`
  , `bol_weight` AS `bol_weight`
  , `bol_volume` AS `bol_volume`
  , `already_invoiced` AS `already_invoiced`
  , `ship_to_country` AS `ship_to_country`
  , `file_name` AS `file_name`
  , `sheet_name` AS `sheet_name`
  , `file_time` AS `file_time`
  , `cap_client_center` AS `cap_client_center`
FROM layer_1
WHERE 1=1
                     ) SELECT * FROM final 