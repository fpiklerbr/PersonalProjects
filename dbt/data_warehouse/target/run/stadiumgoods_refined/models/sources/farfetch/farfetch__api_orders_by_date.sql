

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__api_orders_by_date`
  
  
  OPTIONS()
  as (
    

    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_id` AS string)), '') AS string) END as string)
 AS `_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_row_order` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_row_order` AS string)), '') AS string) END as float64)
 as int64)
 AS `_row_order`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as string)
 AS `farfetch_order_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`siteid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`siteid` AS string)), '') AS string) END as string)
 AS `fps_stock_point_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qtd` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qtd` AS string)), '') AS string) END as float64)
 as int64)
 AS `item_quantity`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ref` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ref` AS string)), '') AS string) END as string)
 AS `ref`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`size` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`size` AS string)), '') AS string) END as string)
 AS `fps_product_size`
  , 

    coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price` AS string)), '') AS string) END as float64)
 , cast('0' AS float64 )) AS `item_price_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_id` AS string)), '') AS string) END as string)
 AS `fps_child_product_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_type` AS string)), '') AS string) END as string)
 AS `shipping_type`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_id` AS string)), '') AS string) END as string)
 AS `customer_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_line_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_line_id` AS string)), '') AS string) END as string)
 AS `farfetch_order_line_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_address` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_address` AS string)), '') AS string) END as string)
 AS `shipping_address`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status_id` AS string)), '') AS string) END as string)
 AS `farfetch_order_status_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tamanho` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tamanho` AS string)), '') AS string) END as string)
 AS `tamanho`
  , 

    CAST(
                CASE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_from_portal` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_from_portal` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
                  WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_from_portal` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_from_portal` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
                END
                AS boolean
              ) AS `is_from_portal`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_date` AS string)), '') AS string) END as timestamp)
 as date)
 AS `order_date`
FROM `ff-stadiumgoods-raw-live`.`imports`.`farfetch_orders_by_date`

WHERE 1=1
                 ) , layer_2 AS ( 
                    SELECT
    *
  , 
    

    CAST(

    split(
        shipping_address,
        ';'
        )[safe_offset(1)]

 AS string)

 AS `customer_country`
FROM layer_0
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `_id` AS `_id`
  , `_row_order` AS `_row_order`
  , `farfetch_order_id` AS `farfetch_order_id`
  , `fps_stock_point_id` AS `fps_stock_point_id`
  , `item_quantity` AS `item_quantity`
  , `ref` AS `ref`
  , `fps_product_size` AS `fps_product_size`
  , `item_price_base_amount` AS `item_price_base_amount`
  , `fps_child_product_id` AS `fps_child_product_id`
  , `shipping_type` AS `shipping_type`
  , `customer_id` AS `customer_id`
  , `farfetch_order_line_id` AS `farfetch_order_line_id`
  , `shipping_address` AS `shipping_address`
  , `farfetch_order_status_id` AS `farfetch_order_status_id`
  , `tamanho` AS `tamanho`
  , `is_from_portal` AS `is_from_portal`
  , `file_name` AS `file_name`
  , `file_time` AS `file_time`
  , `order_date` AS `order_date`
  , `customer_country` AS `customer_country`
FROM layer_2
WHERE 1=1
                     ) SELECT * FROM final 
  );
    