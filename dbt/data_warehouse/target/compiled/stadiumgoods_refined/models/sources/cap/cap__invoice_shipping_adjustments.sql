




    
                    
                    
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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_date` AS string)), '') AS string) END as timestamp)
 as date)
 AS `ship_date`
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

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ship_cost_as_previously_invoiced` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ship_cost_as_previously_invoiced` AS string)), '') AS string) END as string)
 AS `ship_cost_as_previously_invoiced`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`adjusted_ship_cost` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`adjusted_ship_cost` AS string)), '') AS string) END as string)
 AS `adjusted_ship_cost`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_adjustment` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_adjustment` AS string)), '') AS string) END as float64)
 AS `shipping_adjustment`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`charge_description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`charge_description` AS string)), '') AS string) END as string)
 AS `charge_description`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`box_weight` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`box_weight` AS string)), '') AS string) END as string)
 AS `box_weight`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`number_of_boxes` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`number_of_boxes` AS string)), '') AS string) END as string)
 AS `number_of_boxes`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipped_from` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipped_from` AS string)), '') AS string) END as string)
 AS `shipped_from`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`warehouse` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`warehouse` AS string)), '') AS string) END as string)
 AS `warehouse`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`comments_internal_use_only_` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`comments_internal_use_only_` AS string)), '') AS string) END as string)
 AS `comments_internal_use_only_`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipper` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipper` AS string)), '') AS string) END as string)
 AS `shipper`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sheet_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sheet_name` AS string)), '') AS string) END as string)
 AS `sheet_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`
FROM `ff-stadiumgoods-raw-live`.`imports`.`cap_invoice_shipping_adjustments`

WHERE 1=1
AND file_name NOT IN ('ZJ Transaction History - 2.29.20 FOR ZJ (2).xlsx', 'ZB Transaction History - 2.29.20 FOR ZB (3).xlsx')
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
  , `ship_date` AS `ship_date`
  , `sales_date` AS `sales_date`
  , `business_name` AS `business_name`
  , `customer_name` AS `customer_name`
  , `ship_comment` AS `ship_comment`
  , `ship_carrier` AS `ship_carrier`
  , `tracking_number` AS `tracking_number`
  , `ship_cost_as_previously_invoiced` AS `ship_cost_as_previously_invoiced`
  , `adjusted_ship_cost` AS `adjusted_ship_cost`
  , `shipping_adjustment` AS `shipping_adjustment`
  , `charge_description` AS `charge_description`
  , `box_weight` AS `box_weight`
  , `number_of_boxes` AS `number_of_boxes`
  , `shipped_from` AS `shipped_from`
  , `warehouse` AS `warehouse`
  , `comments_internal_use_only_` AS `comments_internal_use_only_`
  , `shipper` AS `shipper`
  , `file_name` AS `file_name`
  , `sheet_name` AS `sheet_name`
  , `file_time` AS `file_time`
  , `cap_client_center` AS `cap_client_center`
FROM layer_1
WHERE 1=1
                     ) SELECT * FROM final 