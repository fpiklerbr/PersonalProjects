

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stripe_transactions`
  OPTIONS()
  as WITH transactions AS (

  SELECT
        stripe_transactions.`settlement_id`,
  stripe_transactions.`settlement_date`,
  stripe_transactions.`balance_transaction_id`,
  stripe_transactions.`transaction_processed_at`,
  stripe_transactions.`transaction_date`,
  stripe_transactions.`created`,
  stripe_transactions.`available_on_utc`,
  stripe_transactions.`available_on`,
  stripe_transactions.`base_currency`,
  stripe_transactions.`transaction_base_amount`,
  stripe_transactions.`transaction_type`,
  stripe_transactions.`transaction_channel`,
  stripe_transactions.`_raw_fee`,
  stripe_transactions.`transaction_fee_base_amount`,
  stripe_transactions.`_raw_net`,
  stripe_transactions.`transaction_event`,
  stripe_transactions.`transaction_id`,
  stripe_transactions.`description`,
  stripe_transactions.`customer_facing_amount`,
  stripe_transactions.`customer_facing_currency`,
  stripe_transactions.`regulatory_tag`,
  stripe_transactions.`automatic_payout_effective_at_utc`,
  stripe_transactions.`customer_id`,
  stripe_transactions.`consignor_email`,
  stripe_transactions.`customer_name`,
  stripe_transactions.`customer_description`,
  stripe_transactions.`shipping_address_line1`,
  stripe_transactions.`shipping_address_line2`,
  stripe_transactions.`shipping_address_city`,
  stripe_transactions.`shipping_address_state`,
  stripe_transactions.`shipping_address_postal_code`,
  stripe_transactions.`shipping_address_country`,
  stripe_transactions.`invoice_id`,
  stripe_transactions.`payment_intent_id`,
  stripe_transactions.`charge_created_utc`,
  stripe_transactions.`charge_created`,
  stripe_transactions.`_raw_invoice_id`,
  stripe_transactions.`subscription_id`,
  stripe_transactions.`payment_method_type`,
  stripe_transactions.`card_brand`,
  stripe_transactions.`card_funding`,
  stripe_transactions.`card_country`,
  stripe_transactions.`statement_descriptor`,
  stripe_transactions.`dispute_reason`,
  stripe_transactions.`connected_account_id`,
  stripe_transactions.`connected_account_name`,
  stripe_transactions.`connected_account_country`,
  stripe_transactions.`file_name`,
  stripe_transactions.`file_time`


      , CASE
          WHEN stripe_transactions.transaction_type = 'Payment'
          THEN stripe_transactions.transaction_id
        END AS payment_id

      , CASE
          WHEN stripe_transactions.transaction_type = 'Payment'
          THEN stripe_transactions.transaction_processed_at
        END AS payment_processed_at

      , CASE
          WHEN stripe_transactions.transaction_type = 'Payment'
          THEN stripe_transactions.transaction_base_amount
        END AS payment_base_amount

      , CASE
          WHEN stripe_transactions.transaction_type = 'Payment'
          THEN stripe_transactions.transaction_fee_base_amount
        END AS payment_fee_base_amount



      , CASE
          WHEN stripe_transactions.transaction_type = 'Refund'
          THEN stripe_transactions.transaction_id
        END AS refund_id

      , CASE
          WHEN stripe_transactions.transaction_type = 'Refund'
          THEN stripe_transactions.transaction_processed_at
        END AS refund_processed_at

      , CASE
          WHEN stripe_transactions.transaction_type = 'Refund'
          THEN stripe_transactions.transaction_base_amount * -1
        END AS refund_base_amount

      , CASE
          WHEN stripe_transactions.transaction_type = 'Refund'
          THEN stripe_transactions.transaction_fee_base_amount
        END AS refund_fee_base_amount



      , CASE
          WHEN stripe_transactions.transaction_type = 'Chargeback'
          THEN stripe_transactions.transaction_id
        END AS chargeback_id

      , CASE
          WHEN stripe_transactions.transaction_type = 'Chargeback'
          THEN stripe_transactions.transaction_processed_at
        END AS chargeback_processed_at

      , CASE
          WHEN stripe_transactions.transaction_type = 'Chargeback'
          THEN stripe_transactions.transaction_base_amount
        END AS chargeback_base_amount

      , CASE
          WHEN stripe_transactions.transaction_type = 'Chargeback'
          THEN stripe_transactions.transaction_fee_base_amount
        END AS chargeback_fee_base_amount


    , CASE
        WHEN stripe_transactions.base_currency = 'USD'
        THEN 1.0
        ELSE cast(exchange_rates.in_usd AS numeric)
      END AS conversion_rate
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`stripe__payout_reconciliation_reports` AS stripe_transactions
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_forex_daily_exchange_rates` AS exchange_rates
    ON stripe_transactions.base_currency = exchange_rates.currency
    AND stripe_transactions.transaction_date = exchange_rates.transaction_date
  WHERE stripe_transactions.transaction_type IN ('Payment', 'Refund', 'Chargeback') -- excludes SG&A

)

SELECT
    *
  , conversion_rate * transaction_base_amount AS transaction_amount
  , conversion_rate * transaction_fee_base_amount AS transaction_fee

  , conversion_rate * payment_base_amount AS payment_amount
  , conversion_rate * payment_fee_base_amount AS payment_fee

  , conversion_rate * refund_base_amount AS refund_amount
  , conversion_rate * refund_fee_base_amount AS refund_fee

  , conversion_rate * chargeback_base_amount AS chargeback_amount
  , conversion_rate * chargeback_fee_base_amount AS chargeback_fee

FROM transactions;

