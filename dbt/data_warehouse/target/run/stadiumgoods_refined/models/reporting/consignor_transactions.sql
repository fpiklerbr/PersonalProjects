

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`consignor_transactions`
  
  
  OPTIONS()
  as (
    WITH consignor_transactions AS (

 

        (
            select

                cast('`ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_paypal_consignor_transactions`' as 
    string
) as _dbt_source_relation,
                
                    cast(`invoice_id` as STRING) as `invoice_id` ,
                    cast(`consignor_email` as STRING) as `consignor_email` ,
                    cast(`transaction_channel` as STRING) as `transaction_channel` ,
                    cast(`transaction_id` as STRING) as `transaction_id` ,
                    cast(`transaction_event` as STRING) as `transaction_event` ,
                    cast(`transaction_processed_at` as TIMESTAMP) as `transaction_processed_at` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`transaction_type` as STRING) as `transaction_type` ,
                    cast(`transaction_amount` as FLOAT64) as `transaction_amount` ,
                    cast(`transaction_fee` as FLOAT64) as `transaction_fee` ,
                    cast(`settlement_id` as STRING) as `settlement_id` ,
                    cast(`settlement_date` as DATE) as `settlement_date` ,
                    cast(`rebuild_timestamp` as TIMESTAMP) as `rebuild_timestamp` ,
                    cast(null as STRING) as `balance_transaction_id` ,
                    cast(null as STRING) as `created` ,
                    cast(null as STRING) as `available_on_utc` ,
                    cast(null as STRING) as `available_on` ,
                    cast(null as STRING) as `base_currency` ,
                    cast(null as NUMERIC) as `transaction_base_amount` ,
                    cast(null as NUMERIC) as `_raw_fee` ,
                    cast(null as NUMERIC) as `transaction_fee_base_amount` ,
                    cast(null as NUMERIC) as `_raw_net` ,
                    cast(null as STRING) as `description` ,
                    cast(null as STRING) as `customer_facing_amount` ,
                    cast(null as STRING) as `customer_facing_currency` ,
                    cast(null as STRING) as `regulatory_tag` ,
                    cast(null as STRING) as `automatic_payout_effective_at_utc` ,
                    cast(null as STRING) as `customer_id` ,
                    cast(null as STRING) as `customer_name` ,
                    cast(null as STRING) as `customer_description` ,
                    cast(null as STRING) as `shipping_address_line1` ,
                    cast(null as STRING) as `shipping_address_line2` ,
                    cast(null as STRING) as `shipping_address_city` ,
                    cast(null as STRING) as `shipping_address_state` ,
                    cast(null as STRING) as `shipping_address_postal_code` ,
                    cast(null as STRING) as `shipping_address_country` ,
                    cast(null as STRING) as `payment_intent_id` ,
                    cast(null as STRING) as `charge_created_utc` ,
                    cast(null as STRING) as `charge_created` ,
                    cast(null as STRING) as `_raw_invoice_id` ,
                    cast(null as STRING) as `subscription_id` ,
                    cast(null as STRING) as `payment_method_type` ,
                    cast(null as STRING) as `card_brand` ,
                    cast(null as STRING) as `card_funding` ,
                    cast(null as STRING) as `card_country` ,
                    cast(null as STRING) as `statement_descriptor` ,
                    cast(null as STRING) as `dispute_reason` ,
                    cast(null as STRING) as `connected_account_id` ,
                    cast(null as STRING) as `connected_account_name` ,
                    cast(null as STRING) as `connected_account_country` ,
                    cast(null as STRING) as `file_name` ,
                    cast(null as TIMESTAMP) as `file_time` ,
                    cast(null as STRING) as `payment_id` ,
                    cast(null as TIMESTAMP) as `payment_processed_at` ,
                    cast(null as NUMERIC) as `payment_base_amount` ,
                    cast(null as NUMERIC) as `payment_fee_base_amount` ,
                    cast(null as STRING) as `refund_id` ,
                    cast(null as TIMESTAMP) as `refund_processed_at` ,
                    cast(null as NUMERIC) as `refund_base_amount` ,
                    cast(null as NUMERIC) as `refund_fee_base_amount` ,
                    cast(null as STRING) as `chargeback_id` ,
                    cast(null as TIMESTAMP) as `chargeback_processed_at` ,
                    cast(null as NUMERIC) as `chargeback_base_amount` ,
                    cast(null as NUMERIC) as `chargeback_fee_base_amount` ,
                    cast(null as NUMERIC) as `conversion_rate` ,
                    cast(null as NUMERIC) as `payment_amount` ,
                    cast(null as NUMERIC) as `payment_fee` ,
                    cast(null as NUMERIC) as `refund_amount` ,
                    cast(null as NUMERIC) as `refund_fee` ,
                    cast(null as NUMERIC) as `chargeback_amount` ,
                    cast(null as NUMERIC) as `chargeback_fee` 

            from `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_paypal_consignor_transactions`
        )

        union all
        

        (
            select

                cast('`ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stripe_transactions`' as 
    string
) as _dbt_source_relation,
                
                    cast(`invoice_id` as STRING) as `invoice_id` ,
                    cast(`consignor_email` as STRING) as `consignor_email` ,
                    cast(`transaction_channel` as STRING) as `transaction_channel` ,
                    cast(`transaction_id` as STRING) as `transaction_id` ,
                    cast(`transaction_event` as STRING) as `transaction_event` ,
                    cast(`transaction_processed_at` as TIMESTAMP) as `transaction_processed_at` ,
                    cast(`transaction_date` as DATE) as `transaction_date` ,
                    cast(`transaction_type` as STRING) as `transaction_type` ,
                    cast(`transaction_amount` as FLOAT64) as `transaction_amount` ,
                    cast(`transaction_fee` as FLOAT64) as `transaction_fee` ,
                    cast(`settlement_id` as STRING) as `settlement_id` ,
                    cast(`settlement_date` as DATE) as `settlement_date` ,
                    cast(null as TIMESTAMP) as `rebuild_timestamp` ,
                    cast(`balance_transaction_id` as STRING) as `balance_transaction_id` ,
                    cast(`created` as STRING) as `created` ,
                    cast(`available_on_utc` as STRING) as `available_on_utc` ,
                    cast(`available_on` as STRING) as `available_on` ,
                    cast(`base_currency` as STRING) as `base_currency` ,
                    cast(`transaction_base_amount` as NUMERIC) as `transaction_base_amount` ,
                    cast(`_raw_fee` as NUMERIC) as `_raw_fee` ,
                    cast(`transaction_fee_base_amount` as NUMERIC) as `transaction_fee_base_amount` ,
                    cast(`_raw_net` as NUMERIC) as `_raw_net` ,
                    cast(`description` as STRING) as `description` ,
                    cast(`customer_facing_amount` as STRING) as `customer_facing_amount` ,
                    cast(`customer_facing_currency` as STRING) as `customer_facing_currency` ,
                    cast(`regulatory_tag` as STRING) as `regulatory_tag` ,
                    cast(`automatic_payout_effective_at_utc` as STRING) as `automatic_payout_effective_at_utc` ,
                    cast(`customer_id` as STRING) as `customer_id` ,
                    cast(`customer_name` as STRING) as `customer_name` ,
                    cast(`customer_description` as STRING) as `customer_description` ,
                    cast(`shipping_address_line1` as STRING) as `shipping_address_line1` ,
                    cast(`shipping_address_line2` as STRING) as `shipping_address_line2` ,
                    cast(`shipping_address_city` as STRING) as `shipping_address_city` ,
                    cast(`shipping_address_state` as STRING) as `shipping_address_state` ,
                    cast(`shipping_address_postal_code` as STRING) as `shipping_address_postal_code` ,
                    cast(`shipping_address_country` as STRING) as `shipping_address_country` ,
                    cast(`payment_intent_id` as STRING) as `payment_intent_id` ,
                    cast(`charge_created_utc` as STRING) as `charge_created_utc` ,
                    cast(`charge_created` as STRING) as `charge_created` ,
                    cast(`_raw_invoice_id` as STRING) as `_raw_invoice_id` ,
                    cast(`subscription_id` as STRING) as `subscription_id` ,
                    cast(`payment_method_type` as STRING) as `payment_method_type` ,
                    cast(`card_brand` as STRING) as `card_brand` ,
                    cast(`card_funding` as STRING) as `card_funding` ,
                    cast(`card_country` as STRING) as `card_country` ,
                    cast(`statement_descriptor` as STRING) as `statement_descriptor` ,
                    cast(`dispute_reason` as STRING) as `dispute_reason` ,
                    cast(`connected_account_id` as STRING) as `connected_account_id` ,
                    cast(`connected_account_name` as STRING) as `connected_account_name` ,
                    cast(`connected_account_country` as STRING) as `connected_account_country` ,
                    cast(`file_name` as STRING) as `file_name` ,
                    cast(`file_time` as TIMESTAMP) as `file_time` ,
                    cast(`payment_id` as STRING) as `payment_id` ,
                    cast(`payment_processed_at` as TIMESTAMP) as `payment_processed_at` ,
                    cast(`payment_base_amount` as NUMERIC) as `payment_base_amount` ,
                    cast(`payment_fee_base_amount` as NUMERIC) as `payment_fee_base_amount` ,
                    cast(`refund_id` as STRING) as `refund_id` ,
                    cast(`refund_processed_at` as TIMESTAMP) as `refund_processed_at` ,
                    cast(`refund_base_amount` as NUMERIC) as `refund_base_amount` ,
                    cast(`refund_fee_base_amount` as NUMERIC) as `refund_fee_base_amount` ,
                    cast(`chargeback_id` as STRING) as `chargeback_id` ,
                    cast(`chargeback_processed_at` as TIMESTAMP) as `chargeback_processed_at` ,
                    cast(`chargeback_base_amount` as NUMERIC) as `chargeback_base_amount` ,
                    cast(`chargeback_fee_base_amount` as NUMERIC) as `chargeback_fee_base_amount` ,
                    cast(`conversion_rate` as NUMERIC) as `conversion_rate` ,
                    cast(`payment_amount` as NUMERIC) as `payment_amount` ,
                    cast(`payment_fee` as NUMERIC) as `payment_fee` ,
                    cast(`refund_amount` as NUMERIC) as `refund_amount` ,
                    cast(`refund_fee` as NUMERIC) as `refund_fee` ,
                    cast(`chargeback_amount` as NUMERIC) as `chargeback_amount` ,
                    cast(`chargeback_fee` as NUMERIC) as `chargeback_fee` 

            from `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stripe_transactions`
        )

        

), final AS (

  SELECT
      invoice_id
    , consignor_email
    , transaction_channel
    , transaction_id
    , transaction_event
    , transaction_processed_at
    , transaction_date
    , transaction_type
    , transaction_amount
    , transaction_fee
    , settlement_id
    , settlement_date
    , current_timestamp AS rebuild_timestamp
  FROM consignor_transactions

)

SELECT * FROM final
  );
    