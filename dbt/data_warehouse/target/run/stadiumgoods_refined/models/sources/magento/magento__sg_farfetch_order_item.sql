

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sg_farfetch_order_item`
  OPTIONS()
  as 




    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sg_farfetch_order_item_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`parent_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`parent_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sg_farfetch_order_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`product_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`product_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `simple_product_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`farfetch_line_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`farfetch_line_id` AS string)), '') AS string) END as string)
 AS `farfetch_order_line_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`quantity` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`quantity` AS string)), '') AS string) END as float64)
 as int64)
 AS `item_quantity`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`title` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`title` AS string)), '') AS string) END as string)
 AS `title`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sku` AS string)), '') AS string) END as string)
 AS `fps_store_sku`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price` AS string)), '') AS string) END as numeric)
 AS `item_price_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`size` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`size` AS string)), '') AS string) END as string)
 AS `fps_product_size`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_us_tax` AS string), substr(
    concat(
    
      coalesce(
  '"[]'
|| '' , '')
    
      , coalesce(concat(chr(9), chr(10), chr(11), chr(12), chr(13), chr(32), chr(133), chr(160), chr(5760), chr(8192), chr(8193), chr(8194), chr(8195), chr(8196), chr(8197), chr(8198), chr(8199), chr(8200), chr(8201), chr(8202), chr(8232), chr(8233), chr(8239), chr(8287), chr(12288))|| '' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(
  '"[]'
|| '' , '')
    
      , coalesce(concat(chr(9), chr(10), chr(11), chr(12), chr(13), chr(32), chr(133), chr(160), chr(5760), chr(8192), chr(8193), chr(8194), chr(8195), chr(8196), chr(8197), chr(8198), chr(8199), chr(8200), chr(8201), chr(8202), chr(8232), chr(8233), chr(8239), chr(8287), chr(12288))|| '' , '')
    
  )) - length('')
      , 0
    )
)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_us_tax` AS string), substr(
    concat(
    
      coalesce(
  '"[]'
|| '' , '')
    
      , coalesce(concat(chr(9), chr(10), chr(11), chr(12), chr(13), chr(32), chr(133), chr(160), chr(5760), chr(8192), chr(8193), chr(8194), chr(8195), chr(8196), chr(8197), chr(8198), chr(8199), chr(8200), chr(8201), chr(8202), chr(8232), chr(8233), chr(8239), chr(8287), chr(12288))|| '' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(
  '"[]'
|| '' , '')
    
      , coalesce(concat(chr(9), chr(10), chr(11), chr(12), chr(13), chr(32), chr(133), chr(160), chr(5760), chr(8192), chr(8193), chr(8194), chr(8195), chr(8196), chr(8197), chr(8198), chr(8199), chr(8200), chr(8201), chr(8202), chr(8232), chr(8233), chr(8239), chr(8287), chr(12288))|| '' , '')
    
  )) - length('')
      , 0
    )
)), '') AS string) END as numeric)
 AS `store_us_tax_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_tax_value` AS string), substr(
    concat(
    
      coalesce(
  '"[]'
|| '' , '')
    
      , coalesce(concat(chr(9), chr(10), chr(11), chr(12), chr(13), chr(32), chr(133), chr(160), chr(5760), chr(8192), chr(8193), chr(8194), chr(8195), chr(8196), chr(8197), chr(8198), chr(8199), chr(8200), chr(8201), chr(8202), chr(8232), chr(8233), chr(8239), chr(8287), chr(12288))|| '' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(
  '"[]'
|| '' , '')
    
      , coalesce(concat(chr(9), chr(10), chr(11), chr(12), chr(13), chr(32), chr(133), chr(160), chr(5760), chr(8192), chr(8193), chr(8194), chr(8195), chr(8196), chr(8197), chr(8198), chr(8199), chr(8200), chr(8201), chr(8202), chr(8232), chr(8233), chr(8239), chr(8287), chr(12288))|| '' , '')
    
  )) - length('')
      , 0
    )
)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_tax_value` AS string), substr(
    concat(
    
      coalesce(
  '"[]'
|| '' , '')
    
      , coalesce(concat(chr(9), chr(10), chr(11), chr(12), chr(13), chr(32), chr(133), chr(160), chr(5760), chr(8192), chr(8193), chr(8194), chr(8195), chr(8196), chr(8197), chr(8198), chr(8199), chr(8200), chr(8201), chr(8202), chr(8232), chr(8233), chr(8239), chr(8287), chr(12288))|| '' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(
  '"[]'
|| '' , '')
    
      , coalesce(concat(chr(9), chr(10), chr(11), chr(12), chr(13), chr(32), chr(133), chr(160), chr(5760), chr(8192), chr(8193), chr(8194), chr(8195), chr(8196), chr(8197), chr(8198), chr(8199), chr(8200), chr(8201), chr(8202), chr(8232), chr(8233), chr(8239), chr(8287), chr(12288))|| '' , '')
    
  )) - length('')
      , 0
    )
)), '') AS string) END as numeric)
 AS `store_tax_value_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_tax_percent` AS string), substr(
    concat(
    
      coalesce(
  '"[]'
|| '' , '')
    
      , coalesce(concat(chr(9), chr(10), chr(11), chr(12), chr(13), chr(32), chr(133), chr(160), chr(5760), chr(8192), chr(8193), chr(8194), chr(8195), chr(8196), chr(8197), chr(8198), chr(8199), chr(8200), chr(8201), chr(8202), chr(8232), chr(8233), chr(8239), chr(8287), chr(12288))|| '' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(
  '"[]'
|| '' , '')
    
      , coalesce(concat(chr(9), chr(10), chr(11), chr(12), chr(13), chr(32), chr(133), chr(160), chr(5760), chr(8192), chr(8193), chr(8194), chr(8195), chr(8196), chr(8197), chr(8198), chr(8199), chr(8200), chr(8201), chr(8202), chr(8232), chr(8233), chr(8239), chr(8287), chr(12288))|| '' , '')
    
  )) - length('')
      , 0
    )
)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_tax_percent` AS string), substr(
    concat(
    
      coalesce(
  '"[]'
|| '' , '')
    
      , coalesce(concat(chr(9), chr(10), chr(11), chr(12), chr(13), chr(32), chr(133), chr(160), chr(5760), chr(8192), chr(8193), chr(8194), chr(8195), chr(8196), chr(8197), chr(8198), chr(8199), chr(8200), chr(8201), chr(8202), chr(8232), chr(8233), chr(8239), chr(8287), chr(12288))|| '' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(
  '"[]'
|| '' , '')
    
      , coalesce(concat(chr(9), chr(10), chr(11), chr(12), chr(13), chr(32), chr(133), chr(160), chr(5760), chr(8192), chr(8193), chr(8194), chr(8195), chr(8196), chr(8197), chr(8198), chr(8199), chr(8200), chr(8201), chr(8202), chr(8232), chr(8233), chr(8239), chr(8287), chr(12288))|| '' , '')
    
  )) - length('')
      , 0
    )
)), '') AS string) END as float64)
 AS `store_tax_percent`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_tax_value` AS string), substr(
    concat(
    
      coalesce(
  '"[]'
|| '' , '')
    
      , coalesce(concat(chr(9), chr(10), chr(11), chr(12), chr(13), chr(32), chr(133), chr(160), chr(5760), chr(8192), chr(8193), chr(8194), chr(8195), chr(8196), chr(8197), chr(8198), chr(8199), chr(8200), chr(8201), chr(8202), chr(8232), chr(8233), chr(8239), chr(8287), chr(12288))|| '' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(
  '"[]'
|| '' , '')
    
      , coalesce(concat(chr(9), chr(10), chr(11), chr(12), chr(13), chr(32), chr(133), chr(160), chr(5760), chr(8192), chr(8193), chr(8194), chr(8195), chr(8196), chr(8197), chr(8198), chr(8199), chr(8200), chr(8201), chr(8202), chr(8232), chr(8233), chr(8239), chr(8287), chr(12288))|| '' , '')
    
  )) - length('')
      , 0
    )
)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_tax_value` AS string), substr(
    concat(
    
      coalesce(
  '"[]'
|| '' , '')
    
      , coalesce(concat(chr(9), chr(10), chr(11), chr(12), chr(13), chr(32), chr(133), chr(160), chr(5760), chr(8192), chr(8193), chr(8194), chr(8195), chr(8196), chr(8197), chr(8198), chr(8199), chr(8200), chr(8201), chr(8202), chr(8232), chr(8233), chr(8239), chr(8287), chr(12288))|| '' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(
  '"[]'
|| '' , '')
    
      , coalesce(concat(chr(9), chr(10), chr(11), chr(12), chr(13), chr(32), chr(133), chr(160), chr(5760), chr(8192), chr(8193), chr(8194), chr(8195), chr(8196), chr(8197), chr(8198), chr(8199), chr(8200), chr(8201), chr(8202), chr(8232), chr(8233), chr(8239), chr(8287), chr(12288))|| '' , '')
    
  )) - length('')
      , 0
    )
)), '') AS string) END as numeric)
 AS `customer_tax_value_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_tax_percent` AS string), substr(
    concat(
    
      coalesce(
  '"[]'
|| '' , '')
    
      , coalesce(concat(chr(9), chr(10), chr(11), chr(12), chr(13), chr(32), chr(133), chr(160), chr(5760), chr(8192), chr(8193), chr(8194), chr(8195), chr(8196), chr(8197), chr(8198), chr(8199), chr(8200), chr(8201), chr(8202), chr(8232), chr(8233), chr(8239), chr(8287), chr(12288))|| '' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(
  '"[]'
|| '' , '')
    
      , coalesce(concat(chr(9), chr(10), chr(11), chr(12), chr(13), chr(32), chr(133), chr(160), chr(5760), chr(8192), chr(8193), chr(8194), chr(8195), chr(8196), chr(8197), chr(8198), chr(8199), chr(8200), chr(8201), chr(8202), chr(8232), chr(8233), chr(8239), chr(8287), chr(12288))|| '' , '')
    
  )) - length('')
      , 0
    )
)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_tax_percent` AS string), substr(
    concat(
    
      coalesce(
  '"[]'
|| '' , '')
    
      , coalesce(concat(chr(9), chr(10), chr(11), chr(12), chr(13), chr(32), chr(133), chr(160), chr(5760), chr(8192), chr(8193), chr(8194), chr(8195), chr(8196), chr(8197), chr(8198), chr(8199), chr(8200), chr(8201), chr(8202), chr(8232), chr(8233), chr(8239), chr(8287), chr(12288))|| '' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(
  '"[]'
|| '' , '')
    
      , coalesce(concat(chr(9), chr(10), chr(11), chr(12), chr(13), chr(32), chr(133), chr(160), chr(5760), chr(8192), chr(8193), chr(8194), chr(8195), chr(8196), chr(8197), chr(8198), chr(8199), chr(8200), chr(8201), chr(8202), chr(8232), chr(8233), chr(8239), chr(8287), chr(12288))|| '' , '')
    
  )) - length('')
      , 0
    )
)), '') AS string) END as float64)
 AS `customer_tax_percent`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount_promocode` AS string)), '') AS string) IN ('0','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount_promocode` AS string)), '') AS string) END as numeric)
 AS `item_discount_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_total_ddp` AS string)), '') AS string) IN ('0','nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_total_ddp` AS string)), '') AS string) END as numeric)
 AS `item_duties_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_base_price` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_base_price` AS string)), '') AS string) END as float64)
 AS `item_base_price`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_base_vat` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_base_vat` AS string)), '') AS string) END as float64)
 AS `item_base_vat`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_vat_discount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_vat_discount` AS string)), '') AS string) END as float64)
 AS `total_vat_discount`
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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reserved_serial_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reserved_serial_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `serializedproduct_product_serial_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`configurable_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`configurable_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `configurable_product_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_item_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_item_status` AS string)), '') AS string) END as string)
 AS `order_item_status`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sg_no_stock_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sg_no_stock_type` AS string)), '') AS string) END as string)
 AS `sg_no_stock_type`
  , `farfetch_product_id` AS `_raw_farfetch_product_id`
  , `_deprecated_original_price` AS `_raw__deprecated_original_price`
  , `_deprecated_original_price_currency` AS `_raw__deprecated_original_price_currency`
  , `line_item_status` AS `_raw_line_item_status`
  , `shipping_method` AS `_raw_shipping_method`
  , `tracking_number` AS `_raw_tracking_number`
  , `store_barcode` AS `_raw_store_barcode`
  , `sg_no_stock_error_message` AS `_raw_sg_no_stock_error_message`
  , `box_id` AS `_raw_box_id`
  , `box_selection_usecase` AS `_raw_box_selection_usecase`
  , `_synched_from_source_at` AS `_raw__synched_from_source_at`
FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_order_item`

WHERE 1=1
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast(coalesce(store_tax_value_base_amount, 0) as numeric)
 AS `item_tax_base_amount`
FROM layer_0
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `sg_farfetch_order_item_id` AS `sg_farfetch_order_item_id`
  , `sg_farfetch_order_id` AS `sg_farfetch_order_id`
  , `simple_product_id` AS `simple_product_id`
  , `farfetch_order_line_id` AS `farfetch_order_line_id`
  , `item_quantity` AS `item_quantity`
  , `title` AS `title`
  , `fps_store_sku` AS `fps_store_sku`
  , `item_price_base_amount` AS `item_price_base_amount`
  , `fps_product_size` AS `fps_product_size`
  , `store_us_tax_base_amount` AS `store_us_tax_base_amount`
  , `store_tax_value_base_amount` AS `store_tax_value_base_amount`
  , `item_tax_base_amount` AS `item_tax_base_amount`
  , `store_tax_percent` AS `store_tax_percent`
  , `customer_tax_value_base_amount` AS `customer_tax_value_base_amount`
  , `customer_tax_percent` AS `customer_tax_percent`
  , `item_discount_base_amount` AS `item_discount_base_amount`
  , `item_duties_base_amount` AS `item_duties_base_amount`
  , `item_base_price` AS `item_base_price`
  , `item_base_vat` AS `item_base_vat`
  , `total_vat_discount` AS `total_vat_discount`
  , `created_at` AS `created_at`
  , `updated_at` AS `updated_at`
  , `serializedproduct_product_serial_id` AS `serializedproduct_product_serial_id`
  , `configurable_product_id` AS `configurable_product_id`
  , `order_item_status` AS `order_item_status`
  , `sg_no_stock_type` AS `sg_no_stock_type`
  , `_raw_farfetch_product_id` AS `_raw_farfetch_product_id`
  , `_raw__deprecated_original_price` AS `_raw__deprecated_original_price`
  , `_raw__deprecated_original_price_currency` AS `_raw__deprecated_original_price_currency`
  , `_raw_line_item_status` AS `_raw_line_item_status`
  , `_raw_shipping_method` AS `_raw_shipping_method`
  , `_raw_tracking_number` AS `_raw_tracking_number`
  , `_raw_store_barcode` AS `_raw_store_barcode`
  , `_raw_sg_no_stock_error_message` AS `_raw_sg_no_stock_error_message`
  , `_raw_box_id` AS `_raw_box_id`
  , `_raw_box_selection_usecase` AS `_raw_box_selection_usecase`
  , `_raw__synched_from_source_at` AS `_raw__synched_from_source_at`
FROM layer_1
WHERE 1=1
                     ) SELECT * FROM final ;

