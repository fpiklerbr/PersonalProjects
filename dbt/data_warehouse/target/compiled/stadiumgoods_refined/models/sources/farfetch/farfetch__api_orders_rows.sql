



    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`article_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`article_id` AS string)), '') AS string) END as string)
 AS `fps_child_product_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`article_reference` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`article_reference` AS string)), '') AS string) END as string)
 AS `article_reference`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`box_vol_weight` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`box_vol_weight` AS string)), '') AS string) END as string)
 AS `box_vol_weight`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_tax_percent` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_tax_percent` AS string)), '') AS string) END as float64)
 AS `customer_tax_percent`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_tax_value` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_tax_value` AS string)), '') AS string) END as numeric)
 AS `customer_tax_value_base_amount`
  , 

    coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount_promocode` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount_promocode` AS string)), '') AS string) END as numeric)
 , cast('0' AS numeric )) AS `item_discount_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_duplicate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_duplicate` AS string)), '') AS string) END as string)
 AS `is_duplicate`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_base_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_base_price` AS string)), '') AS string) END as float64)
 AS `item_base_price`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_base_vat` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_base_vat` AS string)), '') AS string) END as float64)
 AS `item_base_vat`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`line_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`line_status` AS string)), '') AS string) END as string)
 AS `line_status`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_from_portal` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_from_portal` AS string)), '') AS string) END as float64)
 AS `order_from_portal`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_line_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_line_id` AS string)), '') AS string) END as string)
 AS `farfetch_order_line_id`
  , 

    coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price` AS string)), '') AS string) END as numeric)
 , cast('0' AS numeric )) AS `item_price_base_amount`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`quantity` AS string)), '') AS string) END as float64)
 as int64)
 AS `item_quantity`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`return_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`return_order_id` AS string)), '') AS string) END as string)
 AS `return_order_id`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`show_warning` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`show_warning` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`show_warning` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`show_warning` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `is_show_warning`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`size` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`size` AS string)), '') AS string) END as string)
 AS `fps_product_size`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`size_position` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`size_position` AS string)), '') AS string) END as string)
 AS `size_position`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_barcode` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_barcode` AS string)), '') AS string) END as string)
 AS `store_barcode`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_sku` AS string)), '') AS string) END as string)
 AS `fps_store_sku`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_tax_percent` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_tax_percent` AS string)), '') AS string) END as float64)
 AS `store_tax_percent`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_tax_value` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_tax_value` AS string)), '') AS string) END as numeric)
 AS `store_tax_value_base_amount`
  , 

    coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_total_ddp` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_total_ddp` AS string)), '') AS string) END as numeric)
 , cast('0' AS numeric )) AS `item_duties_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_us_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_us_tax` AS string)), '') AS string) END as numeric)
 AS `store_us_tax_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total` AS string)), '') AS string) END as float64)
 AS `total`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_vat_discount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_vat_discount` AS string)), '') AS string) END as float64)
 AS `total_vat_discount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`un_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`un_number` AS string)), '') AS string) END as string)
 AS `un_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ups` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ups` AS string)), '') AS string) END as string)
 AS `ups`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as string)
 AS `farfetch_order_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customization_details` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customization_details` AS string)), '') AS string) END as string)
 AS `customization_details`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tracking_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tracking_number` AS string)), '') AS string) END as string)
 AS `tracking_number`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_id` AS string)), '') AS string) END as string)
 AS `fps_stock_point_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_vat_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_vat_amount` AS string)), '') AS string) END as numeric)
 AS `item_vat_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_vat_percentage` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_vat_percentage` AS string)), '') AS string) END as float64)
 AS `item_vat_percentage`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`class` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`class` AS string)), '') AS string) END as string)
 AS `class`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`division` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`division` AS string)), '') AS string) END as string)
 AS `division`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`proper_shipping_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`proper_shipping_name` AS string)), '') AS string) END as string)
 AS `proper_shipping_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`packing_group` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`packing_group` AS string)), '') AS string) END as string)
 AS `packing_group`
FROM `ff-stadiumgoods-raw-live`.`imports`.`farfetch_orders_rows`

WHERE 1=1
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast(coalesce(store_tax_value_base_amount, item_vat_base_amount, 0) as numeric)
 AS `item_tax_base_amount`
FROM layer_0
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `fps_child_product_id` AS `fps_child_product_id`
  , `article_reference` AS `article_reference`
  , `box_vol_weight` AS `box_vol_weight`
  , `customer_tax_percent` AS `customer_tax_percent`
  , `customer_tax_value_base_amount` AS `customer_tax_value_base_amount`
  , `item_discount_base_amount` AS `item_discount_base_amount`
  , `is_duplicate` AS `is_duplicate`
  , `item_base_price` AS `item_base_price`
  , `item_base_vat` AS `item_base_vat`
  , `line_status` AS `line_status`
  , `order_from_portal` AS `order_from_portal`
  , `farfetch_order_line_id` AS `farfetch_order_line_id`
  , `item_price_base_amount` AS `item_price_base_amount`
  , `item_quantity` AS `item_quantity`
  , `return_order_id` AS `return_order_id`
  , `is_show_warning` AS `is_show_warning`
  , `fps_product_size` AS `fps_product_size`
  , `size_position` AS `size_position`
  , `store_barcode` AS `store_barcode`
  , `fps_store_sku` AS `fps_store_sku`
  , `store_tax_percent` AS `store_tax_percent`
  , `store_tax_value_base_amount` AS `store_tax_value_base_amount`
  , `item_duties_base_amount` AS `item_duties_base_amount`
  , `item_tax_base_amount` AS `item_tax_base_amount`
  , `store_us_tax_base_amount` AS `store_us_tax_base_amount`
  , `total` AS `total`
  , `total_vat_discount` AS `total_vat_discount`
  , `un_number` AS `un_number`
  , `ups` AS `ups`
  , `farfetch_order_id` AS `farfetch_order_id`
  , `file_time` AS `file_time`
  , `file_name` AS `file_name`
  , `customization_details` AS `customization_details`
  , `tracking_number` AS `tracking_number`
  , `fps_stock_point_id` AS `fps_stock_point_id`
  , `item_vat_base_amount` AS `item_vat_base_amount`
  , `item_vat_percentage` AS `item_vat_percentage`
  , `class` AS `class`
  , `division` AS `division`
  , `proper_shipping_name` AS `proper_shipping_name`
  , `packing_group` AS `packing_group`
FROM layer_1
WHERE 1=1
                     ) SELECT * FROM final 