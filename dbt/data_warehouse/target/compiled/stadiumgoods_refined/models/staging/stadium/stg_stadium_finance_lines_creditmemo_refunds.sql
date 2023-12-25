

SELECT
    creditmemo_transactions.order_item_id
  , string_agg(DISTINCT refund_transactions.transaction_id, ', ') AS creditmemo_refund_id
  , string_agg(DISTINCT refund_transactions.channel_or_gateway, ', ') AS creditmemo_refund_channel_or_gateway
  , string_agg(DISTINCT refund_transactions.business_unit, ', ') AS creditmemo_refund_business_unit
  , string_agg(DISTINCT refund_transactions.data_source, ', ') AS creditmemo_refund_data_source
  , string_agg(DISTINCT refund_transactions.transaction_state, ', ') AS creditmemo_refund_transaction_state
  , string_agg(DISTINCT refund_transactions.checkout_status, ', ') AS creditmemo_refund_checkout_status
  , DATETIME(SAFE_CAST(min(refund_transactions.refund_timestamp) AS timestamp), 'America/New_York') AS creditmemo_refund_timestamp_nyc
  , sum(refund_transactions.refund_amount) AS creditmemo_refund_amount
  , sum(refund_transactions.refund_fee) AS creditmemo_refund_fee
  , sum(refund_transactions.refund_shipping_subsidy_base_amount) AS creditmemo_refund_shipping_subsidy_base_amount
  , sum(refund_transactions.refund_shipping_subsidy) AS creditmemo_refund_shipping_subsidy
FROM (
  SELECT DISTINCT
      order_item_id
    , transaction_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_finance_lines_sol_matrix` AS sol_matrix, unnest(creditmemo_transaction_ids) AS transaction_id
) AS creditmemo_transactions
INNER JOIN (
  SELECT
      transaction_id
    , channel_or_gateway
    , business_unit
    , data_source
    , transaction_state
    , checkout_status
    , refund_timestamp
    , refund_amount
    , refund_fee
    , refund_shipping_subsidy_base_amount
    , refund_shipping_subsidy
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_transactions`
  WHERE refund_timestamp IS NOT NULL
    AND checkout_status IN ('Paid', 'Approved')
) AS refund_transactions
  ON creditmemo_transactions.transaction_id = refund_transactions.transaction_id
GROUP BY 1