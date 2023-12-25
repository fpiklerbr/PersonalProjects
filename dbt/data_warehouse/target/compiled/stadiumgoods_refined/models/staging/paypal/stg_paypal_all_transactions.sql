

WITH transaction_events AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_paypal_transaction_events`

), braintree_orders AS (

  SELECT DISTINCT
    mag_order_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_braintree_api_transactions`
  WHERE channel_or_gateway = 'Braintree (Paypal)'

), braintree_transactions AS (

  SELECT DISTINCT
    paypal_transaction_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_braintree_api_transactions`
  WHERE paypal_transaction_id IS NOT NULL

), mag_orders AS (

  SELECT
      transaction_id
    , mag_order_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_paypal_mag_order_id`

), settled_transactions AS (

  SELECT
      transaction_id
    , mag_order_id
    , custom_field
    , payment_processed_at
    , payment_fee
    , payment_amount
    , refund_processed_at
    , refund_fee
    , refund_amount
    , transaction_description
    , transaction_event_code
    , settlement_date
    , file_time
    , CAST('Paypal Settlements' AS string) AS data_source
    , CAST('Settled' AS string) AS transaction_state
    , CAST('Approved' AS string) AS checkout_status
    , settlement_id
    , invoice_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`paypal__settlements` AS paypal

), not_settled_transactions AS (

  SELECT
      transaction_id
    , mag_order_id
    , custom_field
    , payment_processed_at
    , payment_fee
    , payment_amount
    , refund_processed_at
    , refund_fee
    , refund_amount
    , transaction_description
    , transaction_event_code
    , SAFE_CAST(SAFE_CAST(NULL AS datetime) AS date) AS settlement_date
    , file_time
    , CAST('Paypal Transactions' AS string) AS data_source
    , CAST('Not Settled' AS string) AS transaction_state
    , CASE WHEN transactional_status <> 'D' THEN CAST('Approved' AS string) ELSE CAST('Not Approved' AS string) END AS checkout_status
    , CAST(NULL as string) AS settlement_id
    , invoice_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`paypal__transactions` AS paypal
  WHERE NOT EXISTS (SELECT * FROM settled_transactions WHERE transaction_id = paypal.transaction_id)

), approved_transactions AS (

  SELECT *
  FROM not_settled_transactions
  WHERE checkout_status = 'Approved'

), not_approved_transactions AS (

  SELECT *
  FROM not_settled_transactions
  WHERE NOT EXISTS (SELECT * FROM approved_transactions WHERE transaction_id = not_settled_transactions.transaction_id)

), all_transactions AS (

  SELECT *
  FROM settled_transactions
  UNION ALL
  SELECT *
  FROM approved_transactions
  UNION ALL
  SELECT *
  FROM not_approved_transactions

), final AS (

  SELECT
      all_transactions.transaction_id
    , coalesce(mag_orders.mag_order_id, all_transactions.mag_order_id) AS mag_order_id
    , all_transactions.settlement_id
    , all_transactions.invoice_id
    , all_transactions.data_source
    , all_transactions.transaction_state
    , all_transactions.checkout_status
    , all_transactions.payment_processed_at
    , all_transactions.payment_fee
    , all_transactions.payment_amount
    , all_transactions.refund_processed_at
    , all_transactions.refund_fee
    , all_transactions.refund_amount
    , all_transactions.transaction_description
    , coalesce(transaction_events.transaction_event, all_transactions.transaction_event_code) AS transaction_event
    , all_transactions.settlement_date
    , all_transactions.file_time
    , coalesce(
          mag_orders.mag_order_id
        , all_transactions.mag_order_id
      ) IS NOT NULL AS has_mag_order
    , 


  regexp_contains(all_transactions.custom_field, r'(?i)EBAY.*')

 AS is_ebay
    , braintree_transactions.paypal_transaction_id IS NOT NULL
        OR braintree_orders.mag_order_id IS NOT NULL
      AS is_braintree
    , current_timestamp AS rebuild_timestamp
  FROM all_transactions
  LEFT JOIN transaction_events
    ON all_transactions.transaction_event_code = transaction_events.transaction_event_code
  LEFT JOIN mag_orders
    ON all_transactions.transaction_id = mag_orders.transaction_id
  LEFT JOIN braintree_orders
    ON coalesce(mag_orders.mag_order_id, all_transactions.mag_order_id) = braintree_orders.mag_order_id
  LEFT JOIN braintree_transactions
    ON all_transactions.transaction_id = braintree_transactions.paypal_transaction_id

)

SELECT * FROM final