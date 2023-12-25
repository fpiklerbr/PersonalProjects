

    
                    
                    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_date` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `farfetch_order_created_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as string)
 AS `fps_order_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`qty` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`qty` AS string)), '') AS string) END as float64)
 as int64)
 / -1 AS `refund_item_quantity`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`items` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`items` AS string)), '') AS string) END as string)
 AS `items`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reason` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reason` AS string)), '') AS string) END as string)
 AS `reason`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`voucher_value` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`voucher_value` AS string)), '') AS string) END as numeric)
 / -1 AS `refund_no_stock_vouchers_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`row_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`row_type` AS string)), '') AS string) END as string)
 AS `row_type`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_qty` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_qty` AS string)), '') AS string) END as float64)
 as int64)
 AS `total_qty`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `refund_file_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `refund_file_time`
FROM `ff-stadiumgoods-raw-live`.`imports`.`farfetch_financial_no_stock_vouchers`

WHERE 1=1
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast('No Stock Voucher' as string)
 AS `refund_transaction_type`
  , 
    safe_cast(farfetch_order_created_at as timestamp)
 AS `refund_processed_at`
  , 
    safe_cast(refund_no_stock_vouchers_base_amount as numeric)
 AS `refund_fee_base_amount`
FROM layer_0
WHERE 1=1
                     ) , layer_2 AS ( 
                    SELECT
    *
  , 
    

    CAST(

    split(
        items,
        ' - '
        )[safe_offset(1)]

 AS string)

 AS `items_part_2`
  , 
    

    CAST(

    split(
        items,
        ' - '
        )[safe_offset(4)]

 AS string)

 AS `items_part_5`
FROM layer_1
WHERE 1=1
                     ) , layer_3 AS ( 
                    SELECT
    *
  , 
    safe_cast(coalesce(nullif(trim(items_part_2), ''), '(N/A)') as string)
 AS `fps_parent_product_id`
  , 
    safe_cast(coalesce(nullif(trim(items_part_5), ''), '(N/A)') as string)
 AS `fps_product_size`
FROM layer_2
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `farfetch_order_created_at` AS `farfetch_order_created_at`
  , `fps_order_id` AS `fps_order_id`
  , `refund_transaction_type` AS `refund_transaction_type`
  , `refund_processed_at` AS `refund_processed_at`
  , `refund_item_quantity` AS `refund_item_quantity`
  , `items` AS `items`
  , `fps_parent_product_id` AS `fps_parent_product_id`
  , `fps_product_size` AS `fps_product_size`
  , `reason` AS `reason`
  , `refund_no_stock_vouchers_base_amount` AS `refund_no_stock_vouchers_base_amount`
  , `row_type` AS `row_type`
  , `total_qty` AS `total_qty`
  , `refund_fee_base_amount` AS `refund_fee_base_amount`
  , `refund_file_name` AS `refund_file_name`
  , `refund_file_time` AS `refund_file_time`
FROM layer_3
WHERE 1=1
                     ) SELECT * FROM final 