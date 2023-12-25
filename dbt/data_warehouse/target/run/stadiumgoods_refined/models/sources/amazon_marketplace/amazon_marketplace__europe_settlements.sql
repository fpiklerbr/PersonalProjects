

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`amazon_marketplace__europe_settlements`
  OPTIONS()
  as 





































 

SELECT   `settlement_id`,  `settlement_start_date`,  `settlement_end_date`,  `settlement_date`,  `total_amount`,  `base_currency`,  `transaction_type`,  `transaction_id`,  `merchant_order_id`,  `adjustment_id`,  `shipment_id`,  `marketplace_name`,  `shipment_fee_type`,  `shipment_fee_amount`,  `order_fee_type`,  `order_fee_amount`,  `fulfillment_id`,  `is_fba`,  `transaction_processed_at`,  `order_item_code`,  `merchant_order_item_id`,  `merchant_adjustment_item_id`,  `sku`,  `quantity_purchased`,  `price_type`,  `transaction_amount`,  `item_related_fee_type`,  `transaction_fee`,  `misc_fee_amount`,  `other_fee_amount`,  `other_fee_reason_description`,  `direct_payment_type`,  `direct_payment_amount`,  `other_amount`,  `file_name`,  `file_time`,  `payment_processed_at`,  `base_payment_amount`,  `base_payment_fee`,  `refund_processed_at`,  `base_refund_amount`,  `base_refund_fee`
  FROM ( SELECT
    *

  , 
    safe_cast(CASE WHEN transaction_type = 'Order' THEN transaction_processed_at END as timestamp)
 AS `payment_processed_at`
  , 
    safe_cast(CASE WHEN transaction_type = 'Order' THEN transaction_amount END as float64)
 AS `base_payment_amount`
  , 
    safe_cast(CASE WHEN transaction_type = 'Order' THEN transaction_fee END as float64)
 AS `base_payment_fee`
  , 
    safe_cast(CASE WHEN transaction_type = 'Refund' THEN transaction_processed_at END as timestamp)
 AS `refund_processed_at`
  , 
    safe_cast(CASE WHEN transaction_type = 'Refund' THEN transaction_amount END as float64)
 AS `base_refund_amount`
  , 
    safe_cast(CASE WHEN transaction_type = 'Refund' THEN transaction_fee END as float64)
 AS `base_refund_fee` 

 

FROM ( 

SELECT
    *

  , 
    safe_cast(fulfillment_id = 'AFN' as boolean)
 AS `is_fba` 
FROM ( 

SELECT
    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`settlement_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`settlement_id` AS string)), '') AS string) END as string)
 AS `settlement_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`settlement_start_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`settlement_start_date` AS string)), '') AS string) END as string)
 AS `settlement_start_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`settlement_end_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`settlement_end_date` AS string)), '') AS string) END as string)
 AS `settlement_end_date`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`deposit_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`deposit_date` AS string)), '') AS string) END as timestamp)
 as date)
 AS `settlement_date`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_amount` AS string)), '') AS string) END as float64)
 AS `total_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`currency` AS string)), '') AS string) END as string)
 AS `base_currency`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`transaction_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`transaction_type` AS string)), '') AS string) END as string)
 AS `transaction_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_id` AS string)), '') AS string) END as string)
 AS `transaction_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`merchant_order_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`merchant_order_id` AS string)), '') AS string) END as string)
 AS `merchant_order_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`adjustment_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`adjustment_id` AS string)), '') AS string) END as string)
 AS `adjustment_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_id` AS string)), '') AS string) END as string)
 AS `shipment_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`marketplace_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`marketplace_name` AS string)), '') AS string) END as string)
 AS `marketplace_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_fee_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_fee_type` AS string)), '') AS string) END as string)
 AS `shipment_fee_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipment_fee_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipment_fee_amount` AS string)), '') AS string) END as float64)
 AS `shipment_fee_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_fee_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_fee_type` AS string)), '') AS string) END as string)
 AS `order_fee_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_fee_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_fee_amount` AS string)), '') AS string) END as float64)
 AS `order_fee_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fulfillment_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fulfillment_id` AS string)), '') AS string) END as string)
 AS `fulfillment_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`posted_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`posted_date` AS string)), '') AS string) END as timestamp)
 AS `transaction_processed_at`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_item_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_item_code` AS string)), '') AS string) END as string)
 AS `order_item_code`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`merchant_order_item_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`merchant_order_item_id` AS string)), '') AS string) END as string)
 AS `merchant_order_item_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`merchant_adjustment_item_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`merchant_adjustment_item_id` AS string)), '') AS string) END as string)
 AS `merchant_adjustment_item_id`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`sku` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`sku` AS string)), '') AS string) END as string)
 AS `sku`

  , 
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`quantity_purchased` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`quantity_purchased` AS string)), '') AS string) END as float64)
 as int64)
 AS `quantity_purchased`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price_type` AS string)), '') AS string) END as string)
 AS `price_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price_amount` AS string)), '') AS string) END as float64)
 AS `transaction_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_related_fee_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_related_fee_type` AS string)), '') AS string) END as string)
 AS `item_related_fee_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_related_fee_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_related_fee_amount` AS string)), '') AS string) END as float64)
 AS `transaction_fee`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`misc_fee_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`misc_fee_amount` AS string)), '') AS string) END as float64)
 AS `misc_fee_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`other_fee_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`other_fee_amount` AS string)), '') AS string) END as float64)
 AS `other_fee_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`other_fee_reason_description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`other_fee_reason_description` AS string)), '') AS string) END as string)
 AS `other_fee_reason_description`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`direct_payment_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`direct_payment_type` AS string)), '') AS string) END as string)
 AS `direct_payment_type`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`direct_payment_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`direct_payment_amount` AS string)), '') AS string) END as float64)
 AS `direct_payment_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`other_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`other_amount` AS string)), '') AS string) END as float64)
 AS `other_amount`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`

  , 
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`



FROM `ff-stadiumgoods-raw-live`.`imports`.`amazon_europe_settlements` AS source_table

 ) AS source_select_statement

 ) AS macro_statement

 ) AS un_ordered

;

