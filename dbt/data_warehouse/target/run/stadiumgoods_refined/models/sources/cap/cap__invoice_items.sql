

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`cap__invoice_items`
  OPTIONS()
  as 



    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`crosscheck` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`crosscheck` AS string)), '') AS string) END as string)
 AS `crosscheck`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`business_customer_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`business_customer_name` AS string)), '') AS string) END as string)
 AS `business_customer_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`adjusted_cartons` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`adjusted_cartons` AS string)), '') AS string) END as string)
 AS `adjusted_cartons`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`adjusted_cases` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`adjusted_cases` AS string)), '') AS string) END as string)
 AS `adjusted_cases`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`adjusted_inners` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`adjusted_inners` AS string)), '') AS string) END as string)
 AS `adjusted_inners`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`adjusted_lines` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`adjusted_lines` AS string)), '') AS string) END as string)
 AS `adjusted_lines`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`adjusted_pallets` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`adjusted_pallets` AS string)), '') AS string) END as string)
 AS `adjusted_pallets`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`adjusted_pieces` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`adjusted_pieces` AS string)), '') AS string) END as float64)
 AS `adjusted_pieces`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`adjusted_unit` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`adjusted_unit` AS string)), '') AS string) END as float64)
 AS `adjusted_unit`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`adjusted_withdrawals_and_store_replenishment` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`adjusted_withdrawals_and_store_replenishment` AS string)), '') AS string) END as string)
 AS `adjusted_withdrawals_and_store_replenishment`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`adjustment` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`adjustment` AS string)), '') AS string) END as string)
 AS `adjustment`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`already_invoiced` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`already_invoiced` AS string)), '') AS string) END as string)
 AS `already_invoiced`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_order_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_order_type` AS string)), '') AS string) END as string)
 AS `billing_order_type`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_product_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_product_type` AS string)), '') AS string) END as string)
 AS `billing_product_type`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`carton_charge` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`carton_charge` AS string)), '') AS string) END as string)
 AS `carton_charge`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`carton_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`carton_fee` AS string)), '') AS string) END as string)
 AS `carton_fee`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cartons_created` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cartons_created` AS string)), '') AS string) END as string)
 AS `cartons_created`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`case_charge` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`case_charge` AS string)), '') AS string) END as string)
 AS `case_charge`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`case_cube` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`case_cube` AS string)), '') AS string) END as string)
 AS `case_cube`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`case_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`case_fee` AS string)), '') AS string) END as string)
 AS `case_fee`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`case_pack` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`case_pack` AS string)), '') AS string) END as string)
 AS `case_pack`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`comments` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`comments` AS string)), '') AS string) END as string)
 AS `comments`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`comments_internal_use_only_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`comments_internal_use_only_` AS string)), '') AS string) END as string)
 AS `comments_internal_use_only_`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_name` AS string)), '') AS string) END as string)
 AS `customer_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`hazmat` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`hazmat` AS string)), '') AS string) END as string)
 AS `hazmat`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`inners_charge` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`inners_charge` AS string)), '') AS string) END as string)
 AS `inners_charge`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`inners_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`inners_fee` AS string)), '') AS string) END as string)
 AS `inners_fee`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_charge` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_charge` AS string)), '') AS string) END as string)
 AS `line_charge`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_fee` AS string)), '') AS string) END as string)
 AS `line_fee`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as string)
 AS `cap_order_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_source` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_source` AS string)), '') AS string) END as string)
 AS `order_source`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_type` AS string)), '') AS string) END as string)
 AS `order_type`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pallet_charge` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pallet_charge` AS string)), '') AS string) END as float64)
 AS `pallet_charge`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pallet_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pallet_fee` AS string)), '') AS string) END as string)
 AS `pallet_fee`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pick_charge` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pick_charge` AS string)), '') AS string) END as float64)
 AS `pick_charge`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pick_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pick_fee` AS string)), '') AS string) END as float64)
 AS `pick_fee`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`po_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`po_number` AS string)), '') AS string) END as string)
 AS `po_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_id` AS string)), '') AS string) END as string)
 AS `product_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_name` AS string)), '') AS string) END as string)
 AS `product_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`quantity` AS string)), '') AS string) END as string)
 AS `quantity`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sales_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sales_date` AS string)), '') AS string) END as string)
 AS `sales_date`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sheet_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sheet_name` AS string)), '') AS string) END as string)
 AS `sheet_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_date` AS string)), '') AS string) END as string)
 AS `ship_date`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sku` AS string)), '') AS string) END as string)
 AS `label_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`track_serial_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`track_serial_number` AS string)), '') AS string) END as string)
 AS `track_serial_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`unit_charge` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`unit_charge` AS string)), '') AS string) END as float64)
 AS `unit_charge`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`unit_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`unit_fee` AS string)), '') AS string) END as float64)
 AS `unit_fee`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`units_per_inner_pack` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`units_per_inner_pack` AS string)), '') AS string) END as string)
 AS `units_per_inner_pack`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`uom` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`uom` AS string)), '') AS string) END as string)
 AS `uom`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`warehouse_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`warehouse_id` AS string)), '') AS string) END as string)
 AS `warehouse_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`withdrawals_and_store_replenishment_charge` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`withdrawals_and_store_replenishment_charge` AS string)), '') AS string) END as string)
 AS `withdrawals_and_store_replenishment_charge`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`withdrawals_and_store_replenishment_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`withdrawals_and_store_replenishment_fee` AS string)), '') AS string) END as string)
 AS `withdrawals_and_store_replenishment_fee`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`business_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`business_name` AS string)), '') AS string) END as string)
 AS `business_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`category` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`category` AS string)), '') AS string) END as string)
 AS `category`
FROM `ff-stadiumgoods-raw-live`.`imports`.`cap_invoice_items`

WHERE 1=1
AND file_name NOT IN ('ZD Transaction History - 10_31_20 FOR ZD (1).xlsx', 'ZF Transaction History - 2.29.20 FOR ZF (2).xlsx', 'ZI Transaction History - 2.29.20 FOR ZI (2).xlsx', 'ZJ Transaction History - 2.29.20 FOR ZJ (2).xlsx', 'ZN Transaction History - 2.29.20 FOR ZN (2).xlsx')
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast(left(file_name, 2) as string)
 AS `cap_client_center`
  , 
    safe_cast(file_time as date)
 AS `invoice_date`
  , 
    safe_cast(coalesce(pick_fee, unit_fee) as float64)
 AS `warehouse_cost`
  , 
    safe_cast(coalesce(adjusted_pieces, adjusted_unit) as float64)
 AS `warehouse_quantity`
FROM layer_0
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `crosscheck` AS `crosscheck`
  , `business_customer_name` AS `business_customer_name`
  , `adjusted_cartons` AS `adjusted_cartons`
  , `adjusted_cases` AS `adjusted_cases`
  , `adjusted_inners` AS `adjusted_inners`
  , `adjusted_lines` AS `adjusted_lines`
  , `adjusted_pallets` AS `adjusted_pallets`
  , `adjusted_pieces` AS `adjusted_pieces`
  , `adjusted_unit` AS `adjusted_unit`
  , `adjusted_withdrawals_and_store_replenishment` AS `adjusted_withdrawals_and_store_replenishment`
  , `adjustment` AS `adjustment`
  , `already_invoiced` AS `already_invoiced`
  , `billing_order_type` AS `billing_order_type`
  , `billing_product_type` AS `billing_product_type`
  , `carton_charge` AS `carton_charge`
  , `carton_fee` AS `carton_fee`
  , `cartons_created` AS `cartons_created`
  , `case_charge` AS `case_charge`
  , `case_cube` AS `case_cube`
  , `case_fee` AS `case_fee`
  , `case_pack` AS `case_pack`
  , `comments` AS `comments`
  , `comments_internal_use_only_` AS `comments_internal_use_only_`
  , `customer_name` AS `customer_name`
  , `file_name` AS `file_name`
  , `hazmat` AS `hazmat`
  , `inners_charge` AS `inners_charge`
  , `inners_fee` AS `inners_fee`
  , `line_charge` AS `line_charge`
  , `line_fee` AS `line_fee`
  , `cap_order_id` AS `cap_order_id`
  , `order_source` AS `order_source`
  , `order_type` AS `order_type`
  , `pallet_charge` AS `pallet_charge`
  , `pallet_fee` AS `pallet_fee`
  , `pick_charge` AS `pick_charge`
  , `pick_fee` AS `pick_fee`
  , `po_number` AS `po_number`
  , `product_id` AS `product_id`
  , `product_name` AS `product_name`
  , `quantity` AS `quantity`
  , `sales_date` AS `sales_date`
  , `sheet_name` AS `sheet_name`
  , `ship_date` AS `ship_date`
  , `label_number` AS `label_number`
  , `track_serial_number` AS `track_serial_number`
  , `unit_charge` AS `unit_charge`
  , `unit_fee` AS `unit_fee`
  , `units_per_inner_pack` AS `units_per_inner_pack`
  , `uom` AS `uom`
  , `warehouse_id` AS `warehouse_id`
  , `withdrawals_and_store_replenishment_charge` AS `withdrawals_and_store_replenishment_charge`
  , `withdrawals_and_store_replenishment_fee` AS `withdrawals_and_store_replenishment_fee`
  , `file_time` AS `file_time`
  , `business_name` AS `business_name`
  , `category` AS `category`
  , `cap_client_center` AS `cap_client_center`
  , `invoice_date` AS `invoice_date`
  , `warehouse_cost` AS `warehouse_cost`
  , `warehouse_quantity` AS `warehouse_quantity`
FROM layer_1
WHERE 1=1
                     ) SELECT * FROM final ;

