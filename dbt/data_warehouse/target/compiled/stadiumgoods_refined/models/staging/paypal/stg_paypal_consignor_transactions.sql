WITH invoices AS (

  SELECT
      invoice_id
    , string_agg(DISTINCT payer_account_id, ', ') AS consignor_email
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`paypal__transactions`
  WHERE item_name LIKE '%' || invoice_id || '%'
  GROUP BY 1

), final AS (

  SELECT
      invoices.invoice_id
    , invoices.consignor_email
    , cast('Paypal' AS string ) AS transaction_channel
    , transactions.transaction_id
    , transactions.transaction_event
    , coalesce(transactions.payment_processed_at,transactions.refund_processed_at) AS transaction_processed_at
    , safe_cast(datetime(safe_cast(coalesce(transactions.payment_processed_at,transactions.refund_processed_at) AS timestamp), 'America/New_York') AS date) AS transaction_date
    , CASE WHEN transactions.transaction_description = 'DR' THEN 'Refund' ELSE 'Payment' END AS transaction_type
    , CASE WHEN transactions.transaction_description = 'DR' THEN -1 * transactions.refund_amount
            ELSE transactions.payment_amount
            END AS transaction_amount
    , coalesce(transactions.payment_fee, transactions.refund_fee) AS transaction_fee
    , transactions.settlement_id
    , transactions.settlement_date
    , current_timestamp rebuild_timestamp
  FROM invoices
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_paypal_all_transactions` AS transactions
    ON invoices.invoice_id = transactions.invoice_id

)

SELECT * FROM final