

SELECT
    mag_order_id
  , string_agg(DISTINCT transaction_id, ', ') AS payment_id
  , string_agg(DISTINCT fps_order_code, ', ') AS fps_order_code
  , string_agg(DISTINCT fps_stock_point_id, ', ') AS fps_stock_point_id
  , string_agg(DISTINCT fps_merchant_name, ', ') AS fps_merchant_name
  , string_agg(DISTINCT channel_or_gateway, ', ') AS payment_channel_or_gateway
  , string_agg(DISTINCT business_unit, ', ') AS payment_business_unit
  , string_agg(DISTINCT sales_channel, ', ') AS payment_sales_channel
  , string_agg(DISTINCT data_source, ', ') AS payment_data_source
  , string_agg(DISTINCT transaction_state, ', ') AS payment_transaction_state
  , string_agg(DISTINCT checkout_status, ', ') AS payment_checkout_status
  , DATETIME(SAFE_CAST(min(payment_timestamp) AS timestamp), 'America/New_York') AS payment_timestamp_nyc
  , sum(payment_amount) AS payment_amount
  , sum(payment_fee) AS payment_fee
  , sum(payment_shipping_subsidy_base_amount) AS payment_shipping_subsidy_base_amount
  , sum(payment_shipping_subsidy) AS payment_shipping_subsidy
  , sum(coalesce(channel_discount, 0)) AS channel_discount
  , sum(coalesce(channel_shipping, 0)) AS channel_shipping
  , sum(coalesce(channel_duties, 0)) AS channel_duties
  , sum(coalesce(channel_additional_gtv, 0)) AS channel_additional_gtv
  , sum(CASE WHEN is_excluded_from_financial_reporting THEN 1 ELSE 0 END) > 0 AS is_excluded_from_financial_reporting
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_transactions`
WHERE payment_timestamp IS NOT NULL
  AND mag_order_id IS NOT NULL
  AND checkout_status IN ('Paid', 'Approved')
GROUP BY 1