
        
        
    

    

    merge into `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`flow__orders` as DBT_INTERNAL_DEST
        using (
           












































































































 

SELECT   `attributes_checkout_continue_shopping_url`,  `attributes_flow_policies`,  `attributes_stripe_charge_id`,  `balance_amount`,  `balance_base_amount`,  `balance_base_currency`,  `balance_base_label`,  `balance_currency`,  `balance_label`,  `customer_address_city`,  `customer_address_company`,  `customer_address_country`,  `customer_address_name_first`,  `customer_address_name_last`,  `customer_address_postal`,  `customer_address_province`,  `customer_address_streets`,  `customer_email`,  `customer_name_first`,  `customer_name_last`,  `customer_phone`,  `delivered_duty_paid`,  `deliveries`,  `destination_city`,  `destination_contact_company`,  `destination_contact_email`,  `destination_contact_name_first`,  `destination_contact_name_last`,  `destination_contact_phone`,  `destination_country`,  `destination_postal`,  `destination_province`,  `destination_streets`,  `discriminator`,  `experience_discriminator`,  `experience_key`,  `expires_at`,  `id`,  `items`,  `lines`,  `merchant_of_record`,  `transaction_id`,  `payments`,  `prices`,  `promotions_applied`,  `promotions_available`,  `selections`,  `payment_processed_at`,  `total_amount`,  `payment_amount`,  `total_base_currency`,  `total_base_label`,  `total_currency`,  `total_label`,  `file_name`,  `file_time`,  `shipping_price`,  `shipping_tier`,  `journal_timestamp`,  `type`,  `row_id`,  `carrier_id`,  `shipment_from`,  `shipment_to`,  `shipment_timezone`,  `delivery_window_early`,  `delivery_window_late`,  `weight`,  `weight_unit`,  `index`,  `attributes_flow_checkout_behavior_customer_email_prompt`,  `attributes_flow_checkout_behavior_shipping_address_prompt`,  `attributes_flow_checkout_behavior_shipping_method_prompt`,  `attributes_pricing_key`,  `customer_number`,  `geo_country`,  `geo_currency`,  `geo_ip`,  `geo_language`,  `attributes_out_trade_no`,  `attributes_result_status`,  `attributes_alipay_trade_no`,  `attributes_sg_order_source`,  `total_item_price`,  `surcharges_base_amount`,  `shipping_base_amount`,  `total_tax`,  `total_item_tax`,  `shipping_tax`,  `total_discount`,  `total_item_discount`,  `shipping_discount`,  `duties`,  `attributes_front_chat_app_params`,  `attributes_citcon_order_id`,  `attributes_checkout_persistence`,  `attributes_q4_ship_delay_message`,  `attributes_citcon_transaction_id`,  `attributes_ga_client_id`,  `attributes_discount_code_label`,  `balance_key`,  `attributes_flow_vat_name`,  `attributes_flow_duty_name`,  `discount_base_amount`,  `total_key`,  `citcon_reference`,  `channel_or_gateway`,  `checkout_status`
  FROM ( SELECT
    *

  , 
    safe_cast(coalesce(total_tax * ((total_item_price - total_item_discount) / nullif((total_item_price - total_item_discount) + (shipping_price - shipping_discount), 0)), total_tax) as float64)
 AS `total_item_tax`
  , 
    safe_cast(coalesce(total_tax * ((shipping_price - shipping_discount) / nullif((total_item_price - total_item_discount) + (shipping_price - shipping_discount), 0)), 0) as float64)
 AS `shipping_tax` 

 

FROM ( 

SELECT
    *

  , 
    safe_cast(shipping_base_amount + surcharges_base_amount as float64)
 AS `shipping_price`
  , 
    safe_cast((-1 * discount_base_amount) as float64)
 AS `total_discount`
  , 
    safe_cast(CASE WHEN (-1 * discount_base_amount) > total_item_price THEN total_item_price ELSE (-1 * discount_base_amount) END as float64)
 AS `total_item_discount`
  , 
    safe_cast(CASE WHEN (-1 * discount_base_amount) > total_item_price THEN (-1 * discount_base_amount) - total_item_price ELSE 0 END as float64)
 AS `shipping_discount`
  , 
    safe_cast(substr(transaction_id, 1, 32) as string)
 AS `citcon_reference`
  , 
    safe_cast(CASE WHEN coalesce(attributes_citcon_order_id, attributes_citcon_transaction_id) IS NOT NULL THEN 'China App (Citcon)' WHEN attributes_sg_order_source = 'china-mobile-app' THEN 'China App' ELSE 'Flow' END as string)
 AS `channel_or_gateway`
  , 
    safe_cast(CASE WHEN payments <> '[]' OR coalesce(attributes_citcon_order_id, attributes_citcon_transaction_id) IS NOT NULL THEN 'Approved' ELSE 'Not Approved' END as string)
 AS `checkout_status` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`attributes_checkout_continue_shopping_url` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`attributes_checkout_continue_shopping_url` AS string)), '') AS string) END as string)
 AS `attributes_checkout_continue_shopping_url`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`attributes_flow_policies` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`attributes_flow_policies` AS string)), '') AS string) END as string)
 AS `attributes_flow_policies`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`attributes_stripe_charge_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`attributes_stripe_charge_id` AS string)), '') AS string) END as string)
 AS `attributes_stripe_charge_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`balance_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`balance_amount` AS string)), '') AS string) END as float64)
 AS `balance_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`balance_base_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`balance_base_amount` AS string)), '') AS string) END as float64)
 AS `balance_base_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`balance_base_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`balance_base_currency` AS string)), '') AS string) END as string)
 AS `balance_base_currency`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`balance_base_label` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`balance_base_label` AS string)), '') AS string) END as string)
 AS `balance_base_label`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`balance_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`balance_currency` AS string)), '') AS string) END as string)
 AS `balance_currency`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`balance_label` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`balance_label` AS string)), '') AS string) END as string)
 AS `balance_label`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_address_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_address_city` AS string)), '') AS string) END as string)
 AS `customer_address_city`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_address_company` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_address_company` AS string)), '') AS string) END as string)
 AS `customer_address_company`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_address_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_address_country` AS string)), '') AS string) END as string)
 AS `customer_address_country`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_address_name_first` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_address_name_first` AS string)), '') AS string) END as string)
 AS `customer_address_name_first`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_address_name_last` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_address_name_last` AS string)), '') AS string) END as string)
 AS `customer_address_name_last`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_address_postal` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_address_postal` AS string)), '') AS string) END as string)
 AS `customer_address_postal`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_address_province` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_address_province` AS string)), '') AS string) END as string)
 AS `customer_address_province`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_address_streets` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_address_streets` AS string)), '') AS string) END as string)
 AS `customer_address_streets`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_email` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_email` AS string)), '') AS string) END as string)
 AS `customer_email`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_name_first` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_name_first` AS string)), '') AS string) END as string)
 AS `customer_name_first`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_name_last` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_name_last` AS string)), '') AS string) END as string)
 AS `customer_name_last`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_phone` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_phone` AS string)), '') AS string) END as string)
 AS `customer_phone`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`delivered_duty` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`delivered_duty` AS string)), '') AS string) END as string)
 AS `delivered_duty_paid`

  , 
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`deliveries` AS string)), '') AS string), 
  '\''
, 
  '"'
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`deliveries` AS string)), '') AS string), 
  '\''
, 
  '"'
) END as string)
 AS `deliveries`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`destination_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`destination_city` AS string)), '') AS string) END as string)
 AS `destination_city`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`destination_contact_company` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`destination_contact_company` AS string)), '') AS string) END as string)
 AS `destination_contact_company`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`destination_contact_email` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`destination_contact_email` AS string)), '') AS string) END as string)
 AS `destination_contact_email`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`destination_contact_name_first` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`destination_contact_name_first` AS string)), '') AS string) END as string)
 AS `destination_contact_name_first`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`destination_contact_name_last` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`destination_contact_name_last` AS string)), '') AS string) END as string)
 AS `destination_contact_name_last`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`destination_contact_phone` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`destination_contact_phone` AS string)), '') AS string) END as string)
 AS `destination_contact_phone`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`destination_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`destination_country` AS string)), '') AS string) END as string)
 AS `destination_country`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`destination_postal` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`destination_postal` AS string)), '') AS string) END as string)
 AS `destination_postal`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`destination_province` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`destination_province` AS string)), '') AS string) END as string)
 AS `destination_province`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`destination_streets` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`destination_streets` AS string)), '') AS string) END as string)
 AS `destination_streets`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discriminator` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discriminator` AS string)), '') AS string) END as string)
 AS `discriminator`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`experience_discriminator` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`experience_discriminator` AS string)), '') AS string) END as string)
 AS `experience_discriminator`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`experience_key` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`experience_key` AS string)), '') AS string) END as string)
 AS `experience_key`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`expires_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`expires_at` AS string)), '') AS string) END as timestamp)
 AS `expires_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`id` AS string)), '') AS string) END as string)
 AS `id`

  , 
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`items` AS string)), '') AS string), 
  '\''
, 
  '"'
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`items` AS string)), '') AS string), 
  '\''
, 
  '"'
) END as string)
 AS `items`

  , 
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`lines` AS string)), '') AS string), 
  '\''
, 
  '"'
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`lines` AS string)), '') AS string), 
  '\''
, 
  '"'
) END as string)
 AS `lines`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`merchant_of_record` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`merchant_of_record` AS string)), '') AS string) END as string)
 AS `merchant_of_record`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`number` AS string)), '') AS string) END as string)
 AS `transaction_id`

  , 
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`payments` AS string)), '') AS string), 
  '\''
, 
  '"'
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`payments` AS string)), '') AS string), 
  '\''
, 
  '"'
) END as string)
 AS `payments`

  , 
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`prices` AS string)), '') AS string), 
  '\''
, 
  '"'
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`prices` AS string)), '') AS string), 
  '\''
, 
  '"'
) END as string)
 AS `prices`

  , 
    safe_cast(CASE WHEN replace(cast(nullif(trim(cast(`promotions_applied` AS string)), '') AS string), 
  '\''
, 
  '"'
) IN ('nan','None','','NaT') THEN NULL ELSE replace(cast(nullif(trim(cast(`promotions_applied` AS string)), '') AS string), 
  '\''
, 
  '"'
) END as string)
 AS `promotions_applied`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`promotions_available` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`promotions_available` AS string)), '') AS string) END as string)
 AS `promotions_available`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`selections` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`selections` AS string)), '') AS string) END as string)
 AS `selections`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`submitted_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`submitted_at` AS string)), '') AS string) END as timestamp)
 AS `payment_processed_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_amount` AS string)), '') AS string) END as float64)
 AS `total_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_base_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_base_amount` AS string)), '') AS string) END as float64)
 AS `payment_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_base_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_base_currency` AS string)), '') AS string) END as string)
 AS `total_base_currency`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_base_label` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_base_label` AS string)), '') AS string) END as string)
 AS `total_base_label`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_currency` AS string)), '') AS string) END as string)
 AS `total_currency`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_label` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_label` AS string)), '') AS string) END as string)
 AS `total_label`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_tier` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_tier` AS string)), '') AS string) END as string)
 AS `shipping_tier`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`journal_timestamp` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`journal_timestamp` AS string)), '') AS string) END as timestamp)
 AS `journal_timestamp`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`type` AS string)), '') AS string) END as string)
 AS `type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`row_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`row_id` AS string)), '') AS string) END as string)
 AS `row_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`carrier_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`carrier_id` AS string)), '') AS string) END as string)
 AS `carrier_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_from` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_from` AS string)), '') AS string) END as timestamp)
 AS `shipment_from`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_to` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_to` AS string)), '') AS string) END as timestamp)
 AS `shipment_to`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_timezone` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_timezone` AS string)), '') AS string) END as string)
 AS `shipment_timezone`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`delivery_window_early` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`delivery_window_early` AS string)), '') AS string) END as float64)
 as int64)
 AS `delivery_window_early`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`delivery_window_late` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`delivery_window_late` AS string)), '') AS string) END as float64)
 as int64)
 AS `delivery_window_late`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`weight` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`weight` AS string)), '') AS string) END as float64)
 AS `weight`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`weight_unit` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`weight_unit` AS string)), '') AS string) END as string)
 AS `weight_unit`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`index` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`index` AS string)), '') AS string) END as float64)
 as int64)
 AS `index`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`attributes_flow_checkout_behavior_customer_email_prompt` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`attributes_flow_checkout_behavior_customer_email_prompt` AS string)), '') AS string) END as string)
 AS `attributes_flow_checkout_behavior_customer_email_prompt`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`attributes_flow_checkout_behavior_shipping_address_prompt` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`attributes_flow_checkout_behavior_shipping_address_prompt` AS string)), '') AS string) END as string)
 AS `attributes_flow_checkout_behavior_shipping_address_prompt`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`attributes_flow_checkout_behavior_shipping_method_prompt` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`attributes_flow_checkout_behavior_shipping_method_prompt` AS string)), '') AS string) END as string)
 AS `attributes_flow_checkout_behavior_shipping_method_prompt`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`attributes_pricing_key` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`attributes_pricing_key` AS string)), '') AS string) END as string)
 AS `attributes_pricing_key`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_number` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_number` AS string)), '') AS string) END as string)
 AS `customer_number`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`geo_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`geo_country` AS string)), '') AS string) END as string)
 AS `geo_country`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`geo_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`geo_currency` AS string)), '') AS string) END as string)
 AS `geo_currency`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`geo_ip` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`geo_ip` AS string)), '') AS string) END as string)
 AS `geo_ip`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`geo_language` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`geo_language` AS string)), '') AS string) END as string)
 AS `geo_language`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`attributes_out_trade_no` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`attributes_out_trade_no` AS string)), '') AS string) END as string)
 AS `attributes_out_trade_no`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`attributes_result_status` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`attributes_result_status` AS string)), '') AS string) END as string)
 AS `attributes_result_status`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`attributes_alipay_trade_no` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`attributes_alipay_trade_no` AS string)), '') AS string) END as string)
 AS `attributes_alipay_trade_no`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`attributes_sg_order_source` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`attributes_sg_order_source` AS string)), '') AS string) END as string)
 AS `attributes_sg_order_source`

  , coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`subtotal_base_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`subtotal_base_amount` AS string)), '') AS string) END as float64)
 , cast('0' AS float64 )) AS `total_item_price`

  , coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`surcharges_base_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`surcharges_base_amount` AS string)), '') AS string) END as float64)
 , cast('0' AS float64 )) AS `surcharges_base_amount`

  , coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_base_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_base_amount` AS string)), '') AS string) END as float64)
 , cast('0' AS float64 )) AS `shipping_base_amount`

  , coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`vat_base_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`vat_base_amount` AS string)), '') AS string) END as float64)
 , cast('0' AS float64 )) AS `total_tax`

  , coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`duty_base_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`duty_base_amount` AS string)), '') AS string) END as float64)
 , cast('0' AS float64 )) AS `duties`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`attributes_front_chat_app_params` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`attributes_front_chat_app_params` AS string)), '') AS string) END as string)
 AS `attributes_front_chat_app_params`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`attributes_citcon_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`attributes_citcon_order_id` AS string)), '') AS string) END as string)
 AS `attributes_citcon_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`attributes_checkout_persistence` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`attributes_checkout_persistence` AS string)), '') AS string) END as string)
 AS `attributes_checkout_persistence`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`attributes_q4_ship_delay_message` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`attributes_q4_ship_delay_message` AS string)), '') AS string) END as string)
 AS `attributes_q4_ship_delay_message`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`attributes_citcon_transaction_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`attributes_citcon_transaction_id` AS string)), '') AS string) END as string)
 AS `attributes_citcon_transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`attributes_ga_client_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`attributes_ga_client_id` AS string)), '') AS string) END as string)
 AS `attributes_ga_client_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`attributes_discount_code_label` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`attributes_discount_code_label` AS string)), '') AS string) END as string)
 AS `attributes_discount_code_label`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`balance_key` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`balance_key` AS string)), '') AS string) END as string)
 AS `balance_key`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`attributes_flow_vat_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`attributes_flow_vat_name` AS string)), '') AS string) END as string)
 AS `attributes_flow_vat_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`attributes_flow_duty_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`attributes_flow_duty_name` AS string)), '') AS string) END as string)
 AS `attributes_flow_duty_name`

  , coalesce( 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`discount_base_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`discount_base_amount` AS string)), '') AS string) END as float64)
 , cast('0' AS float64 )) AS `discount_base_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_key` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_key` AS string)), '') AS string) END as string)
 AS `total_key`



