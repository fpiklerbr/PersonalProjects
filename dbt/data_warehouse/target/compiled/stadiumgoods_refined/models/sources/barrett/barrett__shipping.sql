



    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`pick_ticket_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`pick_ticket_id` AS string)), '') AS string) END as string)
 AS `pick_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`master_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`master_order_id` AS string)), '') AS string) END as string)
 AS `fulfillment_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_status` AS string)), '') AS string) END as string)
 AS `order_status`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_status_description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_status_description` AS string)), '') AS string) END as string)
 AS `order_status_description`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_type` AS string)), '') AS string) END as string)
 AS `order_type`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_source` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_source` AS string)), '') AS string) END as string)
 AS `order_source`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`capacity_import_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`capacity_import_id` AS string)), '') AS string) END as string)
 AS `capacity_import_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`capacity_pick_ticket_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`capacity_pick_ticket_id` AS string)), '') AS string) END as string)
 AS `capacity_pick_ticket_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`po_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`po_number` AS string)), '') AS string) END as string)
 AS `po_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`retailer_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`retailer_code` AS string)), '') AS string) END as string)
 AS `retailer_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_number` AS string)), '') AS string) END as string)
 AS `store_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_to_location` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_to_location` AS string)), '') AS string) END as string)
 AS `ship_to_location`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`client_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`client_code` AS string)), '') AS string) END as string)
 AS `client_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dropship_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dropship_id` AS string)), '') AS string) END as string)
 AS `dropship_id`
  , 

    
    safe_cast(
    safe_cast(CASE
          WHEN


  regexp_contains(CASE WHEN cast(nullif(trim(cast(`ship_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_date` AS string)), '') AS string) END, r'(?i)^[0-9]{1,2}/[0-9]{1,2}/[0-9]{4}$')


          THEN  parse_timestamp('%m/%d/%Y', CASE WHEN cast(nullif(trim(cast(`ship_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_date` AS string)), '') AS string) END)
        END as timestamp)


 as date)
 AS `ship_date`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_line_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_line_number` AS string)), '') AS string) END as float64)
 as int64)
 AS `allocation_line_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`capacity_product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`capacity_product_id` AS string)), '') AS string) END as string)
 AS `label_number`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`capacity_order_quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`capacity_order_quantity` AS string)), '') AS string) END as float64)
 as int64)
 AS `capacity_order_quantity`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_ship_quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_ship_quantity` AS string)), '') AS string) END as float64)
 as int64)
 AS `item_ship_quantity`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`capacity_shipped_quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`capacity_shipped_quantity` AS string)), '') AS string) END as float64)
 as int64)
 AS `shipped_quantity`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`capacity_uom` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`capacity_uom` AS string)), '') AS string) END as string)
 AS `capacity_uom`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`capacity_case_pack` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`capacity_case_pack` AS string)), '') AS string) END as string)
 AS `capacity_case_pack`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_product_id` AS string)), '') AS string) END as string)
 AS `item_product_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_serial_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_serial_number` AS string)), '') AS string) END as string)
 AS `item_serial_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_method` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_method` AS string)), '') AS string) END as string)
 AS `ship_method`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_carrier` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_carrier` AS string)), '') AS string) END as string)
 AS `carrier_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_tracking` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_tracking` AS string)), '') AS string) END as string)
 AS `tracking_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_weight` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_weight` AS string)), '') AS string) END as string)
 AS `ship_weight`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_cartons` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_cartons` AS string)), '') AS string) END as string)
 AS `ship_cartons`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_cost` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_cost` AS string)), '') AS string) END as float64)
 AS `tracking_number_total_ship_cost`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_number` AS string)), '') AS string) END as string)
 AS `invoice_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_subtotal_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_subtotal_amount` AS string)), '') AS string) END as float64)
 AS `product_subtotal_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_discount_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_discount_amount` AS string)), '') AS string) END as float64)
 AS `total_discount_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_charge_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_charge_amount` AS string)), '') AS string) END as float64)
 AS `total_charge_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_tax_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_tax_amount` AS string)), '') AS string) END as float64)
 AS `total_tax_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_invoice_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_invoice_amount` AS string)), '') AS string) END as float64)
 AS `total_invoice_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `_raw_file_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`source_file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`source_file_time` AS string)), '') AS string) END as timestamp)
 AS `source_file_time`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_file` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_file` AS string)), '') AS string) END as string)
 AS `file_name`
FROM `ff-stadiumgoods-raw-live`.`imports`.`barrett_shipping`

WHERE 1=1
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast(coalesce(source_file_time, file_time) as timestamp)
 AS `shipped_at`
  , 
    safe_cast(CASE
  WHEN left(pick_id, 2) = 'PN' THEN substring(pick_id, 3, 3)
  WHEN left(pick_id, 3) = 'PIC' THEN substring(pick_id, 4, 3)
END as string)
 AS `ship_warehouse`
  , CAST(NULL AS int64) AS `warehouse_priority`
FROM layer_0
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `pick_id` AS `pick_id`
  , `fulfillment_number` AS `fulfillment_number`
  , `order_status` AS `order_status`
  , `order_status_description` AS `order_status_description`
  , `order_type` AS `order_type`
  , `order_source` AS `order_source`
  , `capacity_import_id` AS `capacity_import_id`
  , `capacity_pick_ticket_id` AS `capacity_pick_ticket_id`
  , `po_number` AS `po_number`
  , `retailer_code` AS `retailer_code`
  , `store_number` AS `store_number`
  , `ship_to_location` AS `ship_to_location`
  , `client_code` AS `client_code`
  , `dropship_id` AS `dropship_id`
  , `ship_date` AS `ship_date`
  , `allocation_line_number` AS `allocation_line_number`
  , `label_number` AS `label_number`
  , `capacity_order_quantity` AS `capacity_order_quantity`
  , `item_ship_quantity` AS `item_ship_quantity`
  , `shipped_quantity` AS `shipped_quantity`
  , `capacity_uom` AS `capacity_uom`
  , `capacity_case_pack` AS `capacity_case_pack`
  , `item_product_id` AS `item_product_id`
  , `item_serial_number` AS `item_serial_number`
  , `ship_method` AS `ship_method`
  , `carrier_code` AS `carrier_code`
  , `tracking_number` AS `tracking_number`
  , `ship_weight` AS `ship_weight`
  , `ship_cartons` AS `ship_cartons`
  , `tracking_number_total_ship_cost` AS `tracking_number_total_ship_cost`
  , `invoice_number` AS `invoice_number`
  , `product_subtotal_amount` AS `product_subtotal_amount`
  , `total_discount_amount` AS `total_discount_amount`
  , `total_charge_amount` AS `total_charge_amount`
  , `total_tax_amount` AS `total_tax_amount`
  , `total_invoice_amount` AS `total_invoice_amount`
  , `file_time` AS `file_time`
  , `source_file_time` AS `source_file_time`
  , `shipped_at` AS `shipped_at`
  , `file_name` AS `file_name`
  , `ship_warehouse` AS `ship_warehouse`
  , `warehouse_priority` AS `warehouse_priority`
FROM layer_1
WHERE 1=1
                     ) SELECT * FROM final 