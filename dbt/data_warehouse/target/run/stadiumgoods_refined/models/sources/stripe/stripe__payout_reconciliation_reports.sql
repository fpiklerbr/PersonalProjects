

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`stripe__payout_reconciliation_reports`
  OPTIONS()
  as 



    
                    
                    
                    
                WITH layer_0 AS ( 
                SELECT

    

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`automatic_payout_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`automatic_payout_id` AS string)), '') AS string) END as string)
 AS `settlement_id`
  , 

    
    safe_cast(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`automatic_payout_effective_at` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`automatic_payout_effective_at` AS string)), '') AS string) END as timestamp)
 as date)
 AS `settlement_date`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`balance_transaction_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`balance_transaction_id` AS string)), '') AS string) END as string)
 AS `balance_transaction_id`
  , 

    SAFE_CAST(TIMESTAMP(SAFE_CAST(
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created_utc` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created_utc` AS string)), '') AS string) END as timestamp)
 AS datetime), 'Etc/UTC') AS timestamp) AS `transaction_processed_at`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`created` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`created` AS string)), '') AS string) END as string)
 AS `created`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`available_on_utc` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`available_on_utc` AS string)), '') AS string) END as string)
 AS `available_on_utc`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`available_on` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`available_on` AS string)), '') AS string) END as string)
 AS `available_on`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`currency` AS string)), '') AS string) END as string)
 AS `_raw_currency`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`gross` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`gross` AS string)), '') AS string) END as numeric)
 AS `transaction_base_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`fee` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`fee` AS string)), '') AS string) END as numeric)
 AS `_raw_fee`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`net` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`net` AS string)), '') AS string) END as numeric)
 AS `_raw_net`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`reporting_category` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`reporting_category` AS string)), '') AS string) END as string)
 AS `transaction_event`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`source_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`source_id` AS string)), '') AS string) END as string)
 AS `transaction_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`description` AS string)), '') AS string) END as string)
 AS `description`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_facing_amount` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_facing_amount` AS string)), '') AS string) END as string)
 AS `customer_facing_amount`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_facing_currency` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_facing_currency` AS string)), '') AS string) END as string)
 AS `customer_facing_currency`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`regulatory_tag` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`regulatory_tag` AS string)), '') AS string) END as string)
 AS `regulatory_tag`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`automatic_payout_effective_at_utc` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`automatic_payout_effective_at_utc` AS string)), '') AS string) END as string)
 AS `automatic_payout_effective_at_utc`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_id` AS string)), '') AS string) END as string)
 AS `customer_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_email` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_email` AS string)), '') AS string) END as string)
 AS `consignor_email`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_name` AS string)), '') AS string) END as string)
 AS `customer_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`customer_description` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`customer_description` AS string)), '') AS string) END as string)
 AS `customer_description`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_address_line1` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_address_line1` AS string)), '') AS string) END as string)
 AS `shipping_address_line1`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_address_line2` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_address_line2` AS string)), '') AS string) END as string)
 AS `shipping_address_line2`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_address_city` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_address_city` AS string)), '') AS string) END as string)
 AS `shipping_address_city`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_address_state` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_address_state` AS string)), '') AS string) END as string)
 AS `shipping_address_state`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_address_postal_code` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_address_postal_code` AS string)), '') AS string) END as string)
 AS `shipping_address_postal_code`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`shipping_address_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`shipping_address_country` AS string)), '') AS string) END as string)
 AS `shipping_address_country`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`charge_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`charge_id` AS string)), '') AS string) END as string)
 AS `invoice_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payment_intent_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_intent_id` AS string)), '') AS string) END as string)
 AS `payment_intent_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`charge_created_utc` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`charge_created_utc` AS string)), '') AS string) END as string)
 AS `charge_created_utc`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`charge_created` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`charge_created` AS string)), '') AS string) END as string)
 AS `charge_created`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`invoice_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`invoice_id` AS string)), '') AS string) END as string)
 AS `_raw_invoice_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`subscription_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`subscription_id` AS string)), '') AS string) END as string)
 AS `subscription_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`payment_method_type` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`payment_method_type` AS string)), '') AS string) END as string)
 AS `payment_method_type`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`card_brand` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`card_brand` AS string)), '') AS string) END as string)
 AS `card_brand`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`card_funding` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`card_funding` AS string)), '') AS string) END as string)
 AS `card_funding`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`card_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`card_country` AS string)), '') AS string) END as string)
 AS `card_country`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`statement_descriptor` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`statement_descriptor` AS string)), '') AS string) END as string)
 AS `statement_descriptor`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`dispute_reason` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`dispute_reason` AS string)), '') AS string) END as string)
 AS `dispute_reason`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`connected_account_id` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`connected_account_id` AS string)), '') AS string) END as string)
 AS `connected_account_id`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`connected_account_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`connected_account_name` AS string)), '') AS string) END as string)
 AS `connected_account_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`connected_account_country` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`connected_account_country` AS string)), '') AS string) END as string)
 AS `connected_account_country`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_name` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_name` AS string)), '') AS string) END as string)
 AS `file_name`
  , 

    
    safe_cast(CASE WHEN cast(nullif(trim(cast(`file_time` AS string)), '') AS string) IN ('nan','None','','NaT') THEN NULL ELSE cast(nullif(trim(cast(`file_time` AS string)), '') AS string) END as timestamp)
 AS `file_time`
FROM `ff-stadiumgoods-raw-live`.`imports`.`stripe_payout_reconciliation_reports`

WHERE 1=1
                 ) , layer_1 AS ( 
                    SELECT
    *
  , 
    safe_cast(upper(_raw_currency) as string)
 AS `base_currency`
  , 
    safe_cast(CASE transaction_event
WHEN 'charge' THEN 'Payment'
WHEN 'refund' THEN 'Refund'
WHEN 'dispute' THEN 'Chargeback'
WHEN 'dispute_reversal' THEN 'Chargeback'
ELSE 'SG&A'
END as string)
 AS `transaction_type`
  , 
    safe_cast('Stripe' as string)
 AS `transaction_channel`
  , 
    safe_cast(-1 * _raw_fee as numeric)
 AS `transaction_fee_base_amount`
FROM layer_0
WHERE 1=1
                     ) , layer_2 AS ( 
                    SELECT
    *
  , 
    safe_cast(datetime(safe_cast(transaction_processed_at AS timestamp), 'America/New_York') AS date) AS `transaction_date`
FROM layer_1
WHERE 1=1
                     ) , final AS ( 
                    SELECT

    `settlement_id` AS `settlement_id`
  , `settlement_date` AS `settlement_date`
  , `balance_transaction_id` AS `balance_transaction_id`
  , `transaction_processed_at` AS `transaction_processed_at`
  , `transaction_date` AS `transaction_date`
  , `created` AS `created`
  , `available_on_utc` AS `available_on_utc`
  , `available_on` AS `available_on`
  , `base_currency` AS `base_currency`
  , `transaction_base_amount` AS `transaction_base_amount`
  , `transaction_type` AS `transaction_type`
  , `transaction_channel` AS `transaction_channel`
  , `_raw_fee` AS `_raw_fee`
  , `transaction_fee_base_amount` AS `transaction_fee_base_amount`
  , `_raw_net` AS `_raw_net`
  , `transaction_event` AS `transaction_event`
  , `transaction_id` AS `transaction_id`
  , `description` AS `description`
  , `customer_facing_amount` AS `customer_facing_amount`
  , `customer_facing_currency` AS `customer_facing_currency`
  , `regulatory_tag` AS `regulatory_tag`
  , `automatic_payout_effective_at_utc` AS `automatic_payout_effective_at_utc`
  , `customer_id` AS `customer_id`
  , `consignor_email` AS `consignor_email`
  , `customer_name` AS `customer_name`
  , `customer_description` AS `customer_description`
  , `shipping_address_line1` AS `shipping_address_line1`
  , `shipping_address_line2` AS `shipping_address_line2`
  , `shipping_address_city` AS `shipping_address_city`
  , `shipping_address_state` AS `shipping_address_state`
  , `shipping_address_postal_code` AS `shipping_address_postal_code`
  , `shipping_address_country` AS `shipping_address_country`
  , `invoice_id` AS `invoice_id`
  , `payment_intent_id` AS `payment_intent_id`
  , `charge_created_utc` AS `charge_created_utc`
  , `charge_created` AS `charge_created`
  , `_raw_invoice_id` AS `_raw_invoice_id`
  , `subscription_id` AS `subscription_id`
  , `payment_method_type` AS `payment_method_type`
  , `card_brand` AS `card_brand`
  , `card_funding` AS `card_funding`
  , `card_country` AS `card_country`
  , `statement_descriptor` AS `statement_descriptor`
  , `dispute_reason` AS `dispute_reason`
  , `connected_account_id` AS `connected_account_id`
  , `connected_account_name` AS `connected_account_name`
  , `connected_account_country` AS `connected_account_country`
  , `file_name` AS `file_name`
  , `file_time` AS `file_time`
FROM layer_2
WHERE 1=1
                     ) SELECT * FROM final ;