FROM `ff-stadiumgoods-raw-live`.`imports`.`flow_api_orders` AS source_table

WHERE 
    safe_cast(journal_timestamp as timestamp)
 > (SELECT max(journal_timestamp) FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`flow__orders` )


 ) AS source_select_statement

 ) AS macro_statement

 ) AS un_ordered


         ) as DBT_INTERNAL_SOURCE
        on 
            DBT_INTERNAL_SOURCE.id = DBT_INTERNAL_DEST.id
        

    
    when matched then update set
        `attributes_checkout_continue_shopping_url` = DBT_INTERNAL_SOURCE.`attributes_checkout_continue_shopping_url`,`attributes_flow_policies` = DBT_INTERNAL_SOURCE.`attributes_flow_policies`,`attributes_stripe_charge_id` = DBT_INTERNAL_SOURCE.`attributes_stripe_charge_id`,`balance_amount` = DBT_INTERNAL_SOURCE.`balance_amount`,`balance_base_amount` = DBT_INTERNAL_SOURCE.`balance_base_amount`,`balance_base_currency` = DBT_INTERNAL_SOURCE.`balance_base_currency`,`balance_base_label` = DBT_INTERNAL_SOURCE.`balance_base_label`,`balance_currency` = DBT_INTERNAL_SOURCE.`balance_currency`,`balance_label` = DBT_INTERNAL_SOURCE.`balance_label`,`customer_address_city` = DBT_INTERNAL_SOURCE.`customer_address_city`,`customer_address_company` = DBT_INTERNAL_SOURCE.`customer_address_company`,`customer_address_country` = DBT_INTERNAL_SOURCE.`customer_address_country`,`customer_address_name_first` = DBT_INTERNAL_SOURCE.`customer_address_name_first`,`customer_address_name_last` = DBT_INTERNAL_SOURCE.`customer_address_name_last`,`customer_address_postal` = DBT_INTERNAL_SOURCE.`customer_address_postal`,`customer_address_province` = DBT_INTERNAL_SOURCE.`customer_address_province`,`customer_address_streets` = DBT_INTERNAL_SOURCE.`customer_address_streets`,`customer_email` = DBT_INTERNAL_SOURCE.`customer_email`,`customer_name_first` = DBT_INTERNAL_SOURCE.`customer_name_first`,`customer_name_last` = DBT_INTERNAL_SOURCE.`customer_name_last`,`customer_phone` = DBT_INTERNAL_SOURCE.`customer_phone`,`delivered_duty_paid` = DBT_INTERNAL_SOURCE.`delivered_duty_paid`,`deliveries` = DBT_INTERNAL_SOURCE.`deliveries`,`destination_city` = DBT_INTERNAL_SOURCE.`destination_city`,`destination_contact_company` = DBT_INTERNAL_SOURCE.`destination_contact_company`,`destination_contact_email` = DBT_INTERNAL_SOURCE.`destination_contact_email`,`destination_contact_name_first` = DBT_INTERNAL_SOURCE.`destination_contact_name_first`,`destination_contact_name_last` = DBT_INTERNAL_SOURCE.`destination_contact_name_last`,`destination_contact_phone` = DBT_INTERNAL_SOURCE.`destination_contact_phone`,`destination_country` = DBT_INTERNAL_SOURCE.`destination_country`,`destination_postal` = DBT_INTERNAL_SOURCE.`destination_postal`,`destination_province` = DBT_INTERNAL_SOURCE.`destination_province`,`destination_streets` = DBT_INTERNAL_SOURCE.`destination_streets`,`discriminator` = DBT_INTERNAL_SOURCE.`discriminator`,`experience_discriminator` = DBT_INTERNAL_SOURCE.`experience_discriminator`,`experience_key` = DBT_INTERNAL_SOURCE.`experience_key`,`expires_at` = DBT_INTERNAL_SOURCE.`expires_at`,`id` = DBT_INTERNAL_SOURCE.`id`,`items` = DBT_INTERNAL_SOURCE.`items`,`lines` = DBT_INTERNAL_SOURCE.`lines`,`merchant_of_record` = DBT_INTERNAL_SOURCE.`merchant_of_record`,`transaction_id` = DBT_INTERNAL_SOURCE.`transaction_id`,`payments` = DBT_INTERNAL_SOURCE.`payments`,`prices` = DBT_INTERNAL_SOURCE.`prices`,`promotions_applied` = DBT_INTERNAL_SOURCE.`promotions_applied`,`promotions_available` = DBT_INTERNAL_SOURCE.`promotions_available`,`selections` = DBT_INTERNAL_SOURCE.`selections`,`payment_processed_at` = DBT_INTERNAL_SOURCE.`payment_processed_at`,`total_amount` = DBT_INTERNAL_SOURCE.`total_amount`,`payment_amount` = DBT_INTERNAL_SOURCE.`payment_amount`,`total_base_currency` = DBT_INTERNAL_SOURCE.`total_base_currency`,`total_base_label` = DBT_INTERNAL_SOURCE.`total_base_label`,`total_currency` = DBT_INTERNAL_SOURCE.`total_currency`,`total_label` = DBT_INTERNAL_SOURCE.`total_label`,`file_name` = DBT_INTERNAL_SOURCE.`file_name`,`file_time` = DBT_INTERNAL_SOURCE.`file_time`,`shipping_price` = DBT_INTERNAL_SOURCE.`shipping_price`,`shipping_tier` = DBT_INTERNAL_SOURCE.`shipping_tier`,`journal_timestamp` = DBT_INTERNAL_SOURCE.`journal_timestamp`,`type` = DBT_INTERNAL_SOURCE.`type`,`row_id` = DBT_INTERNAL_SOURCE.`row_id`,`carrier_id` = DBT_INTERNAL_SOURCE.`carrier_id`,`shipment_from` = DBT_INTERNAL_SOURCE.`shipment_from`,`shipment_to` = DBT_INTERNAL_SOURCE.`shipment_to`,`shipment_timezone` = DBT_INTERNAL_SOURCE.`shipment_timezone`,`delivery_window_early` = DBT_INTERNAL_SOURCE.`delivery_window_early`,`delivery_window_late` = DBT_INTERNAL_SOURCE.`delivery_window_late`,`weight` = DBT_INTERNAL_SOURCE.`weight`,`weight_unit` = DBT_INTERNAL_SOURCE.`weight_unit`,`index` = DBT_INTERNAL_SOURCE.`index`,`attributes_flow_checkout_behavior_customer_email_prompt` = DBT_INTERNAL_SOURCE.`attributes_flow_checkout_behavior_customer_email_prompt`,`attributes_flow_checkout_behavior_shipping_address_prompt` = DBT_INTERNAL_SOURCE.`attributes_flow_checkout_behavior_shipping_address_prompt`,`attributes_flow_checkout_behavior_shipping_method_prompt` = DBT_INTERNAL_SOURCE.`attributes_flow_checkout_behavior_shipping_method_prompt`,`attributes_pricing_key` = DBT_INTERNAL_SOURCE.`attributes_pricing_key`,`customer_number` = DBT_INTERNAL_SOURCE.`customer_number`,`geo_country` = DBT_INTERNAL_SOURCE.`geo_country`,`geo_currency` = DBT_INTERNAL_SOURCE.`geo_currency`,`geo_ip` = DBT_INTERNAL_SOURCE.`geo_ip`,`geo_language` = DBT_INTERNAL_SOURCE.`geo_language`,`attributes_out_trade_no` = DBT_INTERNAL_SOURCE.`attributes_out_trade_no`,`attributes_result_status` = DBT_INTERNAL_SOURCE.`attributes_result_status`,`attributes_alipay_trade_no` = DBT_INTERNAL_SOURCE.`attributes_alipay_trade_no`,`attributes_sg_order_source` = DBT_INTERNAL_SOURCE.`attributes_sg_order_source`,`total_item_price` = DBT_INTERNAL_SOURCE.`total_item_price`,`surcharges_base_amount` = DBT_INTERNAL_SOURCE.`surcharges_base_amount`,`shipping_base_amount` = DBT_INTERNAL_SOURCE.`shipping_base_amount`,`total_tax` = DBT_INTERNAL_SOURCE.`total_tax`,`total_item_tax` = DBT_INTERNAL_SOURCE.`total_item_tax`,`shipping_tax` = DBT_INTERNAL_SOURCE.`shipping_tax`,`total_discount` = DBT_INTERNAL_SOURCE.`total_discount`,`total_item_discount` = DBT_INTERNAL_SOURCE.`total_item_discount`,`shipping_discount` = DBT_INTERNAL_SOURCE.`shipping_discount`,`duties` = DBT_INTERNAL_SOURCE.`duties`,`attributes_front_chat_app_params` = DBT_INTERNAL_SOURCE.`attributes_front_chat_app_params`,`attributes_citcon_order_id` = DBT_INTERNAL_SOURCE.`attributes_citcon_order_id`,`attributes_checkout_persistence` = DBT_INTERNAL_SOURCE.`attributes_checkout_persistence`,`attributes_q4_ship_delay_message` = DBT_INTERNAL_SOURCE.`attributes_q4_ship_delay_message`,`attributes_citcon_transaction_id` = DBT_INTERNAL_SOURCE.`attributes_citcon_transaction_id`,`attributes_ga_client_id` = DBT_INTERNAL_SOURCE.`attributes_ga_client_id`,`attributes_discount_code_label` = DBT_INTERNAL_SOURCE.`attributes_discount_code_label`,`balance_key` = DBT_INTERNAL_SOURCE.`balance_key`,`attributes_flow_vat_name` = DBT_INTERNAL_SOURCE.`attributes_flow_vat_name`,`attributes_flow_duty_name` = DBT_INTERNAL_SOURCE.`attributes_flow_duty_name`,`discount_base_amount` = DBT_INTERNAL_SOURCE.`discount_base_amount`,`total_key` = DBT_INTERNAL_SOURCE.`total_key`,`citcon_reference` = DBT_INTERNAL_SOURCE.`citcon_reference`,`channel_or_gateway` = DBT_INTERNAL_SOURCE.`channel_or_gateway`,`checkout_status` = DBT_INTERNAL_SOURCE.`checkout_status`
    

    when not matched then insert
        (`attributes_checkout_continue_shopping_url`, `attributes_flow_policies`, `attributes_stripe_charge_id`, `balance_amount`, `balance_base_amount`, `balance_base_currency`, `balance_base_label`, `balance_currency`, `balance_label`, `customer_address_city`, `customer_address_company`, `customer_address_country`, `customer_address_name_first`, `customer_address_name_last`, `customer_address_postal`, `customer_address_province`, `customer_address_streets`, `customer_email`, `customer_name_first`, `customer_name_last`, `customer_phone`, `delivered_duty_paid`, `deliveries`, `destination_city`, `destination_contact_company`, `destination_contact_email`, `destination_contact_name_first`, `destination_contact_name_last`, `destination_contact_phone`, `destination_country`, `destination_postal`, `destination_province`, `destination_streets`, `discriminator`, `experience_discriminator`, `experience_key`, `expires_at`, `id`, `items`, `lines`, `merchant_of_record`, `transaction_id`, `payments`, `prices`, `promotions_applied`, `promotions_available`, `selections`, `payment_processed_at`, `total_amount`, `payment_amount`, `total_base_currency`, `total_base_label`, `total_currency`, `total_label`, `file_name`, `file_time`, `shipping_price`, `shipping_tier`, `journal_timestamp`, `type`, `row_id`, `carrier_id`, `shipment_from`, `shipment_to`, `shipment_timezone`, `delivery_window_early`, `delivery_window_late`, `weight`, `weight_unit`, `index`, `attributes_flow_checkout_behavior_customer_email_prompt`, `attributes_flow_checkout_behavior_shipping_address_prompt`, `attributes_flow_checkout_behavior_shipping_method_prompt`, `attributes_pricing_key`, `customer_number`, `geo_country`, `geo_currency`, `geo_ip`, `geo_language`, `attributes_out_trade_no`, `attributes_result_status`, `attributes_alipay_trade_no`, `attributes_sg_order_source`, `total_item_price`, `surcharges_base_amount`, `shipping_base_amount`, `total_tax`, `total_item_tax`, `shipping_tax`, `total_discount`, `total_item_discount`, `shipping_discount`, `duties`, `attributes_front_chat_app_params`, `attributes_citcon_order_id`, `attributes_checkout_persistence`, `attributes_q4_ship_delay_message`, `attributes_citcon_transaction_id`, `attributes_ga_client_id`, `attributes_discount_code_label`, `balance_key`, `attributes_flow_vat_name`, `attributes_flow_duty_name`, `discount_base_amount`, `total_key`, `citcon_reference`, `channel_or_gateway`, `checkout_status`)
    values
        (`attributes_checkout_continue_shopping_url`, `attributes_flow_policies`, `attributes_stripe_charge_id`, `balance_amount`, `balance_base_amount`, `balance_base_currency`, `balance_base_label`, `balance_currency`, `balance_label`, `customer_address_city`, `customer_address_company`, `customer_address_country`, `customer_address_name_first`, `customer_address_name_last`, `customer_address_postal`, `customer_address_province`, `customer_address_streets`, `customer_email`, `customer_name_first`, `customer_name_last`, `customer_phone`, `delivered_duty_paid`, `deliveries`, `destination_city`, `destination_contact_company`, `destination_contact_email`, `destination_contact_name_first`, `destination_contact_name_last`, `destination_contact_phone`, `destination_country`, `destination_postal`, `destination_province`, `destination_streets`, `discriminator`, `experience_discriminator`, `experience_key`, `expires_at`, `id`, `items`, `lines`, `merchant_of_record`, `transaction_id`, `payments`, `prices`, `promotions_applied`, `promotions_available`, `selections`, `payment_processed_at`, `total_amount`, `payment_amount`, `total_base_currency`, `total_base_label`, `total_currency`, `total_label`, `file_name`, `file_time`, `shipping_price`, `shipping_tier`, `journal_timestamp`, `type`, `row_id`, `carrier_id`, `shipment_from`, `shipment_to`, `shipment_timezone`, `delivery_window_early`, `delivery_window_late`, `weight`, `weight_unit`, `index`, `attributes_flow_checkout_behavior_customer_email_prompt`, `attributes_flow_checkout_behavior_shipping_address_prompt`, `attributes_flow_checkout_behavior_shipping_method_prompt`, `attributes_pricing_key`, `customer_number`, `geo_country`, `geo_currency`, `geo_ip`, `geo_language`, `attributes_out_trade_no`, `attributes_result_status`, `attributes_alipay_trade_no`, `attributes_sg_order_source`, `total_item_price`, `surcharges_base_amount`, `shipping_base_amount`, `total_tax`, `total_item_tax`, `shipping_tax`, `total_discount`, `total_item_discount`, `shipping_discount`, `duties`, `attributes_front_chat_app_params`, `attributes_citcon_order_id`, `attributes_checkout_persistence`, `attributes_q4_ship_delay_message`, `attributes_citcon_transaction_id`, `attributes_ga_client_id`, `attributes_discount_code_label`, `balance_key`, `attributes_flow_vat_name`, `attributes_flow_duty_name`, `discount_base_amount`, `total_key`, `citcon_reference`, `channel_or_gateway`, `checkout_status`)


  