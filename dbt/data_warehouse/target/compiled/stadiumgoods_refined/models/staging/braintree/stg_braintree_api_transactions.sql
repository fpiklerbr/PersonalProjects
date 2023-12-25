

  SELECT
      transaction_id
    , mag_order_id
    , CAST((
        CASE
          WHEN 


  regexp_contains(customer, r'(?i)5thave.bingheng@borderxlab.com')

 THEN 'Beyond'
          WHEN payment_instrument_type = 'paypal_account' THEN 'Braintree (Paypal)'
          WHEN payment_instrument_type = 'apple_pay_card' THEN 'Braintree (Apple Pay)'
          ELSE 'Braintree'
        END
      ) AS string) AS channel_or_gateway
    , CAST('Braintree API' AS string) AS data_source
    , transaction_state
    , checkout_status
    , transaction_description
    , payment_amount
    , payment_processed_at
    , CAST(NULL AS float64) AS payment_fee
    , refund_amount
    , refund_processed_at
    , CAST(NULL AS float64) AS refund_fee
    , settlement_date
    , file_time
    , settlement_id
    , CASE transaction_type
        WHEN 'sale'   THEN (JSON_EXTRACT_SCALAR(paypal_details, '$.capture_id'
  ))

        WHEN 'credit' THEN (JSON_EXTRACT_SCALAR(paypal_details, '$.refund_id'
  ))

        END AS paypal_transaction_id
    , CASE WHEN (paypal_details IS NOT NULL AND transaction_type = 'sale')
        THEN -1 END
        * CAST(
        (
        coalesce(
    safe_cast(JSON_EXTRACT_SCALAR(paypal_details, '$.transaction_fee_amount'
  ) as float64)
, 0)
        - coalesce(
    safe_cast(JSON_EXTRACT_SCALAR(paypal_details, '$.refund_from_transaction_fee_amount'
  ) as float64)
, 0)
        )
        AS float64) AS payment_paypal_transaction_fee
    , CASE WHEN (paypal_details IS NOT NULL AND transaction_type = 'credit')
        THEN -1 END
        * CAST(
        (
        coalesce(
    safe_cast(JSON_EXTRACT_SCALAR(paypal_details, '$.transaction_fee_amount'
  ) as float64)
, 0)
        - coalesce(
    safe_cast(JSON_EXTRACT_SCALAR(paypal_details, '$.refund_from_transaction_fee_amount'
  ) as float64)
, 0)
        )
        AS float64) AS refund_paypal_transaction_fee
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`braintree__orders`