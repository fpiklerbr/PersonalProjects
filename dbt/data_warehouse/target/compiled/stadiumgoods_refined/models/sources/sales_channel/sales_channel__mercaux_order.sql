








































 

SELECT   `mercaux_order_id`,  `mercaux_order_status`,  `order_data`,  `mercaux_store_name`,  `reserved_at`,  `purchased_at`,  `cancelled_at`,  `updated_at`,  `created_at`,  `mercaux_customer_id`,  `order_total_amount_in_cents`,  `order_total_currency_code`,  `employee`,  `mercaux_store_id`,  `total_tax_amount_in_cents`,  `total_tax_currency_code`,  `_synched_from_source_at`,  `order_total_amount`,  `total_tax_amount`
    , `_raw_shipping_cost_amount`
    , `_raw_shipping_cost_currency_code`
    , `_raw_external_order_id`
    , `_raw_payment_type`
    , `_raw_cash_tendered_amount`
    , `_raw_cash_tendered_currency_code`
    , `_raw_cash_change_amount`
    , `_raw_cash_change_currency_code`
    , `_raw_discounted_order_sub_total_amount`
    , `_raw_discounted_order_sub_total_currency_code`
    , `_raw_discount_amount_amount`
    , `_raw_discount_amount_currency_code`
    , `_raw_shipping_type`
    , `_raw_device_name`
    , `_raw_order_shipment_status`
    , `_raw_can_cancel`
    , `_raw_can_return`
    , `_raw_receipt_email`
    , `_raw_email_receipt`
    , `_raw_gift_receipt`
    , `_raw_order_sub_total_amount`
    , `_raw_order_sub_total_currency_code`
  FROM ( 

SELECT
    *

  , (JSON_EXTRACT_SCALAR(order_data, '$.store'
  ))
 AS `mercaux_store_name` 
FROM ( 

SELECT
    *

  , 
    safe_cast((order_total_amount_in_cents / 100) as float64)
 AS `order_total_amount`
  , 
    safe_cast((total_tax_amount_in_cents / 100) as float64)
 AS `total_tax_amount` 
FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as float64)
 as int64)
 AS `mercaux_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as string)
 AS `mercaux_order_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_data` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_data` AS string)), '') AS string) END as string)
 AS `order_data`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reserved_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reserved_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `reserved_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`purchased_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`purchased_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `purchased_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`cancelled_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`cancelled_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `cancelled_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`mercaux_customer_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`mercaux_customer_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `mercaux_customer_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_total_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_total_amount` AS string)), '') AS string) END as float64)
 AS `order_total_amount_in_cents`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_total_currency_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_total_currency_code` AS string)), '') AS string) END as string)
 AS `order_total_currency_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`employee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`employee` AS string)), '') AS string) END as string)
 AS `employee`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`mercaux_store_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`mercaux_store_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `mercaux_store_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_tax_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_tax_amount` AS string)), '') AS string) END as float64)
 AS `total_tax_amount_in_cents`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_tax_currency_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_tax_currency_code` AS string)), '') AS string) END as string)
 AS `total_tax_currency_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`


  , `shipping_cost_amount` AS `_raw_shipping_cost_amount`

  , `shipping_cost_currency_code` AS `_raw_shipping_cost_currency_code`

  , `external_order_id` AS `_raw_external_order_id`

  , `payment_type` AS `_raw_payment_type`

  , `cash_tendered_amount` AS `_raw_cash_tendered_amount`

  , `cash_tendered_currency_code` AS `_raw_cash_tendered_currency_code`

  , `cash_change_amount` AS `_raw_cash_change_amount`

  , `cash_change_currency_code` AS `_raw_cash_change_currency_code`

  , `discounted_order_sub_total_amount` AS `_raw_discounted_order_sub_total_amount`

  , `discounted_order_sub_total_currency_code` AS `_raw_discounted_order_sub_total_currency_code`

  , `discount_amount_amount` AS `_raw_discount_amount_amount`

  , `discount_amount_currency_code` AS `_raw_discount_amount_currency_code`

  , `shipping_type` AS `_raw_shipping_type`

  , `device_name` AS `_raw_device_name`

  , `order_shipment_status` AS `_raw_order_shipment_status`

  , `can_cancel` AS `_raw_can_cancel`

  , `can_return` AS `_raw_can_return`

  , `receipt_email` AS `_raw_receipt_email`

  , `email_receipt` AS `_raw_email_receipt`

  , `gift_receipt` AS `_raw_gift_receipt`

  , `order_sub_total_amount` AS `_raw_order_sub_total_amount`

  , `order_sub_total_currency_code` AS `_raw_order_sub_total_currency_code`


FROM `ff-stadiumgoods-raw-live`.`sales_channel`.`mercaux_order` AS source_table

 ) AS source_select_statement

 ) AS source_and_sql_select_statement

 ) AS un_ordered

