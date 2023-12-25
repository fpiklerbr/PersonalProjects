

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_invoice`
  OPTIONS()
  as 

  


















































 

SELECT   `sales_flat_invoice_id`,  `store_id`,  `base_grand_total`,  `shipping_tax_amount`,  `tax_amount`,  `base_tax_amount`,  `store_to_order_rate`,  `base_shipping_tax_amount`,  `base_discount_amount`,  `base_to_order_rate`,  `grand_total`,  `shipping_amount`,  `subtotal_incl_tax`,  `base_subtotal_incl_tax`,  `store_to_base_rate`,  `base_shipping_amount`,  `total_qty`,  `base_to_global_rate`,  `subtotal`,  `base_subtotal`,  `discount_amount`,  `billing_address_id`,  `is_used_for_refund`,  `sales_flat_order_id`,  `email_sent`,  `can_void_flag`,  `state`,  `shipping_address_id`,  `store_currency_code`,  `transaction_id`,  `order_currency_code`,  `base_currency_code`,  `global_currency_code`,  `mag_invoice_id`,  `created_at`,  `updated_at`,  `hidden_tax_amount`,  `base_hidden_tax_amount`,  `shipping_hidden_tax_amount`,  `base_shipping_hidden_tax_amnt`,  `shipping_incl_tax`,  `base_shipping_incl_tax`,  `base_total_refunded`,  `discount_description`,  `base_credit_amount`,  `credit_amount`,  `base_snap_cards_amount`,  `snap_cards_amount`,  `dsco_order_id`,  `dsco_po_number`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sales_flat_invoice_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `store_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_grand_total` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_grand_total` AS string)), '') AS string) END as float64)
 AS `base_grand_total`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_tax_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_tax_amount` AS string)), '') AS string) END as numeric)
 AS `shipping_tax_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_amount` AS string)), '') AS string) END as numeric)
 AS `tax_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_tax_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_tax_amount` AS string)), '') AS string) END as numeric)
 AS `base_tax_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_to_order_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_to_order_rate` AS string)), '') AS string) END as numeric)
 AS `store_to_order_rate`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_shipping_tax_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_shipping_tax_amount` AS string)), '') AS string) END as numeric)
 AS `base_shipping_tax_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_discount_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_discount_amount` AS string)), '') AS string) END as numeric)
 AS `base_discount_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_to_order_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_to_order_rate` AS string)), '') AS string) END as numeric)
 AS `base_to_order_rate`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`grand_total` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`grand_total` AS string)), '') AS string) END as numeric)
 AS `grand_total`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_amount` AS string)), '') AS string) END as numeric)
 AS `shipping_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`subtotal_incl_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`subtotal_incl_tax` AS string)), '') AS string) END as numeric)
 AS `subtotal_incl_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_subtotal_incl_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_subtotal_incl_tax` AS string)), '') AS string) END as numeric)
 AS `base_subtotal_incl_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_to_base_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_to_base_rate` AS string)), '') AS string) END as numeric)
 AS `store_to_base_rate`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_shipping_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_shipping_amount` AS string)), '') AS string) END as numeric)
 AS `base_shipping_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_qty` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_qty` AS string)), '') AS string) END as numeric)
 AS `total_qty`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_to_global_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_to_global_rate` AS string)), '') AS string) END as numeric)
 AS `base_to_global_rate`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`subtotal` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`subtotal` AS string)), '') AS string) END as numeric)
 AS `subtotal`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_subtotal` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_subtotal` AS string)), '') AS string) END as numeric)
 AS `base_subtotal`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount_amount` AS string)), '') AS string) END as numeric)
 AS `discount_amount`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_address_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_address_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `billing_address_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_used_for_refund` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_used_for_refund` AS string)), '') AS string) END as float64)
 as int64)
 AS `is_used_for_refund`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sales_flat_order_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`email_sent` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`email_sent` AS string)), '') AS string) END as float64)
 as int64)
 AS `email_sent`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`can_void_flag` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`can_void_flag` AS string)), '') AS string) END as float64)
 as int64)
 AS `can_void_flag`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`state` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`state` AS string)), '') AS string) END as float64)
 as int64)
 AS `state`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_address_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_address_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `shipping_address_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_currency_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_currency_code` AS string)), '') AS string) END as string)
 AS `store_currency_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transaction_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_id` AS string)), '') AS string) END as string)
 AS `transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_currency_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_currency_code` AS string)), '') AS string) END as string)
 AS `order_currency_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_currency_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_currency_code` AS string)), '') AS string) END as string)
 AS `base_currency_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`global_currency_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`global_currency_code` AS string)), '') AS string) END as string)
 AS `global_currency_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`increment_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`increment_id` AS string)), '') AS string) END as string)
 AS `mag_invoice_id`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`hidden_tax_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`hidden_tax_amount` AS string)), '') AS string) END as numeric)
 AS `hidden_tax_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_hidden_tax_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_hidden_tax_amount` AS string)), '') AS string) END as numeric)
 AS `base_hidden_tax_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_hidden_tax_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_hidden_tax_amount` AS string)), '') AS string) END as numeric)
 AS `shipping_hidden_tax_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_shipping_hidden_tax_amnt` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_shipping_hidden_tax_amnt` AS string)), '') AS string) END as numeric)
 AS `base_shipping_hidden_tax_amnt`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_incl_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_incl_tax` AS string)), '') AS string) END as numeric)
 AS `shipping_incl_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_shipping_incl_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_shipping_incl_tax` AS string)), '') AS string) END as numeric)
 AS `base_shipping_incl_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_total_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_total_refunded` AS string)), '') AS string) END as numeric)
 AS `base_total_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount_description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount_description` AS string)), '') AS string) END as string)
 AS `discount_description`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_credit_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_credit_amount` AS string)), '') AS string) END as numeric)
 AS `base_credit_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credit_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credit_amount` AS string)), '') AS string) END as numeric)
 AS `credit_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_snap_cards_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_snap_cards_amount` AS string)), '') AS string) END as numeric)
 AS `base_snap_cards_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`snap_cards_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`snap_cards_amount` AS string)), '') AS string) END as numeric)
 AS `snap_cards_amount`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_order_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `dsco_order_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_po_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_po_number` AS string)), '') AS string) END as float64)
 as int64)
 AS `dsco_po_number`


  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_invoice` AS source_table

 ) AS un_ordered

;

