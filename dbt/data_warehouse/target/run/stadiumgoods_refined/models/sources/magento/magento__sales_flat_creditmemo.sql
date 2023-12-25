

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_creditmemo`
  OPTIONS()
  as 

  































































 

SELECT   `sales_flat_creditmemo_id`,  `store_id`,  `adjustment_positive`,  `base_shipping_tax_amount`,  `store_to_order_rate`,  `base_discount_amount`,  `base_to_order_rate`,  `grand_total`,  `base_adjustment_negative`,  `base_subtotal_incl_tax`,  `shipping_amount`,  `subtotal_incl_tax`,  `adjustment_negative`,  `base_shipping_amount`,  `store_to_base_rate`,  `base_to_global_rate`,  `base_adjustment`,  `base_subtotal`,  `discount_amount`,  `subtotal`,  `adjustment`,  `base_grand_total`,  `base_adjustment_positive`,  `base_tax_amount`,  `shipping_tax_amount`,  `tax_amount`,  `sales_flat_order_id`,  `email_sent`,  `creditmemo_status`,  `state`,  `shipping_address_id`,  `billing_address_id`,  `invoice_id`,  `store_currency_code`,  `order_currency_code`,  `base_currency_code`,  `global_currency_code`,  `transaction_id`,  `mag_creditmemo_id`,  `created_at`,  `updated_at`,  `hidden_tax_amount`,  `base_hidden_tax_amount`,  `shipping_hidden_tax_amount`,  `base_shipping_hidden_tax_amnt`,  `shipping_incl_tax`,  `base_shipping_incl_tax`,  `discount_description`,  `base_credit_amount`,  `credit_amount`,  `base_credit_total_refunded`,  `credit_total_refunded`,  `base_snap_cards_amount`,  `snap_cards_amount`,  `dsco_order_id`,  `dsco_po_number`,  `refund_reason`
    , `_raw_restocking_fee_amount`
    , `_raw_base_restocking_fee_amount`
    , `_raw_restocking_fee_percent`
    , `_raw_adjustment_negative_percent`
    , `_raw_shipping_fee_amount`
    , `_raw_base_shipping_fee_amount`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sales_flat_creditmemo_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `store_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`adjustment_positive` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`adjustment_positive` AS string)), '') AS string) END as float64)
 AS `adjustment_positive`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_shipping_tax_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_shipping_tax_amount` AS string)), '') AS string) END as float64)
 AS `base_shipping_tax_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_to_order_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_to_order_rate` AS string)), '') AS string) END as float64)
 AS `store_to_order_rate`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_discount_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_discount_amount` AS string)), '') AS string) END as float64)
 AS `base_discount_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_to_order_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_to_order_rate` AS string)), '') AS string) END as float64)
 AS `base_to_order_rate`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`grand_total` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`grand_total` AS string)), '') AS string) END as float64)
 AS `grand_total`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_adjustment_negative` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_adjustment_negative` AS string)), '') AS string) END as float64)
 AS `base_adjustment_negative`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_subtotal_incl_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_subtotal_incl_tax` AS string)), '') AS string) END as float64)
 AS `base_subtotal_incl_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_amount` AS string)), '') AS string) END as float64)
 AS `shipping_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`subtotal_incl_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`subtotal_incl_tax` AS string)), '') AS string) END as float64)
 AS `subtotal_incl_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`adjustment_negative` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`adjustment_negative` AS string)), '') AS string) END as float64)
 AS `adjustment_negative`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_shipping_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_shipping_amount` AS string)), '') AS string) END as float64)
 AS `base_shipping_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_to_base_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_to_base_rate` AS string)), '') AS string) END as float64)
 AS `store_to_base_rate`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_to_global_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_to_global_rate` AS string)), '') AS string) END as float64)
 AS `base_to_global_rate`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_adjustment` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_adjustment` AS string)), '') AS string) END as float64)
 AS `base_adjustment`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_subtotal` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_subtotal` AS string)), '') AS string) END as float64)
 AS `base_subtotal`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount_amount` AS string)), '') AS string) END as float64)
 AS `discount_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`subtotal` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`subtotal` AS string)), '') AS string) END as float64)
 AS `subtotal`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`adjustment` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`adjustment` AS string)), '') AS string) END as float64)
 AS `adjustment`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_grand_total` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_grand_total` AS string)), '') AS string) END as float64)
 AS `base_grand_total`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_adjustment_positive` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_adjustment_positive` AS string)), '') AS string) END as float64)
 AS `base_adjustment_positive`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_tax_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_tax_amount` AS string)), '') AS string) END as float64)
 AS `base_tax_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_tax_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_tax_amount` AS string)), '') AS string) END as float64)
 AS `shipping_tax_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_amount` AS string)), '') AS string) END as float64)
 AS `tax_amount`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sales_flat_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`email_sent` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`email_sent` AS string)), '') AS string) END as string)
 AS `email_sent`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`creditmemo_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`creditmemo_status` AS string)), '') AS string) END as string)
 AS `creditmemo_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`state` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`state` AS string)), '') AS string) END as string)
 AS `state`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_address_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_address_id` AS string)), '') AS string) END as string)
 AS `shipping_address_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_address_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_address_id` AS string)), '') AS string) END as string)
 AS `billing_address_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_id` AS string)), '') AS string) END as string)
 AS `invoice_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_currency_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_currency_code` AS string)), '') AS string) END as string)
 AS `store_currency_code`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transaction_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_id` AS string)), '') AS string) END as string)
 AS `transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`increment_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`increment_id` AS string)), '') AS string) END as string)
 AS `mag_creditmemo_id`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`hidden_tax_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`hidden_tax_amount` AS string)), '') AS string) END as float64)
 AS `hidden_tax_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_hidden_tax_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_hidden_tax_amount` AS string)), '') AS string) END as float64)
 AS `base_hidden_tax_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_hidden_tax_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_hidden_tax_amount` AS string)), '') AS string) END as float64)
 AS `shipping_hidden_tax_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_shipping_hidden_tax_amnt` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_shipping_hidden_tax_amnt` AS string)), '') AS string) END as float64)
 AS `base_shipping_hidden_tax_amnt`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_incl_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_incl_tax` AS string)), '') AS string) END as float64)
 AS `shipping_incl_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_shipping_incl_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_shipping_incl_tax` AS string)), '') AS string) END as float64)
 AS `base_shipping_incl_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount_description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount_description` AS string)), '') AS string) END as string)
 AS `discount_description`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_credit_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_credit_amount` AS string)), '') AS string) END as float64)
 AS `base_credit_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credit_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credit_amount` AS string)), '') AS string) END as float64)
 AS `credit_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_credit_total_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_credit_total_refunded` AS string)), '') AS string) END as float64)
 AS `base_credit_total_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credit_total_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credit_total_refunded` AS string)), '') AS string) END as float64)
 AS `credit_total_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_snap_cards_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_snap_cards_amount` AS string)), '') AS string) END as float64)
 AS `base_snap_cards_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`snap_cards_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`snap_cards_amount` AS string)), '') AS string) END as float64)
 AS `snap_cards_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_order_id` AS string)), '') AS string) END as string)
 AS `dsco_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_po_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_po_number` AS string)), '') AS string) END as string)
 AS `dsco_po_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`refund_reason` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`refund_reason` AS string)), '') AS string) END as string)
 AS `refund_reason`


  , `restocking_fee_amount` AS `_raw_restocking_fee_amount`

  , `base_restocking_fee_amount` AS `_raw_base_restocking_fee_amount`

  , `restocking_fee_percent` AS `_raw_restocking_fee_percent`

  , `adjustment_negative_percent` AS `_raw_adjustment_negative_percent`

  , `shipping_fee_amount` AS `_raw_shipping_fee_amount`

  , `base_shipping_fee_amount` AS `_raw_base_shipping_fee_amount`

  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_creditmemo` AS source_table

 ) AS un_ordered

;

