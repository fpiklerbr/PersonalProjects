

WITH invoices_and_serials_by_request AS (

  SELECT
      serials.ether_fms_payout_request_id
    , string_agg(DISTINCT invoices.invoice_number, ', ') AS invoice_numbers
    , string_agg(DISTINCT serials.serial_number, ', ') AS serial_numbers
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_fms_payout_request_items` AS serials
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_fms_payout_invoices` AS invoices
    ON serials.ether_fms_payout_invoice_id = invoices.ether_fms_payout_invoice_id
  GROUP BY 1

), payments_by_request AS (

  SELECT
      ether_fms_payout_request_id
    , string_agg(DISTINCT cast(ether_fms_payout_payment_id AS string), ',') AS ether_fms_payout_payment_id
    , string_agg(DISTINCT third_party_identifier, ',') AS third_party_identifier
    , string_agg(DISTINCT payment_status, ',') AS payment_status
    , string_agg(DISTINCT payment_token, ',') AS payment_token
    , min(submitted_to_provider_at) AS submitted_to_provider_at
    , min(payout_date) AS payout_date
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_fms_payout_payments`
  GROUP BY 1

), final AS (

  SELECT
    payout_requests.`ether_fms_payout_request_id`,
  payout_requests.`payout_request_date`,
  payout_requests.`updated_at`,
  payout_requests.`user_id`,
  payout_requests.`pay_method`,
  payout_requests.`payout_request_status`,
  payout_requests.`bank_account_id`,
  payout_requests.`item_count`,
  payout_requests.`base_currency`,
  payout_requests.`gross_payout_base_amount`,
  payout_requests.`fee_base_amount`,
  payout_requests.`net_payout_base_amount`,
  payout_requests.`paid_out_at`,
  payout_requests.`sla_deadline`,
  payout_requests.`is_new_payout_flow`,
  payout_requests.`lock_version`,
  payout_requests.`max_payment_attempts`,
  payout_requests.`_synched_from_source_at`
  , coalesce(payout_requests.consignor_id, users.consignor_id) AS consignor_id
  , payout_requests.created_at AS payout_requested_at
  , 
  CASE WHEN payout_requests.base_currency = 'USD' THEN 1.0 ELSE cast(price_conversion.in_usd AS numeric) END AS conversion_rate
  , coalesce(payments_by_request.payout_date, payout_requests.payout_request_date) AS conversion_date
  , round(payout_requests.gross_payout_base_amount * 
  CASE WHEN payout_requests.base_currency = 'USD' THEN 1.0 ELSE cast(price_conversion.in_usd AS numeric) END, 2) AS gross_payout
  , round(payout_requests.fee_base_amount * 
  CASE WHEN payout_requests.base_currency = 'USD' THEN 1.0 ELSE cast(price_conversion.in_usd AS numeric) END, 2) AS fee
  , round(payout_requests.net_payout_base_amount * 
  CASE WHEN payout_requests.base_currency = 'USD' THEN 1.0 ELSE cast(price_conversion.in_usd AS numeric) END, 2) AS net_payout
  , users.full_name AS profile_names
  , invoices_and_serials_by_request.invoice_numbers
  , invoices_and_serials_by_request.serial_numbers
  , payments_by_request.ether_fms_payout_payment_id
  , payments_by_request.third_party_identifier
  , payments_by_request.submitted_to_provider_at
  , payments_by_request.payment_status
  , payments_by_request.payment_token
  , payments_by_request.payout_date
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__ether_fms_payout_requests` AS payout_requests
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_seller_portal_users` AS users
    ON payout_requests.user_id = users.user_id
  LEFT JOIN payments_by_request
    ON payout_requests.ether_fms_payout_request_id = payments_by_request.ether_fms_payout_request_id
  LEFT JOIN invoices_and_serials_by_request
    ON payout_requests.ether_fms_payout_request_id = invoices_and_serials_by_request.ether_fms_payout_request_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_forex_daily_exchange_rates` AS price_conversion -- at most one to one
    ON  payout_requests.base_currency = price_conversion.currency
    AND coalesce(payments_by_request.payout_date, payout_requests.payout_request_date) = price_conversion.transaction_date

)

SELECT * FROM final