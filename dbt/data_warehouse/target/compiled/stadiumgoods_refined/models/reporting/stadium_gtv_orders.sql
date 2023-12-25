

WITH transaction_range AS (

  SELECT
    channel_or_gateway
, DATETIME(SAFE_CAST(nullif(
     least(
      coalesce(min(payment_timestamp), CAST('9999-12-31 23:59:59' AS timestamp))
      ,coalesce(min(refund_timestamp), CAST('9999-12-31 23:59:59' AS timestamp))
      
      )
     , CAST('9999-12-31 23:59:59' AS timestamp)
  ) AS timestamp), 'America/New_York') AS first_transaction
, DATETIME(SAFE_CAST(nullif(
     greatest(
      coalesce(max(payment_timestamp), CAST('0001-01-01 00:00:00' AS timestamp))
      ,coalesce(max(refund_timestamp), CAST('0001-01-01 00:00:00' AS timestamp))
      
      )
     , CAST('0001-01-01 00:00:00' AS timestamp)
  ) AS timestamp), 'America/New_York') AS last_transaction
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_transactions`
  GROUP BY 1

), orders_in_transactions AS (

/* order in paid/approved channel/gateway transaction data */
  SELECT
  coalesce(sol.mag_order_id, sol.x3_order_id) AS stadium_order_id
  , string_agg(DISTINCT sol.channel_or_gateway, ',') AS channel_or_gateway
  , string_agg(DISTINCT sol.business_unit, ',') AS business_unit
  , string_agg(DISTINCT CASE WHEN sol.mag_order_entity_id IS NOT NULL THEN 'Magento' ELSE 'X3' END, ', ') AS data_source
  , SAFE_CAST(SAFE_CAST(min(sol.order_creation_nyc) AS datetime) AS date) AS order_date
  , sum(sol.order_serial_price) AS total_serial_price
  , sum(sol.line_item_price) AS total_item_price
  , sum(sol.line_item_tax) AS total_item_tax
  , sum(sol.line_item_discount) AS total_item_discount
  , sum(sol.line_item_store_credit_applied) AS total_item_store_credit_applied
  , sum(sol.line_shipping_price) AS shipping_price
  , sum(sol.line_shipping_tax) AS shipping_tax
  , sum(sol.line_shipping_discount) AS shipping_discount
  , sum(sol.line_shipping_store_credit_applied) AS shipping_store_credit_applied
  , sum(sol.shipping_value_not_charged) shipping_value_not_charged
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_order_lines` AS sol
  WHERE EXISTS (
   
  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_transactions` AS transactions
  WHERE checkout_status IN ('Paid', 'Approved') AND transactions.mag_order_id = sol.mag_order_id
  )
  GROUP BY 1

), orders_out_transaction_range AS (

/* order timestamp out of channel/gateway transaction range */
  SELECT
  coalesce(sol.mag_order_id, sol.x3_order_id) AS stadium_order_id
  , string_agg(DISTINCT sol.channel_or_gateway, ',') AS channel_or_gateway
  , string_agg(DISTINCT sol.business_unit, ',') AS business_unit
  , string_agg(DISTINCT CASE WHEN sol.mag_order_entity_id IS NOT NULL THEN 'Magento' ELSE 'X3' END, ', ') AS data_source
  , SAFE_CAST(SAFE_CAST(min(sol.order_creation_nyc) AS datetime) AS date) AS order_date
  , sum(sol.order_serial_price) AS total_serial_price
  , sum(sol.line_item_price) AS total_item_price
  , sum(sol.line_item_tax) AS total_item_tax
  , sum(sol.line_item_discount) AS total_item_discount
  , sum(sol.line_item_store_credit_applied) AS total_item_store_credit_applied
  , sum(sol.line_shipping_price) AS shipping_price
  , sum(sol.line_shipping_tax) AS shipping_tax
  , sum(sol.line_shipping_discount) AS shipping_discount
  , sum(sol.line_shipping_store_credit_applied) AS shipping_store_credit_applied
  , sum(sol.shipping_value_not_charged) shipping_value_not_charged
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_order_lines` AS sol
  INNER JOIN transaction_range ON transaction_range.channel_or_gateway = sol.channel_or_gateway
  WHERE NOT EXISTS (
   
  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_transactions` AS transactions
  WHERE checkout_status IN ('Paid', 'Approved') AND transactions.mag_order_id = sol.mag_order_id
  )
  AND sol.gmv = 1
  AND sol.checkout_type = 'Active'
  AND sol.channel_or_gateway <> 'Non-GTV'
  AND (sol.order_creation_nyc < transaction_range.first_transaction OR sol.order_creation_nyc > transaction_range.last_transaction)
  GROUP BY 1

), orders_out_transactions AS (

/* order and channel/gateway not in transaction data */
  SELECT
  coalesce(sol.mag_order_id, sol.x3_order_id) AS stadium_order_id
  , string_agg(DISTINCT sol.channel_or_gateway, ',') AS channel_or_gateway
  , string_agg(DISTINCT sol.business_unit, ',') AS business_unit
  , string_agg(DISTINCT CASE WHEN sol.mag_order_entity_id IS NOT NULL THEN 'Magento' ELSE 'X3' END, ', ') AS data_source
  , SAFE_CAST(SAFE_CAST(min(sol.order_creation_nyc) AS datetime) AS date) AS order_date
  , sum(sol.order_serial_price) AS total_serial_price
  , sum(sol.line_item_price) AS total_item_price
  , sum(sol.line_item_tax) AS total_item_tax
  , sum(sol.line_item_discount) AS total_item_discount
  , sum(sol.line_item_store_credit_applied) AS total_item_store_credit_applied
  , sum(sol.line_shipping_price) AS shipping_price
  , sum(sol.line_shipping_tax) AS shipping_tax
  , sum(sol.line_shipping_discount) AS shipping_discount
  , sum(sol.line_shipping_store_credit_applied) AS shipping_store_credit_applied
  , sum(sol.shipping_value_not_charged) shipping_value_not_charged
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_order_lines` AS sol
  WHERE NOT EXISTS (
   
  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_transactions` AS transactions
  WHERE checkout_status IN ('Paid', 'Approved') AND transactions.mag_order_id = sol.mag_order_id
  )
  AND NOT EXISTS (
    SELECT *
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_transactions` AS transactions
    WHERE transactions.channel_or_gateway = sol.channel_or_gateway
  )
  AND sol.gmv = 1
  AND sol.checkout_type = 'Active'
  AND sol.channel_or_gateway <> 'Non-GTV'
  AND (
    sol.mag_order_id IS NULL OR sol.mag_order_id NOT IN
     ('100011076','100028275','100013108','100020966','100009050','100009880','100007674','100005667'
      ,'100005098','100010137','100006648','100012844','100021351','100009947','100026757','100007230'
      ,'100006548','100018400','100013109','100027372','100007123','100017800')
  )
  GROUP BY 1

), orders_union AS (

  SELECT *
  FROM orders_in_transactions
  UNION ALL
  SELECT *
  FROM orders_out_transaction_range
  UNION ALL
  SELECT *
  FROM orders_out_transactions

)

SELECT orders_union.*
, current_timestamp AS rebuild_timestamp
FROM orders_union