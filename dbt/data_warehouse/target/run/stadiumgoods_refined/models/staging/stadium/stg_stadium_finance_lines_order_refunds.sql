

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_finance_lines_order_refunds`
  
  
  OPTIONS()
  as (
    

SELECT
    stadium_transactions.mag_order_id
  , string_agg(DISTINCT stadium_transactions.transaction_id, ', ') AS order_refund_id
  , string_agg(DISTINCT stadium_transactions.channel_or_gateway, ', ') AS order_refund_channel_or_gateway
  , string_agg(DISTINCT stadium_transactions.business_unit, ', ') AS order_refund_business_unit
  , string_agg(DISTINCT stadium_transactions.data_source, ', ') AS order_refund_data_source
  , string_agg(DISTINCT stadium_transactions.transaction_state, ', ') AS order_refund_transaction_state
  , string_agg(DISTINCT stadium_transactions.checkout_status, ', ') AS order_refund_checkout_status
, DATETIME(SAFE_CAST(min(stadium_transactions.refund_timestamp) AS timestamp), 'America/New_York') AS order_refund_timestamp_nyc
  , sum(stadium_transactions.refund_amount) AS order_refund_amount
  , sum(stadium_transactions.refund_fee) AS order_refund_fee
  , sum(stadium_transactions.refund_shipping_subsidy_base_amount) AS order_refund_shipping_subsidy_base_amount
  , sum(stadium_transactions.refund_shipping_subsidy) AS order_refund_shipping_subsidy
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_transactions` AS stadium_transactions
WHERE stadium_transactions.refund_timestamp IS NOT NULL
  AND stadium_transactions.mag_order_id IS NOT NULL
  AND stadium_transactions.checkout_status IN ('Paid', 'Approved')
  AND NOT EXISTS (
    SELECT *
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_creditmemo` AS sales_flat_creditmemo
    WHERE sales_flat_creditmemo.transaction_id = stadium_transactions.transaction_id
  )
GROUP BY 1
  );
    