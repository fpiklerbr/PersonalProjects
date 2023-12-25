

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order`
  OPTIONS()
  as 

  





































































































































































 

SELECT   `sales_flat_order_id`,  `state`,  `status`,  `coupon_code`,  `protect_code`,  `shipping_description`,  `is_virtual`,  `store_id`,  `customer_id`,  `base_discount_amount`,  `base_discount_canceled`,  `base_discount_invoiced`,  `base_discount_refunded`,  `base_grand_total`,  `base_shipping_amount`,  `base_shipping_canceled`,  `base_shipping_invoiced`,  `base_shipping_refunded`,  `base_shipping_tax_amount`,  `base_shipping_tax_refunded`,  `base_subtotal`,  `base_subtotal_canceled`,  `base_subtotal_invoiced`,  `base_subtotal_refunded`,  `base_tax_amount`,  `base_tax_canceled`,  `base_tax_invoiced`,  `base_tax_refunded`,  `base_to_global_rate`,  `base_to_order_rate`,  `base_total_canceled`,  `base_total_invoiced`,  `base_total_invoiced_cost`,  `base_total_offline_refunded`,  `base_total_online_refunded`,  `base_total_paid`,  `base_total_qty_ordered`,  `base_total_refunded`,  `discount_amount`,  `discount_canceled`,  `discount_invoiced`,  `discount_refunded`,  `grand_total`,  `shipping_amount`,  `shipping_canceled`,  `shipping_invoiced`,  `shipping_refunded`,  `shipping_tax_amount`,  `shipping_tax_refunded`,  `store_to_base_rate`,  `store_to_order_rate`,  `subtotal`,  `subtotal_canceled`,  `subtotal_invoiced`,  `subtotal_refunded`,  `tax_amount`,  `tax_canceled`,  `tax_invoiced`,  `tax_refunded`,  `total_canceled`,  `total_invoiced`,  `total_offline_refunded`,  `total_online_refunded`,  `total_paid`,  `total_qty_ordered`,  `total_refunded`,  `can_ship_partially`,  `can_ship_partially_item`,  `customer_is_guest`,  `customer_note_notify`,  `billing_address_id`,  `customer_group_id`,  `is_edit_increment`,  `is_email_sent`,  `is_forced_shipment_with_invoice`,  `is_payment_auth_expiration`,  `quote_address_id`,  `quote_id`,  `shipping_address_id`,  `adjustment_negative`,  `adjustment_positive`,  `base_adjustment_negative`,  `base_adjustment_positive`,  `base_shipping_discount_amount`,  `base_subtotal_incl_tax`,  `base_total_due`,  `payment_authorization_amount`,  `shipping_discount_amount`,  `subtotal_incl_tax`,  `total_due`,  `weight`,  `customer_dob`,  `mag_order_id`,  `applied_rule_ids`,  `base_currency_code`,  `customer_email`,  `customer_firstname`,  `customer_lastname`,  `customer_middlename`,  `customer_prefix`,  `customer_suffix`,  `customer_taxvat`,  `discount_description`,  `ext_customer_id`,  `external_order_id`,  `global_currency_code`,  `hold_before_state`,  `hold_before_status`,  `order_currency_code`,  `original_increment_id`,  `relation_child_id`,  `relation_child_real_id`,  `relation_parent_id`,  `relation_parent_real_id`,  `remote_ip`,  `shipping_method`,  `store_currency_code`,  `store_name`,  `x_forwarded_for`,  `customer_note`,  `created_at`,  `updated_at`,  `total_item_count`,  `customer_gender`,  `hidden_tax_amount`,  `base_hidden_tax_amount`,  `shipping_hidden_tax_amount`,  `base_shipping_hidden_tax_amnt`,  `hidden_tax_invoiced`,  `base_hidden_tax_invoiced`,  `hidden_tax_refunded`,  `base_hidden_tax_refunded`,  `shipping_incl_tax`,  `base_shipping_incl_tax`,  `coupon_rule_name`,  `paypal_ipn_customer_notified`,  `gift_message_id`,  `channel`,  `base_credit_amount`,  `credit_amount`,  `base_credit_invoiced`,  `credit_invoiced`,  `base_credit_refunded`,  `credit_refunded`,  `base_credit_total_refunded`,  `credit_total_refunded`,  `snap_cards`,  `base_snap_cards_amount`,  `snap_cards_amount`,  `base_snap_cards_invoiced`,  `snap_cards_invoiced`,  `base_snap_cards_refunded`,  `snap_cards_refunded`,  `dsco_order_id`,  `dsco_po_number`,  `fulfillment_channels`,  `vantiv_subscription_id`,  `channel_discount_fee`
    , `_raw_dispatched_to_kafka_at`
    , `_raw_integration_channel`
    , `_raw_restocking_fee_amount`
    , `_raw_base_restocking_fee_amount`
    , `_raw_shipping_fee_amount`
    , `_raw_base_shipping_fee_amount`
    , `_raw_returns_exception_days`
    , `_raw__synched_from_source_at`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `sales_flat_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`state` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`state` AS string)), '') AS string) END as string)
 AS `state`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`status` AS string)), '') AS string) END as string)
 AS `status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`coupon_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`coupon_code` AS string)), '') AS string) END as string)
 AS `coupon_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`protect_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`protect_code` AS string)), '') AS string) END as string)
 AS `protect_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_description` AS string)), '') AS string) END as string)
 AS `shipping_description`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_virtual` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_virtual` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`is_virtual` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_virtual` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `is_virtual`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_id` AS string)), '') AS string) END as string)
 AS `store_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_id` AS string)), '') AS string) END as string)
 AS `customer_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_discount_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_discount_amount` AS string)), '') AS string) END as float64)
 AS `base_discount_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_discount_canceled` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_discount_canceled` AS string)), '') AS string) END as float64)
 AS `base_discount_canceled`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_discount_invoiced` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_discount_invoiced` AS string)), '') AS string) END as float64)
 AS `base_discount_invoiced`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_discount_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_discount_refunded` AS string)), '') AS string) END as float64)
 AS `base_discount_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_grand_total` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_grand_total` AS string)), '') AS string) END as float64)
 AS `base_grand_total`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_shipping_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_shipping_amount` AS string)), '') AS string) END as float64)
 AS `base_shipping_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_shipping_canceled` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_shipping_canceled` AS string)), '') AS string) END as float64)
 AS `base_shipping_canceled`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_shipping_invoiced` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_shipping_invoiced` AS string)), '') AS string) END as float64)
 AS `base_shipping_invoiced`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_shipping_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_shipping_refunded` AS string)), '') AS string) END as float64)
 AS `base_shipping_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_shipping_tax_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_shipping_tax_amount` AS string)), '') AS string) END as float64)
 AS `base_shipping_tax_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_shipping_tax_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_shipping_tax_refunded` AS string)), '') AS string) END as float64)
 AS `base_shipping_tax_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_subtotal` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_subtotal` AS string)), '') AS string) END as float64)
 AS `base_subtotal`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_subtotal_canceled` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_subtotal_canceled` AS string)), '') AS string) END as float64)
 AS `base_subtotal_canceled`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_subtotal_invoiced` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_subtotal_invoiced` AS string)), '') AS string) END as float64)
 AS `base_subtotal_invoiced`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_subtotal_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_subtotal_refunded` AS string)), '') AS string) END as float64)
 AS `base_subtotal_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_tax_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_tax_amount` AS string)), '') AS string) END as float64)
 AS `base_tax_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_tax_canceled` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_tax_canceled` AS string)), '') AS string) END as float64)
 AS `base_tax_canceled`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_tax_invoiced` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_tax_invoiced` AS string)), '') AS string) END as float64)
 AS `base_tax_invoiced`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_tax_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_tax_refunded` AS string)), '') AS string) END as float64)
 AS `base_tax_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_to_global_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_to_global_rate` AS string)), '') AS string) END as float64)
 AS `base_to_global_rate`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_to_order_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_to_order_rate` AS string)), '') AS string) END as float64)
 AS `base_to_order_rate`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_total_canceled` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_total_canceled` AS string)), '') AS string) END as float64)
 AS `base_total_canceled`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_total_invoiced` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_total_invoiced` AS string)), '') AS string) END as float64)
 AS `base_total_invoiced`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_total_invoiced_cost` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_total_invoiced_cost` AS string)), '') AS string) END as float64)
 AS `base_total_invoiced_cost`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_total_offline_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_total_offline_refunded` AS string)), '') AS string) END as float64)
 AS `base_total_offline_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_total_online_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_total_online_refunded` AS string)), '') AS string) END as float64)
 AS `base_total_online_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_total_paid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_total_paid` AS string)), '') AS string) END as float64)
 AS `base_total_paid`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_total_qty_ordered` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_total_qty_ordered` AS string)), '') AS string) END as float64)
 AS `base_total_qty_ordered`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_total_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_total_refunded` AS string)), '') AS string) END as float64)
 AS `base_total_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount_amount` AS string)), '') AS string) END as float64)
 AS `discount_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount_canceled` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount_canceled` AS string)), '') AS string) END as float64)
 AS `discount_canceled`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount_invoiced` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount_invoiced` AS string)), '') AS string) END as float64)
 AS `discount_invoiced`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount_refunded` AS string)), '') AS string) END as float64)
 AS `discount_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`grand_total` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`grand_total` AS string)), '') AS string) END as float64)
 AS `grand_total`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_amount` AS string)), '') AS string) END as float64)
 AS `shipping_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_canceled` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_canceled` AS string)), '') AS string) END as float64)
 AS `shipping_canceled`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_invoiced` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_invoiced` AS string)), '') AS string) END as float64)
 AS `shipping_invoiced`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_refunded` AS string)), '') AS string) END as float64)
 AS `shipping_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_tax_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_tax_amount` AS string)), '') AS string) END as float64)
 AS `shipping_tax_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_tax_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_tax_refunded` AS string)), '') AS string) END as float64)
 AS `shipping_tax_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_to_base_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_to_base_rate` AS string)), '') AS string) END as float64)
 AS `store_to_base_rate`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_to_order_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_to_order_rate` AS string)), '') AS string) END as float64)
 AS `store_to_order_rate`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`subtotal` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`subtotal` AS string)), '') AS string) END as float64)
 AS `subtotal`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`subtotal_canceled` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`subtotal_canceled` AS string)), '') AS string) END as float64)
 AS `subtotal_canceled`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`subtotal_invoiced` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`subtotal_invoiced` AS string)), '') AS string) END as float64)
 AS `subtotal_invoiced`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`subtotal_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`subtotal_refunded` AS string)), '') AS string) END as float64)
 AS `subtotal_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_amount` AS string)), '') AS string) END as float64)
 AS `tax_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_canceled` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_canceled` AS string)), '') AS string) END as float64)
 AS `tax_canceled`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_invoiced` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_invoiced` AS string)), '') AS string) END as float64)
 AS `tax_invoiced`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`tax_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`tax_refunded` AS string)), '') AS string) END as float64)
 AS `tax_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_canceled` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_canceled` AS string)), '') AS string) END as float64)
 AS `total_canceled`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_invoiced` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_invoiced` AS string)), '') AS string) END as float64)
 AS `total_invoiced`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_offline_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_offline_refunded` AS string)), '') AS string) END as float64)
 AS `total_offline_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_online_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_online_refunded` AS string)), '') AS string) END as float64)
 AS `total_online_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_paid` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_paid` AS string)), '') AS string) END as float64)
 AS `total_paid`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_qty_ordered` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_qty_ordered` AS string)), '') AS string) END as float64)
 AS `total_qty_ordered`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_refunded` AS string)), '') AS string) END as float64)
 AS `total_refunded`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`can_ship_partially` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`can_ship_partially` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`can_ship_partially` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`can_ship_partially` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `can_ship_partially`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`can_ship_partially_item` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`can_ship_partially_item` AS string)), '') AS string) END as string)
 AS `can_ship_partially_item`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`customer_is_guest` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_is_guest` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`customer_is_guest` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_is_guest` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `customer_is_guest`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`customer_note_notify` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_note_notify` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`customer_note_notify` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_note_notify` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `customer_note_notify`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`billing_address_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`billing_address_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `billing_address_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_group_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_group_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `customer_group_id`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`edit_increment` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`edit_increment` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`edit_increment` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`edit_increment` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `is_edit_increment`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`email_sent` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`email_sent` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`email_sent` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`email_sent` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `is_email_sent`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`forced_shipment_with_invoice` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`forced_shipment_with_invoice` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`forced_shipment_with_invoice` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`forced_shipment_with_invoice` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `is_forced_shipment_with_invoice`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`payment_auth_expiration` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_auth_expiration` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`payment_auth_expiration` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_auth_expiration` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `is_payment_auth_expiration`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`quote_address_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`quote_address_id` AS string)), '') AS string) END as string)
 AS `quote_address_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`quote_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`quote_id` AS string)), '') AS string) END as string)
 AS `quote_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_address_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_address_id` AS string)), '') AS string) END as string)
 AS `shipping_address_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`adjustment_negative` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`adjustment_negative` AS string)), '') AS string) END as float64)
 AS `adjustment_negative`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`adjustment_positive` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`adjustment_positive` AS string)), '') AS string) END as float64)
 AS `adjustment_positive`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_adjustment_negative` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_adjustment_negative` AS string)), '') AS string) END as float64)
 AS `base_adjustment_negative`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_adjustment_positive` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_adjustment_positive` AS string)), '') AS string) END as float64)
 AS `base_adjustment_positive`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_shipping_discount_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_shipping_discount_amount` AS string)), '') AS string) END as float64)
 AS `base_shipping_discount_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_subtotal_incl_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_subtotal_incl_tax` AS string)), '') AS string) END as float64)
 AS `base_subtotal_incl_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_total_due` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_total_due` AS string)), '') AS string) END as float64)
 AS `base_total_due`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payment_authorization_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_authorization_amount` AS string)), '') AS string) END as float64)
 AS `payment_authorization_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_discount_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_discount_amount` AS string)), '') AS string) END as float64)
 AS `shipping_discount_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`subtotal_incl_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`subtotal_incl_tax` AS string)), '') AS string) END as float64)
 AS `subtotal_incl_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_due` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_due` AS string)), '') AS string) END as float64)
 AS `total_due`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`weight` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`weight` AS string)), '') AS string) END as float64)
 AS `weight`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_dob` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_dob` AS string)), '') AS string) END as string)
 AS `customer_dob`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`increment_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`increment_id` AS string)), '') AS string) END as string)
 AS `mag_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`applied_rule_ids` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`applied_rule_ids` AS string)), '') AS string) END as string)
 AS `applied_rule_ids`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_currency_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_currency_code` AS string)), '') AS string) END as string)
 AS `base_currency_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_email` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_email` AS string)), '') AS string) END as string)
 AS `customer_email`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_firstname` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_firstname` AS string)), '') AS string) END as string)
 AS `customer_firstname`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_lastname` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_lastname` AS string)), '') AS string) END as string)
 AS `customer_lastname`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_middlename` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_middlename` AS string)), '') AS string) END as string)
 AS `customer_middlename`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_prefix` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_prefix` AS string)), '') AS string) END as string)
 AS `customer_prefix`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_suffix` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_suffix` AS string)), '') AS string) END as string)
 AS `customer_suffix`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_taxvat` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_taxvat` AS string)), '') AS string) END as string)
 AS `customer_taxvat`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount_description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount_description` AS string)), '') AS string) END as string)
 AS `discount_description`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ext_customer_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ext_customer_id` AS string)), '') AS string) END as string)
 AS `ext_customer_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ext_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ext_order_id` AS string)), '') AS string) END as string)
 AS `external_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`global_currency_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`global_currency_code` AS string)), '') AS string) END as string)
 AS `global_currency_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`hold_before_state` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`hold_before_state` AS string)), '') AS string) END as string)
 AS `hold_before_state`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`hold_before_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`hold_before_status` AS string)), '') AS string) END as string)
 AS `hold_before_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_currency_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_currency_code` AS string)), '') AS string) END as string)
 AS `order_currency_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`original_increment_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`original_increment_id` AS string)), '') AS string) END as string)
 AS `original_increment_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`relation_child_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`relation_child_id` AS string)), '') AS string) END as string)
 AS `relation_child_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`relation_child_real_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`relation_child_real_id` AS string)), '') AS string) END as string)
 AS `relation_child_real_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`relation_parent_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`relation_parent_id` AS string)), '') AS string) END as string)
 AS `relation_parent_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`relation_parent_real_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`relation_parent_real_id` AS string)), '') AS string) END as string)
 AS `relation_parent_real_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`remote_ip` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`remote_ip` AS string)), '') AS string) END as string)
 AS `remote_ip`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_method` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_method` AS string)), '') AS string) END as string)
 AS `shipping_method`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_currency_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_currency_code` AS string)), '') AS string) END as string)
 AS `store_currency_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_name` AS string)), '') AS string) END as string)
 AS `store_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`x_forwarded_for` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`x_forwarded_for` AS string)), '') AS string) END as string)
 AS `x_forwarded_for`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_note` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_note` AS string)), '') AS string) END as string)
 AS `customer_note`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_item_count` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_item_count` AS string)), '') AS string) END as float64)
 AS `total_item_count`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_gender` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_gender` AS string)), '') AS string) END as string)
 AS `customer_gender`

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
    safe_cast(CASE WHEN cast(nullif(trim(cast(`hidden_tax_invoiced` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`hidden_tax_invoiced` AS string)), '') AS string) END as float64)
 AS `hidden_tax_invoiced`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_hidden_tax_invoiced` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_hidden_tax_invoiced` AS string)), '') AS string) END as float64)
 AS `base_hidden_tax_invoiced`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`hidden_tax_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`hidden_tax_refunded` AS string)), '') AS string) END as float64)
 AS `hidden_tax_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_hidden_tax_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_hidden_tax_refunded` AS string)), '') AS string) END as float64)
 AS `base_hidden_tax_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_incl_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_incl_tax` AS string)), '') AS string) END as float64)
 AS `shipping_incl_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_shipping_incl_tax` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_shipping_incl_tax` AS string)), '') AS string) END as float64)
 AS `base_shipping_incl_tax`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`coupon_rule_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`coupon_rule_name` AS string)), '') AS string) END as string)
 AS `coupon_rule_name`

  , cast(
      CASE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`paypal_ipn_customer_notified` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`paypal_ipn_customer_notified` AS string)), '') AS string) END ) IN ('T','TRUE','1','1.0') THEN TRUE
        WHEN upper( CASE WHEN cast(nullif(trim(cast(`paypal_ipn_customer_notified` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`paypal_ipn_customer_notified` AS string)), '') AS string) END ) IN ('F','FALSE','0','0.0') THEN FALSE
      END
      AS boolean
    ) AS `paypal_ipn_customer_notified`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gift_message_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gift_message_id` AS string)), '') AS string) END as string)
 AS `gift_message_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`channel` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`channel` AS string)), '') AS string) END as string)
 AS `channel`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_credit_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_credit_amount` AS string)), '') AS string) END as float64)
 AS `base_credit_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credit_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credit_amount` AS string)), '') AS string) END as float64)
 AS `credit_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_credit_invoiced` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_credit_invoiced` AS string)), '') AS string) END as float64)
 AS `base_credit_invoiced`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credit_invoiced` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credit_invoiced` AS string)), '') AS string) END as float64)
 AS `credit_invoiced`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_credit_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_credit_refunded` AS string)), '') AS string) END as float64)
 AS `base_credit_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credit_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credit_refunded` AS string)), '') AS string) END as float64)
 AS `credit_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_credit_total_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_credit_total_refunded` AS string)), '') AS string) END as float64)
 AS `base_credit_total_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credit_total_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credit_total_refunded` AS string)), '') AS string) END as float64)
 AS `credit_total_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`snap_cards` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`snap_cards` AS string)), '') AS string) END as string)
 AS `snap_cards`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_snap_cards_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_snap_cards_amount` AS string)), '') AS string) END as float64)
 AS `base_snap_cards_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`snap_cards_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`snap_cards_amount` AS string)), '') AS string) END as float64)
 AS `snap_cards_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_snap_cards_invoiced` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_snap_cards_invoiced` AS string)), '') AS string) END as float64)
 AS `base_snap_cards_invoiced`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`snap_cards_invoiced` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`snap_cards_invoiced` AS string)), '') AS string) END as float64)
 AS `snap_cards_invoiced`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_snap_cards_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_snap_cards_refunded` AS string)), '') AS string) END as float64)
 AS `base_snap_cards_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`snap_cards_refunded` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`snap_cards_refunded` AS string)), '') AS string) END as float64)
 AS `snap_cards_refunded`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_order_id` AS string)), '') AS string) END as string)
 AS `dsco_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dsco_po_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dsco_po_number` AS string)), '') AS string) END as string)
 AS `dsco_po_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fulfillment_channels` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fulfillment_channels` AS string)), '') AS string) END as string)
 AS `fulfillment_channels`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vantiv_subscription_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vantiv_subscription_id` AS string)), '') AS string) END as string)
 AS `vantiv_subscription_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`channel_discount_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`channel_discount_fee` AS string)), '') AS string) END as float64)
 AS `channel_discount_fee`


  , `dispatched_to_kafka_at` AS `_raw_dispatched_to_kafka_at`

  , `integration_channel` AS `_raw_integration_channel`

  , `restocking_fee_amount` AS `_raw_restocking_fee_amount`

  , `base_restocking_fee_amount` AS `_raw_base_restocking_fee_amount`

  , `shipping_fee_amount` AS `_raw_shipping_fee_amount`

  , `base_shipping_fee_amount` AS `_raw_base_shipping_fee_amount`

  , `returns_exception_days` AS `_raw_returns_exception_days`

  , `_synched_from_source_at` AS `_raw__synched_from_source_at`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_order` AS source_table

 ) AS un_ordered

;

