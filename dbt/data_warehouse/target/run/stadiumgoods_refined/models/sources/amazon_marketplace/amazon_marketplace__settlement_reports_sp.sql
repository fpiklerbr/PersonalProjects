

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`amazon_marketplace__settlement_reports_sp`
  OPTIONS()
  as 


  

    
                    
                    
                WITH layer_0 AS ( 
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

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`deposit_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`deposit_date` AS string)), '') AS string) END as string)
 AS `_raw_deposit_date`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`total_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`total_amount` AS string)), '') AS string) END as float64)
 AS `total_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`other_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`other_amount` AS string)), '') AS string) END as float64)
 AS `other_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`currency` AS string)), '') AS string) END as string)
 AS `base_currency`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`posted_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`posted_date` AS string)), '') AS string) END as string)
 AS `posted_date`
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

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price_type` AS string)), '') AS string) END as string)
 AS `price_type`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`price_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`price_amount` AS string)), '') AS string) END as float64)
 AS `_raw_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fulfillment_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fulfillment_id` AS string)), '') AS string) END as string)
 AS `fulfillment_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`order_item_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`order_item_code` AS string)), '') AS string) END as string)
 AS `order_item_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_related_fee_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_related_fee_type` AS string)), '') AS string) END as string)
 AS `item_related_fee_type`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`item_related_fee_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`item_related_fee_amount` AS string)), '') AS string) END as float64)
 AS `item_related_fee_amount`
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

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`promotion_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`promotion_id` AS string)), '') AS string) END as string)
 AS `promotion_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`
  , `misc_fee_amount` AS `_raw_misc_fee_amount`
  , `other_fee_amount` AS `_raw_other_fee_amount`
  , `other_fee_reason_description` AS `_raw_other_fee_reason_description`
  , `promotion_type` AS `_raw_promotion_type`
  , `promotion_amount` AS `_raw_promotion_amount`
  , `direct_payment_type` AS `_raw_direct_payment_type`
  , `direct_payment_amount` AS `_raw_direct_payment_amount`
FROM `ff-stadiumgoods-raw-live`.`imports`.`amazon_marketplace_settlement_reports_sp`

WHERE 1=1
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast(fulfillment_id = 'AFN' as boolean)
 AS `is_fba`
FROM layer_0
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `settlement_id` AS `settlement_id`
  , `settlement_start_date` AS `settlement_start_date`
  , `settlement_end_date` AS `settlement_end_date`
  , `_raw_deposit_date` AS `_raw_deposit_date`
  , `total_amount` AS `total_amount`
  , `other_amount` AS `other_amount`
  , `base_currency` AS `base_currency`
  , `posted_date` AS `posted_date`
  , `transaction_type` AS `transaction_type`
  , `transaction_id` AS `transaction_id`
  , `merchant_order_id` AS `merchant_order_id`
  , `adjustment_id` AS `adjustment_id`
  , `shipment_id` AS `shipment_id`
  , `marketplace_name` AS `marketplace_name`
  , `shipment_fee_type` AS `shipment_fee_type`
  , `shipment_fee_amount` AS `shipment_fee_amount`
  , `order_fee_type` AS `order_fee_type`
  , `order_fee_amount` AS `order_fee_amount`
  , `price_type` AS `price_type`
  , `_raw_amount` AS `_raw_amount`
  , `fulfillment_id` AS `fulfillment_id`
  , `is_fba` AS `is_fba`
  , `order_item_code` AS `order_item_code`
  , `item_related_fee_type` AS `item_related_fee_type`
  , `item_related_fee_amount` AS `item_related_fee_amount`
  , `merchant_order_item_id` AS `merchant_order_item_id`
  , `merchant_adjustment_item_id` AS `merchant_adjustment_item_id`
  , `sku` AS `sku`
  , `quantity_purchased` AS `quantity_purchased`
  , `promotion_id` AS `promotion_id`
  , `file_name` AS `file_name`
  , `file_time` AS `file_time`
  , `_raw_misc_fee_amount` AS `_raw_misc_fee_amount`
  , `_raw_other_fee_amount` AS `_raw_other_fee_amount`
  , `_raw_other_fee_reason_description` AS `_raw_other_fee_reason_description`
  , `_raw_promotion_type` AS `_raw_promotion_type`
  , `_raw_promotion_amount` AS `_raw_promotion_amount`
  , `_raw_direct_payment_type` AS `_raw_direct_payment_type`
  , `_raw_direct_payment_amount` AS `_raw_direct_payment_amount`
FROM layer_1
WHERE 1=1
                     ) SELECT * FROM final ;

