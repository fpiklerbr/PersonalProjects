SELECT
      dashboard.transaction_id
    , dashboard.mag_order_id
    , api.channel_or_gateway
    , CAST('Braintree Transaction-Level Fee Report' AS string) AS data_source
    , CAST('Settled' AS string) AS transaction_state
    , CAST('Approved' AS string) AS checkout_status
    , dashboard.transaction_description
    , dashboard.payment_amount
    , api.payment_processed_at
    , dashboard.payment_fee
    , dashboard.refund_amount
    , api.refund_processed_at
    , dashboard.refund_fee
    , dashboard.settlement_date
    , dashboard.file_time
    , api_2.settlement_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`braintree__transaction_level_fee_reports` AS dashboard
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_braintree_api_transactions` AS api
    ON dashboard.transaction_id = api.transaction_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_braintree_api_transactions` AS api_2
    ON dashboard.transaction_id = api_2.transaction_id