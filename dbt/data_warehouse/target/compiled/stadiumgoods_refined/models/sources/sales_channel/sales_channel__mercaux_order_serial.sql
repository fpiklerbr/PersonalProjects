

























 

SELECT   `mercaux_order_serial_id`,  `mercaux_order_id`,  `serial_number`,  `reservation_status`,  `created_at`,  `item_price_in_cents`,  `price_currency_code`,  `simple_sku`,  `tax_class_id`,  `item_tax_in_cents`,  `tax_currency_code`,  `_synched_from_source_at`,  `item_price`,  `item_tax`,  `warehouse`,  `manufacturer_sku`
    , `_raw_item_shipment_status`
    , `_raw_item_total_discount`
    , `_raw_item_delivery_mode`
    , `_raw_quantity`
    , `_raw_can_cancel`
    , `_raw_can_return`
    , `_raw_label_number`
    , `_raw_x3_product_type`
    , `_raw_tax_status`
  FROM ( 

SELECT
    *

  , 
    safe_cast((item_price_in_cents / 100) as float64)
 AS `item_price`
  , 
    safe_cast((item_tax_in_cents / 100) as float64)
 AS `item_tax` 
FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `mercaux_order_serial_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`mercaux_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`mercaux_order_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `mercaux_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`serial_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`serial_number` AS string)), '') AS string) END as string)
 AS `serial_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reservation_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reservation_status` AS string)), '') AS string) END as string)
 AS `reservation_status`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price_amount` AS string)), '') AS string) END as float64)
 AS `item_price_in_cents`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price_currency_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price_currency_code` AS string)), '') AS string) END as string)
 AS `price_currency_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sku` AS string)), '') AS string) END as string)
 AS `simple_sku`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_class_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_class_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `tax_class_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_amount` AS string)), '') AS string) END as float64)
 AS `item_tax_in_cents`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_currency_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_currency_code` AS string)), '') AS string) END as string)
 AS `tax_currency_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`warehouse` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`warehouse` AS string)), '') AS string) END as string)
 AS `warehouse`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`manufacturer_sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`manufacturer_sku` AS string)), '') AS string) END as string)
 AS `manufacturer_sku`


  , `item_shipment_status` AS `_raw_item_shipment_status`

  , `item_total_discount` AS `_raw_item_total_discount`

  , `item_delivery_mode` AS `_raw_item_delivery_mode`

  , `quantity` AS `_raw_quantity`

  , `can_cancel` AS `_raw_can_cancel`

  , `can_return` AS `_raw_can_return`

  , `label_number` AS `_raw_label_number`

  , `x3_product_type` AS `_raw_x3_product_type`

  , `tax_status` AS `_raw_tax_status`


FROM `ff-stadiumgoods-raw-live`.`sales_channel`.`mercaux_order_serial` AS source_table

 ) AS source_select_statement

 ) AS un_ordered

