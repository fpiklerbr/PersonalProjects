

  SELECT
    customer.email AS customer_email
  , balance.customer_id
  , balance.credit_balance_id
  , balance.amount AS final_credit_balance
  , count(*) OVER (PARTITION BY balance.credit_balance_id) AS balance_transaction_count
  , row_number() OVER (PARTITION BY balance.credit_balance_id ORDER BY log.credit_transaction_id) AS balance_transaction_number
  , log.credit_transaction_id
  , safe_cast(datetime(safe_cast(log.created_at AS timestamp), 'America/New_York') AS datetime) AS credit_transaction_timestamp_nyc
  , log.balance_delta AS credit_transaction_amount
  , log.balance_amount AS running_credit_balance
  , log.action AS credit_transaction_action
  , log.message AS credit_transaction_message
  , log.mag_order_id
  , safe_cast(datetime(safe_cast(orders.created_at AS timestamp), 'America/New_York') AS datetime) AS order_timestamp_nyc
  , orders.channel AS order_channel
  , orders.status AS order_status
  , orders.base_grand_total AS order_grand_total
  , orders.base_credit_total_refunded AS order_credit_refunded
  , orders.base_total_refunded - orders.base_credit_total_refunded AS order_payment_refunded
  , log.mag_creditmemo_id AS creditmemo_id
  , safe_cast(datetime(safe_cast(memo.created_at AS timestamp), 'America/New_York') AS datetime) AS creditmemo_timestamp_nyc
  , memo.base_credit_total_refunded AS creditmemo_credit_refunded
  , COALESCE(refund_transactions_1.transaction_id,refund_transactions_2.transaction_id) AS refund_transaction_id
  , COALESCE(refund_transactions_1.channel_or_gateway, refund_transactions_2.channel_or_gateway) AS channel_or_gateway
  , COALESCE(refund_transactions_1.refund_amount, refund_transactions_2.refund_amount) AS refund_amount
  , safe_cast(datetime(safe_cast(COALESCE(refund_transactions_1.refund_timestamp, refund_transactions_2.refund_timestamp) AS timestamp), 'America/New_York') AS datetime) AS refund_timestamp_nyc
  , current_timestamp AS rebuild_timestamp
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m_credit_balance` AS balance
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m_credit_transaction` AS log
  ON log.credit_balance_id = balance.credit_balance_id
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__customer_entity`  AS customer
  ON customer.customer_id = balance.customer_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order` AS orders
  ON orders.mag_order_id = log.mag_order_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_creditmemo` AS memo
  ON memo.mag_creditmemo_id  = log.mag_creditmemo_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_transactions` AS refund_transactions_1
  ON refund_transactions_1.mag_order_id = log.mag_order_id
  AND refund_transactions_1.refund_amount <> 0
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_transactions` AS refund_transactions_2
  ON refund_transactions_2.mag_order_id = log.mag_creditmemo_id
  AND refund_transactions_2.refund_amount <> 0
  -- cause no key joins, raise BQ error: LEFT OUTER JOIN cannot be used without
  -- a condition that is an equality of fields on both side