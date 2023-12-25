

  





























































 

SELECT   `entity_id`,  `store_id`,  `created_at`,  `updated_at`,  `converted_at`,  `is_active`,  `is_virtual`,  `is_multi_shipping`,  `items_count`,  `items_qty`,  `orig_order_id`,  `store_to_base_rate`,  `store_to_quote_rate`,  `base_currency_code`,  `store_currency_code`,  `quote_currency_code`,  `grand_total`,  `base_grand_total`,  `checkout_method`,  `customer_id`,  `customer_tax_class_id`,  `customer_group_id`,  `customer_email`,  `customer_prefix`,  `customer_firstname`,  `customer_middlename`,  `customer_lastname`,  `customer_suffix`,  `customer_dob`,  `customer_note`,  `customer_note_notify`,  `customer_is_guest`,  `remote_ip`,  `applied_rule_ids`,  `reserved_order_id`,  to_hex(md5(cast(`password_hash` as 
    string
))) AS `password_hash`,  `coupon_code`,  `global_currency_code`,  `base_to_global_rate`,  `base_to_quote_rate`,  `customer_taxvat`,  `customer_gender`,  `subtotal`,  `base_subtotal`,  `subtotal_with_discount`,  `base_subtotal_with_discount`,  `is_changed`,  `trigger_recollect`,  `ext_shipping_info`,  `gift_message_id`,  `is_persistent`,  `use_credit`,  `base_credit_amount_used`,  `credit_amount_used`,  `snap_cards`,  `snap_cards_amount`,  `base_snap_cards_amount`,  `snap_cards_amount_used`,  `base_snap_cards_amount_used`,  `channel_discount_fee`,  `_synched_from_source_at`
    , `_raw_source`
  FROM ( 

SELECT
    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`entity_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `entity_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `store_id`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `created_at`

  , SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`updated_at` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `updated_at`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`converted_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`converted_at` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `converted_at`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_active` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_active` AS string)), '') AS string) END as float64)
 as int64)
 AS `is_active`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_virtual` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_virtual` AS string)), '') AS string) END as float64)
 as int64)
 AS `is_virtual`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_multi_shipping` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_multi_shipping` AS string)), '') AS string) END as float64)
 as int64)
 AS `is_multi_shipping`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`items_count` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`items_count` AS string)), '') AS string) END as float64)
 as int64)
 AS `items_count`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`items_qty` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`items_qty` AS string)), '') AS string) END as numeric)
 AS `items_qty`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`orig_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`orig_order_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `orig_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_to_base_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_to_base_rate` AS string)), '') AS string) END as numeric)
 AS `store_to_base_rate`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_to_quote_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_to_quote_rate` AS string)), '') AS string) END as numeric)
 AS `store_to_quote_rate`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_currency_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_currency_code` AS string)), '') AS string) END as string)
 AS `base_currency_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`store_currency_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`store_currency_code` AS string)), '') AS string) END as string)
 AS `store_currency_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`quote_currency_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`quote_currency_code` AS string)), '') AS string) END as string)
 AS `quote_currency_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`grand_total` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`grand_total` AS string)), '') AS string) END as numeric)
 AS `grand_total`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_grand_total` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_grand_total` AS string)), '') AS string) END as numeric)
 AS `base_grand_total`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`checkout_method` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`checkout_method` AS string)), '') AS string) END as string)
 AS `checkout_method`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `customer_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_tax_class_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_tax_class_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `customer_tax_class_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_group_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_group_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `customer_group_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_email` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_email` AS string)), '') AS string) END as string)
 AS `customer_email`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_prefix` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_prefix` AS string)), '') AS string) END as string)
 AS `customer_prefix`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_firstname` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_firstname` AS string)), '') AS string) END as string)
 AS `customer_firstname`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_middlename` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_middlename` AS string)), '') AS string) END as string)
 AS `customer_middlename`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_lastname` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_lastname` AS string)), '') AS string) END as string)
 AS `customer_lastname`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_suffix` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_suffix` AS string)), '') AS string) END as string)
 AS `customer_suffix`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_dob` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_dob` AS string)), '') AS string) END as timestamp)
 as datetime)
 AS `customer_dob`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_note` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_note` AS string)), '') AS string) END as string)
 AS `customer_note`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_note_notify` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_note_notify` AS string)), '') AS string) END as float64)
 as int64)
 AS `customer_note_notify`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_is_guest` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_is_guest` AS string)), '') AS string) END as float64)
 as int64)
 AS `customer_is_guest`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`remote_ip` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`remote_ip` AS string)), '') AS string) END as string)
 AS `remote_ip`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`applied_rule_ids` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`applied_rule_ids` AS string)), '') AS string) END as string)
 AS `applied_rule_ids`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reserved_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reserved_order_id` AS string)), '') AS string) END as string)
 AS `reserved_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`password_hash` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`password_hash` AS string)), '') AS string) END as string)
 AS `password_hash`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`coupon_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`coupon_code` AS string)), '') AS string) END as string)
 AS `coupon_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`global_currency_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`global_currency_code` AS string)), '') AS string) END as string)
 AS `global_currency_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_to_global_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_to_global_rate` AS string)), '') AS string) END as numeric)
 AS `base_to_global_rate`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_to_quote_rate` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_to_quote_rate` AS string)), '') AS string) END as numeric)
 AS `base_to_quote_rate`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_taxvat` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_taxvat` AS string)), '') AS string) END as string)
 AS `customer_taxvat`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_gender` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_gender` AS string)), '') AS string) END as string)
 AS `customer_gender`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`subtotal` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`subtotal` AS string)), '') AS string) END as numeric)
 AS `subtotal`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_subtotal` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_subtotal` AS string)), '') AS string) END as numeric)
 AS `base_subtotal`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`subtotal_with_discount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`subtotal_with_discount` AS string)), '') AS string) END as numeric)
 AS `subtotal_with_discount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_subtotal_with_discount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_subtotal_with_discount` AS string)), '') AS string) END as numeric)
 AS `base_subtotal_with_discount`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_changed` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_changed` AS string)), '') AS string) END as float64)
 as int64)
 AS `is_changed`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`trigger_recollect` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`trigger_recollect` AS string)), '') AS string) END as float64)
 as int64)
 AS `trigger_recollect`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`ext_shipping_info` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`ext_shipping_info` AS string)), '') AS string) END as string)
 AS `ext_shipping_info`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gift_message_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gift_message_id` AS string)), '') AS string) END as float64)
 as int64)
 AS `gift_message_id`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`is_persistent` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`is_persistent` AS string)), '') AS string) END as float64)
 as int64)
 AS `is_persistent`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`use_credit` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`use_credit` AS string)), '') AS string) END as float64)
 as int64)
 AS `use_credit`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_credit_amount_used` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_credit_amount_used` AS string)), '') AS string) END as numeric)
 AS `base_credit_amount_used`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`credit_amount_used` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`credit_amount_used` AS string)), '') AS string) END as numeric)
 AS `credit_amount_used`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`snap_cards` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`snap_cards` AS string)), '') AS string) END as string)
 AS `snap_cards`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`snap_cards_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`snap_cards_amount` AS string)), '') AS string) END as numeric)
 AS `snap_cards_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_snap_cards_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_snap_cards_amount` AS string)), '') AS string) END as numeric)
 AS `base_snap_cards_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`snap_cards_amount_used` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`snap_cards_amount_used` AS string)), '') AS string) END as numeric)
 AS `snap_cards_amount_used`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`base_snap_cards_amount_used` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`base_snap_cards_amount_used` AS string)), '') AS string) END as numeric)
 AS `base_snap_cards_amount_used`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`channel_discount_fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`channel_discount_fee` AS string)), '') AS string) END as numeric)
 AS `channel_discount_fee`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`_synched_from_source_at` AS string)), '') AS string) END as timestamp)
 AS `_synched_from_source_at`


  , `source` AS `_raw_source`


FROM `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_quote` AS source_table

 ) AS un_ordered

