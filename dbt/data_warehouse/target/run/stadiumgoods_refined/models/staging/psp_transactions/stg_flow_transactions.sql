

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_flow_transactions`
  
  
  OPTIONS()
  as (
    

WITH flow_api AS (

  SELECT
      flow__orders.transaction_id
    , flow__orders.citcon_reference
	, flow__orders.channel_or_gateway
	, flow__orders.checkout_status
    , flow__orders.total_item_price
    , flow__orders.total_item_discount
    , flow__orders.total_item_tax
    , flow__orders.shipping_price
    , flow__orders.shipping_discount
    , flow__orders.shipping_tax
    , flow__orders.duties
    , flow__orders.payment_amount
    , flow__orders.payment_processed_at
    , CASE WHEN flow__order_fraud_status.is_refunded IS TRUE THEN flow__orders.payment_amount END AS refund_amount
    , CASE WHEN flow__order_fraud_status.is_refunded IS TRUE THEN flow__orders.payment_processed_at END AS refund_processed_at
    , flow__orders.file_time
    , flow__orders.total_tax
    , flow__orders.total_discount
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`flow__orders` AS flow__orders
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`flow__order_fraud_status` AS flow__order_fraud_status
    ON flow__orders.transaction_id = flow__order_fraud_status.transaction_id

), mag_orders AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_flow_mag_order_id`

), flow_settlement_transactions AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`flow__transactions`

), flow_settlement_dates AS (

  SELECT
      flow_settlement_transactions.flow_transaction_id
    , safe_cast(datetime(safe_cast(min(transfers.posted_at) AS timestamp), 'America/New_York') AS date) AS settlement_date
  FROM flow_settlement_transactions
  INNER JOIN flow_settlement_transactions AS transfers
    ON flow_settlement_transactions.posted_at <= transfers.posted_at
  WHERE transfers.transaction_description = 'transfer'
    AND flow_settlement_transactions.flow_transaction_id IS NOT NULL
  GROUP BY 1

), flow_settled AS (

  SELECT
      flow_settlement_transactions.transaction_id
    , string_agg(flow_settlement_transactions.settlement_id, ',') AS settlement_id
	, cast('Flow' AS string ) AS channel_or_gateway
	, cast('Flow Console Transactions' AS string ) AS data_source
	, CASE
        WHEN min(flow_settlement_dates.settlement_date) IS NOT NULL
        THEN cast('Settled' AS string )
        ELSE cast('Not Settled' AS string )
      END AS transaction_status
	, cast('Approved' AS string ) AS checkout_status
    , sum(flow_settlement_transactions.payment_amount) AS payment_amount
    , min(flow_settlement_transactions.payment_processed_at) AS payment_processed_at
    , sum(flow_settlement_transactions.payment_fee) AS payment_fee
    , sum(flow_settlement_transactions.refund_amount) AS refund_amount
    , min(flow_settlement_transactions.refund_processed_at) AS refund_processed_at
    , sum(flow_settlement_transactions.refund_fee) AS refund_fee
    , min(flow_settlement_dates.settlement_date) AS settlement_date
    , max(flow_settlement_transactions.file_time) AS file_time
  FROM flow_settlement_transactions
  LEFT JOIN flow_settlement_dates
    ON flow_settlement_transactions.flow_transaction_id = flow_settlement_dates.flow_transaction_id
  WHERE flow_settlement_transactions.transaction_id IS NOT NULL
  GROUP BY 1

), citcon_settled AS (

  SELECT
      coalesce(citcon__settlements.flow_order_number, flow_api.transaction_id) AS transaction_id
    , string_agg(citcon__settlements.settlement_id, ',') AS settlement_id
	, cast('China App (Citcon)' AS string ) AS channel_or_gateway
	, cast('Citcon Settlements' AS string ) AS data_source
	, cast('Settled' AS string ) AS transaction_status
	, cast('Approved' AS string ) AS checkout_status
    , sum(citcon__settlements.payment_amount) AS payment_amount
    , min(citcon__settlements.payment_processed_at) AS payment_processed_at
    , sum(citcon__settlements.payment_fee) AS payment_fee
    , sum(citcon__settlements.refund_amount) AS refund_amount
    , min(citcon__settlements.refund_processed_at) AS refund_processed_at
    , sum(citcon__settlements.refund_fee) AS refund_fee
    , min(citcon__settlements.settlement_date) AS settlement_date
    , max(citcon__settlements.file_time) AS file_time
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`citcon__settlements` AS citcon__settlements
  LEFT JOIN flow_api
    ON citcon__settlements.reference = flow_api.citcon_reference
  WHERE coalesce(citcon__settlements.flow_order_number, flow_api.transaction_id) IS NOT NULL
    AND NOT EXISTS (
      SELECT *
      FROM flow_settled
      WHERE flow_settled.transaction_id = coalesce(citcon__settlements.flow_order_number, flow_api.transaction_id)
    )
  GROUP BY 1

), alipay_settled AS (

  SELECT
      alipay__sg_settle.flow_order_number AS transaction_id
    , string_agg(alipay__sg_settle.settlement_id, ',') AS settlement_id
	, cast('China App (Alipay)' AS string ) AS channel_or_gateway
	, cast('Alipay Settlements' AS string ) AS data_source
	, cast('Settled' AS string ) AS transaction_status
	, cast('Approved' AS string ) AS checkout_status
    , sum(alipay__sg_settle.payment_amount) AS payment_amount
    , min(alipay__sg_settle.payment_processed_at) AS payment_processed_at
    , sum(alipay__sg_settle.payment_fee) AS payment_fee
    , sum(alipay__sg_settle.refund_amount) AS refund_amount
    , min(alipay__sg_settle.refund_processed_at) AS refund_processed_at
    , sum(alipay__sg_settle.refund_fee) AS refund_fee
    , min(alipay__sg_settle.settlement_date) AS settlement_date
    , max(alipay__sg_settle.file_time) AS file_time
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`alipay__sg_settle` AS alipay__sg_settle
  WHERE alipay__sg_settle.flow_order_number IS NOT NULL
    AND NOT EXISTS (SELECT * FROM flow_settled WHERE flow_settled.transaction_id = alipay__sg_settle.flow_order_number)
    AND NOT EXISTS (SELECT * FROM citcon_settled WHERE citcon_settled.transaction_id = alipay__sg_settle.flow_order_number)
  GROUP BY 1

), alipay_not_settled AS (

  SELECT
      alipay__sg_fptrade.flow_order_number AS transaction_id
    , cast(NULL AS string ) AS settlement_id
	, cast('China App (Alipay)' AS string ) AS channel_or_gateway
	, cast('Alipay Trades' AS string ) AS data_source
	, cast('Not Settled' AS string ) AS transaction_status
	, cast('Approved' AS string ) AS checkout_status
    , sum(alipay__sg_fptrade.payment_amount) AS payment_amount
    , min(alipay__sg_fptrade.payment_processed_at) AS payment_processed_at
    , sum(alipay__sg_fptrade.payment_fee) AS payment_fee
    , sum(alipay__sg_fptrade.refund_amount) AS refund_amount
    , min(alipay__sg_fptrade.refund_processed_at) AS refund_processed_at
    , sum(alipay__sg_fptrade.refund_fee) AS refund_fee
    , min(cast(NULL AS date )) AS settlement_date
    , max(alipay__sg_fptrade.file_time) AS file_time
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`alipay__sg_fptrade` AS alipay__sg_fptrade
  WHERE alipay__sg_fptrade.flow_order_number IS NOT NULL
    AND NOT EXISTS (SELECT * FROM flow_settled WHERE flow_settled.transaction_id = alipay__sg_fptrade.flow_order_number)
    AND NOT EXISTS (SELECT * FROM citcon_settled WHERE citcon_settled.transaction_id = alipay__sg_fptrade.flow_order_number)
    AND NOT EXISTS (SELECT * FROM alipay_settled WHERE alipay_settled.transaction_id = alipay__sg_fptrade.flow_order_number)
  GROUP BY 1

), api_not_settled AS (

  SELECT
      flow_api.transaction_id
    , cast(NULL AS string ) AS settlement_id
	, flow_api.channel_or_gateway
	, cast('Flow API' AS string ) AS data_source
	, cast('Not Settled' AS string ) AS transaction_status
	, flow_api.checkout_status
    , sum(flow_api.payment_amount) AS payment_amount
    , min(flow_api.payment_processed_at) AS payment_processed_at
    , cast(NULL AS float64 ) AS payment_fee
    , sum(flow_api.refund_amount) AS refund_amount
    , min(flow_api.refund_processed_at) AS refund_processed_at
    , cast(NULL AS float64 ) AS refund_fee
    , cast(NULL AS date ) AS settlement_date
    , max(flow_api.file_time) AS file_time
  FROM flow_api
  WHERE flow_api.payment_processed_at IS NOT NULL
    AND NOT EXISTS (SELECT * FROM flow_settled WHERE flow_settled.transaction_id = flow_api.transaction_id)
    AND NOT EXISTS (SELECT * FROM citcon_settled WHERE citcon_settled.transaction_id = flow_api.transaction_id)
    AND NOT EXISTS (SELECT * FROM alipay_settled WHERE alipay_settled.transaction_id = flow_api.transaction_id)
    AND NOT EXISTS (SELECT * FROM alipay_not_settled WHERE alipay_not_settled.transaction_id = flow_api.transaction_id)
  GROUP BY 1, 3, 6

), transaction_union AS (

  SELECT *
  FROM flow_settled
  UNION ALL
  SELECT *
  FROM citcon_settled
  UNION ALL
  SELECT *
  FROM alipay_settled
  UNION ALL
  SELECT *
  FROM alipay_not_settled
  UNION ALL
  SELECT *
  FROM api_not_settled

), final AS (

  SELECT
      transaction_union.transaction_id
	, mag_orders.mag_order_id
    , transaction_union.settlement_id
	, transaction_union.channel_or_gateway
	, transaction_union.data_source
	, transaction_union.transaction_status AS transaction_state
	, transaction_union.checkout_status
	, transaction_union.payment_processed_at
	, transaction_union.payment_amount
	, transaction_union.payment_fee
	, transaction_union.refund_processed_at
	, transaction_union.refund_amount
	, transaction_union.refund_fee
	, transaction_union.settlement_date
	, transaction_union.file_time
	, flow_api.total_item_price
	, flow_api.total_item_discount
	, flow_api.total_item_tax
	, flow_api.shipping_price
	, flow_api.shipping_discount
	, flow_api.shipping_tax
	, flow_api.duties
	, flow_api.total_discount
	, flow_api.total_tax
    , CASE
        WHEN transaction_union.channel_or_gateway = 'Flow'
        THEN 'SG Web'
        ELSE 'SG App'
      END AS sales_channel
	, current_timestamp rebuild_timestamp
  FROM transaction_union
  LEFT JOIN mag_orders
    ON transaction_union.transaction_id = mag_orders.transaction_id
  LEFT JOIN flow_api
    ON transaction_union.transaction_id = flow_api.transaction_id

)

SELECT *
FROM final
  );
    