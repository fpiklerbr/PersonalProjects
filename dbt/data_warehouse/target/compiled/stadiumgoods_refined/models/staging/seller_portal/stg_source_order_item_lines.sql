/* TODO: confirm whether or not these are relevant
  , sol.matrix.serial_source
  , sol_matrix.commission_rate
  , sol_matrix.serial_purchase_price
  , sol_matrix.purchase_id
  , sol_matrix.purchase_reference
  , sol_matrix.payout_invoice_id
*/


WITH stripe_payment_intents AS (

  SELECT
      payment_intent_id
    , string_agg(DISTINCT base_currency, ', ') AS transaction_base_currency
    , min(payment_processed_at) AS payment_processed_at
    , string_agg(DISTINCT payment_id, ', ') AS payment_id
    , sum(payment_base_amount) AS payment_total_base_amount
    , sum(payment_amount) AS payment_total_amount
    , sum(payment_fee_base_amount) AS payment_total_fee_base_amount
    , sum(payment_fee) AS payment_total_fee
    , min(refund_processed_at) AS refund_processed_at
    , string_agg(DISTINCT stripe_transactions.refund_id, ', ') AS refund_id
    , sum(refund_base_amount) AS refund_total_base_amount
    , sum(refund_amount) AS refund_total_amount
    , sum(refund_fee_base_amount) AS refund_total_fee_base_amount
    , sum(refund_fee) AS refund_total_fee
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stripe_transactions` AS stripe_transactions
  WHERE payment_intent_id IS NOT NULL
  GROUP BY 1

), transactions_by_bundle AS (

  SELECT
      source_bundle_payments.source_bundle_id
    , source_bundle_payments.stripe_payment_intent_id
    , source_bundle_payments.payment_base_amount AS payment_total_expected_base_amount
    , source_bundle_payments.refunded_at
    , source_bundle_payments.stripe_refund_id
    , nullif(source_bundle_payments.refund_base_amount, 0) AS refund_total_expected_base_amount
    , stripe_payment_intents.transaction_base_currency
    , stripe_payment_intents.payment_id IS NOT NULL AS is_settled
    , stripe_payment_intents.payment_processed_at
    , stripe_payment_intents.payment_id
    , stripe_payment_intents.payment_total_base_amount
    , stripe_payment_intents.payment_total_amount
    , stripe_payment_intents.payment_total_fee_base_amount
    , stripe_payment_intents.payment_total_fee
    , stripe_payment_intents.refund_processed_at
    , stripe_payment_intents.refund_id
    , stripe_payment_intents.refund_total_base_amount
    , stripe_payment_intents.refund_total_amount
    , stripe_payment_intents.refund_total_fee_base_amount
    , stripe_payment_intents.refund_total_fee
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`seller_portal__source_bundle_payments` AS source_bundle_payments
  LEFT JOIN stripe_payment_intents
    ON source_bundle_payments.stripe_payment_intent_id = stripe_payment_intents.payment_intent_id

), currencies_by_bundle AS (

  SELECT
      source_bundle_id
    , string_agg(DISTINCT bundle_item_base_currency, ', ') AS bundle_base_currency
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_source_bundle_item_lines`
  GROUP BY 1

), sold_bundle_item_lines AS (

  SELECT
      substr(
    concat(
    
      coalesce(bundle_item_lines.source_bundle_number|| '-' , '')
    
      , coalesce(bundle_item_lines.source_bundle_item_line|| '-' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(bundle_item_lines.source_bundle_number|| '-' , '')
    
      , coalesce(bundle_item_lines.source_bundle_item_line|| '-' , '')
    
  )) - length('-')
      , 0
    )
) AS order_line_id
    , bundle_item_lines.*
    , bundle_item_lines.bundle_sold_at AS order_created_at
    , safe_cast(datetime(safe_cast(bundle_item_lines.bundle_sold_at AS timestamp), 'America/New_York') AS datetime) AS order_creation_nyc
    , safe_cast(datetime(safe_cast(bundle_item_lines.bundle_sold_at AS timestamp), 'America/New_York') AS date) AS order_date
    , safe_cast(datetime(safe_cast(bundle_item_lines.allocation_fulfilled_at AS timestamp), 'America/New_York') AS date) AS dispatch_date
    , safe_cast(datetime(safe_cast(bundle_item_lines.allocation_fulfilled_at AS timestamp), 'America/New_York') AS date) AS receipt_date
    , currencies_by_bundle.bundle_base_currency
    , (bundle_item_lines.unit_price_base_amount + bundle_item_lines.unit_buyer_commission_paid_base_amount) AS line_item_price_base_amount
    , (bundle_item_lines.unit_price_base_amount - bundle_item_lines.unit_price_paid_base_amount) AS line_item_discount_base_amount
    , (bundle_item_lines.unit_price_paid_base_amount + bundle_item_lines.unit_buyer_commission_paid_base_amount) AS expected_line_item_price_paid_base_amount
    , cast(0 AS numeric) AS line_item_store_credit_applied_base_amount
    , cast(0 AS numeric) AS line_item_tax_base_amount
    , cast(0 AS numeric) AS line_shipping_price_base_amount
    , cast(0 AS numeric) AS line_shipping_discount_base_amount
    , cast(0 AS numeric) AS line_shipping_store_credit_applied_base_amount
    , cast(0 AS numeric) AS line_shipping_tax_base_amount
    , sum(bundle_item_lines.unit_sold_quantity) OVER (PARTITION BY bundle_item_lines.source_bundle_number) AS total_order_lines
    , transactions_by_bundle.stripe_payment_intent_id
    , transactions_by_bundle.payment_total_expected_base_amount
    , CASE
        WHEN transactions_by_bundle.is_settled IS TRUE
        THEN cast('Settled' AS string)
        ELSE cast('Not Settled' AS string)
      END AS transaction_state
    , transactions_by_bundle.transaction_base_currency
    , coalesce(transactions_by_bundle.payment_id, transactions_by_bundle.stripe_payment_intent_id) AS payment_id
    , transactions_by_bundle.payment_processed_at
    , transactions_by_bundle.payment_total_base_amount
    , transactions_by_bundle.payment_total_amount
    , transactions_by_bundle.payment_total_fee_base_amount
    , transactions_by_bundle.payment_total_fee
    , transactions_by_bundle.refunded_at IS NOT NULL AND bundle_item_lines.allocation_fulfilled_at IS NULL AS unit_is_refunded
    , CASE WHEN transactions_by_bundle.refunded_at IS NOT NULL AND bundle_item_lines.allocation_fulfilled_at IS NULL THEN transactions_by_bundle.refunded_at END AS refunded_at
    , CASE
        WHEN transactions_by_bundle.refunded_at IS NOT NULL AND bundle_item_lines.allocation_fulfilled_at IS NULL
        THEN safe_cast(datetime(safe_cast(transactions_by_bundle.refunded_at AS timestamp), 'America/New_York') AS datetime)
      END AS refund_timestamp_nyc
    , CASE WHEN transactions_by_bundle.refunded_at IS NOT NULL AND bundle_item_lines.allocation_fulfilled_at IS NULL THEN transactions_by_bundle.refund_total_expected_base_amount END AS refund_total_expected_base_amount
    , CASE WHEN transactions_by_bundle.refunded_at IS NOT NULL AND bundle_item_lines.allocation_fulfilled_at IS NULL THEN coalesce(transactions_by_bundle.refund_id, transactions_by_bundle.stripe_refund_id) END AS refund_id
    , CASE WHEN transactions_by_bundle.refunded_at IS NOT NULL AND bundle_item_lines.allocation_fulfilled_at IS NULL THEN transactions_by_bundle.refund_processed_at END AS refund_processed_at
    , CASE WHEN transactions_by_bundle.refunded_at IS NOT NULL AND bundle_item_lines.allocation_fulfilled_at IS NULL THEN transactions_by_bundle.refund_total_amount END AS refund_total_base_amount
    , CASE WHEN transactions_by_bundle.refunded_at IS NOT NULL AND bundle_item_lines.allocation_fulfilled_at IS NULL THEN transactions_by_bundle.refund_total_amount END AS refund_total_amount
    , CASE WHEN transactions_by_bundle.refunded_at IS NOT NULL AND bundle_item_lines.allocation_fulfilled_at IS NULL THEN transactions_by_bundle.refund_total_fee END AS refund_total_fee_base_amount
    , CASE WHEN transactions_by_bundle.refunded_at IS NOT NULL AND bundle_item_lines.allocation_fulfilled_at IS NULL THEN transactions_by_bundle.refund_total_fee END AS refund_total_fee
    , CASE WHEN transactions_by_bundle.refunded_at IS NOT NULL AND bundle_item_lines.allocation_fulfilled_at IS NULL THEN bundle_item_lines.unit_sold_quantity END AS unit_refunded_quantity
    , CASE WHEN transactions_by_bundle.refunded_at IS NOT NULL AND bundle_item_lines.allocation_fulfilled_at IS NULL THEN bundle_item_lines.unit_price_paid_base_amount END AS unit_price_refunded_base_amount
    , CASE WHEN transactions_by_bundle.refunded_at IS NOT NULL AND bundle_item_lines.allocation_fulfilled_at IS NULL THEN bundle_item_lines.unit_buyer_commission_paid_base_amount END AS unit_buyer_commission_refunded_base_amount
    , CASE WHEN transactions_by_bundle.refunded_at IS NOT NULL AND bundle_item_lines.allocation_fulfilled_at IS NULL THEN bundle_item_lines.unit_seller_commission_payable_base_amount END AS unit_seller_commission_refundable_base_amount
    , coalesce(transactions_by_bundle.transaction_base_currency, currencies_by_bundle.bundle_base_currency) AS order_base_currency
    , safe_cast(datetime(safe_cast(coalesce(transactions_by_bundle.payment_processed_at, bundle_item_lines.bundle_sold_at) AS timestamp), 'America/New_York') AS date) AS currency_conversion_date
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_source_bundle_item_lines` AS bundle_item_lines
  INNER JOIN transactions_by_bundle
    ON bundle_item_lines.source_bundle_id = transactions_by_bundle.source_bundle_id
  INNER JOIN currencies_by_bundle
    ON bundle_item_lines.source_bundle_id = currencies_by_bundle.source_bundle_id

), currency_conversion AS (

  SELECT
      sold_bundle_item_lines.*
    , CASE
  WHEN sold_bundle_item_lines.order_base_currency = 'USD'
  THEN 1.0
  ELSE cast(exchange_rates.in_usd AS numeric)
END AS currency_conversion_rate

    , CASE
  WHEN sold_bundle_item_lines.order_base_currency = 'USD'
  THEN 1.0
  ELSE cast(exchange_rates.in_usd AS numeric)
END * unit_price_base_amount AS unit_price

    , CASE
  WHEN sold_bundle_item_lines.order_base_currency = 'USD'
  THEN 1.0
  ELSE cast(exchange_rates.in_usd AS numeric)
END * unit_buyer_commission_base_amount AS unit_buyer_commission

    , CASE
  WHEN sold_bundle_item_lines.order_base_currency = 'USD'
  THEN 1.0
  ELSE cast(exchange_rates.in_usd AS numeric)
END * unit_seller_commission_base_amount AS unit_seller_commission

    , CASE
  WHEN sold_bundle_item_lines.order_base_currency = 'USD'
  THEN 1.0
  ELSE cast(exchange_rates.in_usd AS numeric)
END * unit_price_paid_base_amount AS unit_price_paid

    , CASE
  WHEN sold_bundle_item_lines.order_base_currency = 'USD'
  THEN 1.0
  ELSE cast(exchange_rates.in_usd AS numeric)
END * unit_buyer_commission_paid_base_amount AS unit_buyer_commission_paid

    , CASE
  WHEN sold_bundle_item_lines.order_base_currency = 'USD'
  THEN 1.0
  ELSE cast(exchange_rates.in_usd AS numeric)
END * unit_seller_commission_payable_base_amount AS unit_seller_commission_payable

    , CASE
  WHEN sold_bundle_item_lines.order_base_currency = 'USD'
  THEN 1.0
  ELSE cast(exchange_rates.in_usd AS numeric)
END * unit_price_refunded_base_amount AS unit_price_refunded

    , CASE
  WHEN sold_bundle_item_lines.order_base_currency = 'USD'
  THEN 1.0
  ELSE cast(exchange_rates.in_usd AS numeric)
END * unit_buyer_commission_refunded_base_amount AS unit_buyer_commission_refunded

    , CASE
  WHEN sold_bundle_item_lines.order_base_currency = 'USD'
  THEN 1.0
  ELSE cast(exchange_rates.in_usd AS numeric)
END * unit_seller_commission_refundable_base_amount AS unit_seller_commission_refundable

    , CASE
  WHEN sold_bundle_item_lines.order_base_currency = 'USD'
  THEN 1.0
  ELSE cast(exchange_rates.in_usd AS numeric)
END * line_item_price_base_amount AS line_item_price

    , CASE
  WHEN sold_bundle_item_lines.order_base_currency = 'USD'
  THEN 1.0
  ELSE cast(exchange_rates.in_usd AS numeric)
END * line_item_discount_base_amount AS line_item_discount

    , CASE
  WHEN sold_bundle_item_lines.order_base_currency = 'USD'
  THEN 1.0
  ELSE cast(exchange_rates.in_usd AS numeric)
END * expected_line_item_price_paid_base_amount AS expected_line_item_price_paid

    , CASE
  WHEN sold_bundle_item_lines.order_base_currency = 'USD'
  THEN 1.0
  ELSE cast(exchange_rates.in_usd AS numeric)
END * line_item_store_credit_applied_base_amount AS line_item_store_credit_applied

    , CASE
  WHEN sold_bundle_item_lines.order_base_currency = 'USD'
  THEN 1.0
  ELSE cast(exchange_rates.in_usd AS numeric)
END * line_item_tax_base_amount AS line_item_tax

    , CASE
  WHEN sold_bundle_item_lines.order_base_currency = 'USD'
  THEN 1.0
  ELSE cast(exchange_rates.in_usd AS numeric)
END * line_shipping_price_base_amount AS line_shipping_price

    , CASE
  WHEN sold_bundle_item_lines.order_base_currency = 'USD'
  THEN 1.0
  ELSE cast(exchange_rates.in_usd AS numeric)
END * line_shipping_discount_base_amount AS line_shipping_discount

    , CASE
  WHEN sold_bundle_item_lines.order_base_currency = 'USD'
  THEN 1.0
  ELSE cast(exchange_rates.in_usd AS numeric)
END * line_shipping_store_credit_applied_base_amount AS line_shipping_store_credit_applied

    , CASE
  WHEN sold_bundle_item_lines.order_base_currency = 'USD'
  THEN 1.0
  ELSE cast(exchange_rates.in_usd AS numeric)
END * line_shipping_tax_base_amount AS line_shipping_tax

    , CASE
  WHEN sold_bundle_item_lines.order_base_currency = 'USD'
  THEN 1.0
  ELSE cast(exchange_rates.in_usd AS numeric)
END * payment_total_expected_base_amount AS payment_total_expected

    , CASE
  WHEN sold_bundle_item_lines.order_base_currency = 'USD'
  THEN 1.0
  ELSE cast(exchange_rates.in_usd AS numeric)
END * refund_total_expected_base_amount AS refund_total_expected

  FROM sold_bundle_item_lines
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_forex_daily_exchange_rates` AS exchange_rates
    ON sold_bundle_item_lines.order_base_currency = exchange_rates.currency
    AND sold_bundle_item_lines.currency_conversion_date = exchange_rates.transaction_date

), final AS (

  SELECT
    currency_conversion.*
  , sp_serials.base_currency AS serial_base_currency
  , sp_serials.cost_base_amount AS serial_cost_base_amount
  , sp_serials.cost AS serial_cost
  , sp_serials.price_base_amount AS serial_price_base_amount
  , sp_serials.price AS serial_price
  , CASE
      WHEN currency_conversion.allocation_fulfilled_at IS NOT NULL
      THEN sp_serials.base_currency
      ELSE currency_conversion.order_base_currency
    END AS order_serial_base_currency
  , CASE
  WHEN currency_conversion.allocation_fulfilled_at IS NOT NULL
  THEN sp_serials.price_base_amount
  ELSE currency_conversion.unit_price_base_amount
END AS order_serial_price_base_amount
  , CASE
  WHEN currency_conversion.allocation_fulfilled_at IS NOT NULL
  THEN sp_serials.price
  ELSE currency_conversion.unit_price
END AS order_serial_price
  , CASE
      WHEN CASE
  WHEN currency_conversion.allocation_fulfilled_at IS NOT NULL
  THEN sp_serials.price_base_amount
  ELSE currency_conversion.unit_price_base_amount
END <> seller_serial_price_history.price_base_amount
      THEN seller_serial_price_history.price_base_amount
      ELSE seller_serial_price_history.previous_price_base_amount
    END AS order_serial_previous_price_base_amount
  , CASE
      WHEN CASE
  WHEN currency_conversion.allocation_fulfilled_at IS NOT NULL
  THEN sp_serials.price
  ELSE currency_conversion.unit_price
END <> seller_serial_price_history.price
      THEN seller_serial_price_history.price
      ELSE seller_serial_price_history.previous_price
    END AS order_serial_previous_price
  , CASE
      WHEN CASE
  WHEN currency_conversion.allocation_fulfilled_at IS NOT NULL
  THEN sp_serials.price
  ELSE currency_conversion.unit_price
END <> seller_serial_price_history.price
      THEN coalesce(currency_conversion.allocation_fulfilled_at, currency_conversion.bundle_sold_at)
      ELSE
        CASE
          WHEN seller_serial_price_history.previous_price IS NOT NULL
          THEN seller_serial_price_history.valid_from
        END
    END AS order_serial_price_changed_at
  , CASE
      WHEN currency_conversion.inventory_relationship = '1P' AND sp_serials.base_currency IS NOT NULL
      THEN sp_serials.base_currency
      ELSE currency_conversion.bundle_item_base_currency
    END AS inventory_base_currency
  , CASE
      WHEN currency_conversion.inventory_relationship = '1P'
      THEN
        CASE
          WHEN currency_conversion.unit_is_refunded IS TRUE
          THEN 0
          ELSE coalesce(
              sp_serials.cost_base_amount
            , currency_conversion.unit_price_paid_base_amount - currency_conversion.unit_seller_commission_payable_base_amount
          )
        END
      ELSE
        (currency_conversion.unit_price_paid_base_amount - coalesce(currency_conversion.unit_price_refunded_base_amount, 0))
        - (currency_conversion.unit_seller_commission_payable_base_amount - coalesce(currency_conversion.unit_seller_commission_refundable_base_amount, 0))
    END AS inventory_cost_base_amount
  , CASE
      WHEN currency_conversion.inventory_relationship = '1P'
      THEN
        CASE
          WHEN currency_conversion.unit_is_refunded IS TRUE
          THEN 0
          ELSE coalesce(
              sp_serials.cost
            , currency_conversion.unit_price_paid - currency_conversion.unit_seller_commission_payable
          )
        END
      ELSE
        (currency_conversion.unit_price_paid - coalesce(currency_conversion.unit_price_refunded, 0))
        - (currency_conversion.unit_seller_commission_payable - coalesce(currency_conversion.unit_seller_commission_refundable, 0))
    END AS inventory_cost
  , CASE
      WHEN sp_serials.source_bundle_number = currency_conversion.source_bundle_number
      THEN TRUE
      ELSE FALSE
    END AS serial_order_match
  , buyers.consignor_id AS buyer_consignor_id
  , buyers.inventory_relationship AS buyer_relationship
  , buyers.country AS billing_country
  , buyers.city AS billing_city
  , buyers.geography_type AS geography_type
  , buyers.geography AS geography
  , buyers.city AS customer_city
  , buyers.email AS unique_email
  , buyers.full_name AS customer_name

  , currency_conversion.source_bundle_number AS stadium_order_id
  , coalesce(currency_conversion.source_bundle_number, currency_conversion.payment_id) AS order_or_payment_id
  , currency_conversion.seller_serial_number AS order_serial
  , currency_conversion.seller_serial_number AS serial_number
  , coalesce(
        currency_conversion.payment_total_base_amount
      , currency_conversion.payment_total_expected_base_amount
    ) AS actual_payment_total_base_amount
  , coalesce(
        currency_conversion.payment_total_amount
      , currency_conversion.payment_total_expected
    ) AS actual_payment_total
  , (currency_conversion.line_item_price_base_amount
/ sum(currency_conversion.line_item_price_base_amount) OVER (PARTITION BY currency_conversion.source_bundle_number)) AS line_share_of_order_total_item_price
  , (currency_conversion.line_item_price_base_amount
/ sum(currency_conversion.line_item_price_base_amount) OVER (PARTITION BY currency_conversion.source_bundle_number)) AS line_share_of_order_gtv
  , (currency_conversion.expected_line_item_price_paid_base_amount
/ sum(currency_conversion.expected_line_item_price_paid_base_amount) OVER (PARTITION BY currency_conversion.source_bundle_number)) AS line_item_price_share_of_order_payment
  , (currency_conversion.expected_line_item_price_paid_base_amount
/ sum(currency_conversion.expected_line_item_price_paid_base_amount) OVER (PARTITION BY currency_conversion.source_bundle_number)) AS line_share_of_payment
  , (currency_conversion.expected_line_item_price_paid_base_amount
/ sum(currency_conversion.expected_line_item_price_paid_base_amount) OVER (PARTITION BY currency_conversion.source_bundle_number)) AS line_share_of_payment_and_credit_redeemed
  , cast(0 AS float64) AS line_item_tax_share_of_order_payment
  , cast(0 AS float64) AS line_share_of_order_shipping
  , cast(0 AS float64) AS line_shipping_price_share_of_order_payment
  , cast(0 AS float64) AS line_shipping_tax_share_of_order_payment
  , cast(0 AS float64) AS line_duties_share_of_order_payment

  , coalesce(
        currency_conversion.refund_total_base_amount
      , currency_conversion.refund_total_expected_base_amount
    ) AS actual_refund_total_base_amount
  , coalesce(
        currency_conversion.refund_total_amount
      , currency_conversion.refund_total_expected
    ) AS actual_refund_total

  , cast(0 AS numeric) AS actual_store_credit_total_base_amount
  , cast(0 AS numeric) AS actual_store_credit_total

  , currency_conversion.unit_buyer_commission_paid_base_amount AS channel_upcharge_flat_base_amount
  , currency_conversion.unit_buyer_commission_paid AS channel_upcharge_flat
  , cast(0 AS float64) AS channel_upcharge_percentage
  , cast(0 AS float64) AS channel_fee_percentage
  , cast(0 AS float64) AS agency_percentage
  , cast(0 AS float64) AS riskified_percentage
  , cast(0 AS numeric) AS packaging_cost
  , cast(0 AS numeric) AS ship_cost
  , cast(0 AS numeric) AS free_shipping_value
  , cast(0 AS numeric) AS free_shipping_value_base_amount

  , cast('SOURCE' AS string) AS channel_or_gateway
  , cast('SOURCE' AS string) AS business_unit
  , cast('SOURCE' AS string) AS sales_channel
  , cast('SOURCE' AS string) AS data_source
  , cast('Ether' AS string) AS inventory_source

  FROM currency_conversion
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`serial_price_history` AS seller_serial_price_history
    ON currency_conversion.seller_serial_number = seller_serial_price_history.serial_number
    AND currency_conversion.bundle_sold_at >= seller_serial_price_history.valid_from
    AND currency_conversion.bundle_sold_at < seller_serial_price_history.valid_to
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_seller_portal_users` AS buyers
    ON currency_conversion.buyer_user_id = buyers.user_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`sp_serials` AS sp_serials
    ON sp_serials.ether_wms_inventory_unit_id = currency_conversion.seller_serial_ether_wms_inventory_unit_id

)

SELECT
  *
FROM final