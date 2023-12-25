


  

    
                    
                    
                    
                    
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

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amount_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amount_type` AS string)), '') AS string) END as string)
 AS `amount_type`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amount_description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amount_description` AS string)), '') AS string) END as string)
 AS `amount_description`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`amount` AS string)), '') AS string) END as float64)
 AS `_raw_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fulfillment_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fulfillment_id` AS string)), '') AS string) END as string)
 AS `fulfillment_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`posted_date` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`posted_date` AS string)), '') AS string) END as string)
 AS `_raw_posted_date`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`posted_date_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`posted_date_time` AS string)), '') AS string) END as string)
 AS `_raw_posted_date_time`
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

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`promotion_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`promotion_id` AS string)), '') AS string) END as string)
 AS `promotion_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`
FROM `ff-stadiumgoods-raw-live`.`imports`.`amazon_marketplace_settlement_reports`

WHERE 1=1
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast(fulfillment_id = 'AFN' as boolean)
 AS `is_fba`
  , 
    safe_cast(amount_type IN ('ItemFees', 'ShipmentFees') OR amount_description IN ('RestockingFee', 'SAFE-T reimbursement', 'REVERSAL_REIMBURSEMENT') as boolean)
 AS `is_fee`
FROM layer_0
WHERE 1=1
                     ) , layer_2 AS ( 
                    SELECT
    *
  , 
    
    safe_cast(CASE
          WHEN


  regexp_contains(_raw_deposit_date, r'(?i)^[0-9]{1,2}.[0-9]{1,2}.[0-9]{4} [0-9]{1,2}:[0-9]{2}:[0-9]{2} UTC.*$')


          THEN  parse_timestamp('%d.%m.%Y %H:%M:%S %Z', _raw_deposit_date)
        END as date)


 AS `settlement_date_dot`
  , 
    
    safe_cast(CASE
          WHEN


  regexp_contains(_raw_deposit_date, r'(?i)^[0-9]{4}-[0-9]{1,2}-[0-9]{1,2} [0-9]{1,2}:[0-9]{2}:[0-9]{2} UTC.*$')


          THEN  parse_timestamp('%Y-%m-%d %H:%M:%S %Z', _raw_deposit_date)
        END as date)


 AS `settlement_date_dash`
  , 
    
    safe_cast(CASE
          WHEN


  regexp_contains(_raw_posted_date, r'(?i)^[0-9]{4}-[0-9]{1,2}-[0-9]{1,2}$')


          THEN  parse_timestamp('%Y-%m-%d', _raw_posted_date)
        END as date)


 AS `_sql_posted_date_dash`
  , 
    
    safe_cast(CASE
          WHEN


  regexp_contains(_raw_posted_date, r'(?i)^[0-9]{1,2}.[0-9]{1,2}.[0-9]{4}$')


          THEN  parse_timestamp('%d.%m.%Y', _raw_posted_date)
        END as date)


 AS `_sql_posted_date_dot`
  , 
    
    safe_cast(CASE
          WHEN


  regexp_contains(_raw_posted_date_time, r'(?i)^[0-9]{1,2}.[0-9]{1,2}.[0-9]{4} [0-9]{1,2}:[0-9]{2}:[0-9]{2} UTC.*$')


          THEN  parse_timestamp('%d.%m.%Y %H:%M:%S %Z', _raw_posted_date_time)
        END as timestamp)


 AS `transaction_processed_at_dot`
  , 
    
    safe_cast(CASE
          WHEN


  regexp_contains(_raw_posted_date_time, r'(?i)^[0-9]{4}-[0-9]{1,2}-[0-9]{1,2} [0-9]{1,2}:[0-9]{2}:[0-9]{2} UTC.*$')


          THEN  parse_timestamp('%Y-%m-%d %H:%M:%S %Z', _raw_posted_date_time)
        END as timestamp)


 AS `transaction_processed_at_dash`
FROM layer_1
WHERE 1=1
                     ) , layer_3 AS ( 
                    SELECT
    *
  , 
    safe_cast(coalesce(settlement_date_dot, settlement_date_dash) as date)
 AS `settlement_date`
  , 
    safe_cast(coalesce(_sql_posted_date_dash, _sql_posted_date_dot) as date)
 AS `posted_date`
  , 
    safe_cast(coalesce(transaction_processed_at_dot, transaction_processed_at_dash) as timestamp)
 AS `transaction_processed_at`
  , 
    safe_cast(transaction_type = 'Order' AND amount_type = 'ItemWithheldTax' as boolean)
 AS `tax_is_withheld`
  , 
    safe_cast(CASE WHEN transaction_type = 'Order' THEN coalesce(transaction_processed_at_dot, transaction_processed_at_dash) END as timestamp)
 AS `payment_processed_at`
  , 
    safe_cast(CASE WHEN transaction_type = 'Order' AND is_fee IS NOT TRUE THEN _raw_amount END as float64)
 AS `base_payment_amount`
  , 
    safe_cast(CASE WHEN transaction_type = 'Order' AND is_fee IS TRUE THEN _raw_amount END as float64)
 AS `base_payment_fee`
  , 
    safe_cast(CASE WHEN transaction_type <> 'Order' THEN coalesce(transaction_processed_at_dot, transaction_processed_at_dash) END as timestamp)
 AS `refund_processed_at`
  , 
    safe_cast(CASE WHEN transaction_type <> 'Order' AND is_fee IS NOT TRUE THEN _raw_amount END as float64)
 AS `base_refund_amount`
  , 
    safe_cast(CASE WHEN transaction_type <> 'Order' AND is_fee IS TRUE THEN _raw_amount END as float64)
 AS `base_refund_fee`
FROM layer_2
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `settlement_id` AS `settlement_id`
  , `settlement_start_date` AS `settlement_start_date`
  , `settlement_end_date` AS `settlement_end_date`
  , `_raw_deposit_date` AS `_raw_deposit_date`
  , `settlement_date` AS `settlement_date`
  , `total_amount` AS `total_amount`
  , `base_currency` AS `base_currency`
  , `transaction_type` AS `transaction_type`
  , `transaction_id` AS `transaction_id`
  , `merchant_order_id` AS `merchant_order_id`
  , `adjustment_id` AS `adjustment_id`
  , `shipment_id` AS `shipment_id`
  , `marketplace_name` AS `marketplace_name`
  , `amount_type` AS `amount_type`
  , `amount_description` AS `amount_description`
  , `_raw_amount` AS `_raw_amount`
  , `fulfillment_id` AS `fulfillment_id`
  , `is_fba` AS `is_fba`
  , `posted_date` AS `posted_date`
  , `_raw_posted_date_time` AS `_raw_posted_date_time`
  , `transaction_processed_at` AS `transaction_processed_at`
  , `order_item_code` AS `order_item_code`
  , `merchant_order_item_id` AS `merchant_order_item_id`
  , `merchant_adjustment_item_id` AS `merchant_adjustment_item_id`
  , `sku` AS `sku`
  , `quantity_purchased` AS `quantity_purchased`
  , `promotion_id` AS `promotion_id`
  , `file_name` AS `file_name`
  , `file_time` AS `file_time`
  , `is_fee` AS `is_fee`
  , `tax_is_withheld` AS `tax_is_withheld`
  , `payment_processed_at` AS `payment_processed_at`
  , `base_payment_amount` AS `base_payment_amount`
  , `base_payment_fee` AS `base_payment_fee`
  , `refund_processed_at` AS `refund_processed_at`
  , `base_refund_amount` AS `base_refund_amount`
  , `base_refund_fee` AS `base_refund_fee`
FROM layer_3
WHERE 1=1
                     ) SELECT * FROM final 