

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_tmall_transactions`
  
  
  OPTIONS()
  as (
    

WITH mag_order AS (

  SELECT
    sfo.mag_order_id
  , sto.tmall_order_id
  , sfo.channel
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__smv_tmall_order` AS sto
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order` AS sfo ON sfo.sales_flat_order_id = sto.sales_flat_order_id

), api AS (

  SELECT
      api.*
    , daily.in_usd
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_tmall_api_orders` AS api
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_forex_daily_exchange_rates` AS daily
    ON api.transaction_date = daily.transaction_date
    AND daily.currency  = 'CNY'

), currency_matrix AS (

  SELECT
    transaction_id
  , in_usd
  FROM
  (
      SELECT
        transaction_id
      , 1 / rate AS in_usd
      , row_number() OVER (PARTITION BY transaction_id ORDER BY settlement_time DESC, file_time DESC, payment_time DESC) tid_row
      FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`alipay__tmall_settlement_settle`
  ) sg_settle
  WHERE tid_row = 1
  UNION ALL
  SELECT
    transaction_id
  , in_usd
  FROM
  (
      SELECT
        transaction_id
      , 1 / rate AS in_usd
      , row_number() OVER (PARTITION BY transaction_id ORDER BY settlement_time DESC, file_time DESC, payment_time DESC) tid_row
      FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`alipay__palace_settlement_settle`
  ) palace_settle
  WHERE tid_row = 1
  UNION ALL
  SELECT
    tmall_transaction_id
  , in_usd
  FROM
  (
      SELECT
        tmall_transaction_id
      , 1 / rate AS in_usd
      , row_number() OVER (PARTITION BY tmall_transaction_id ORDER BY file_time DESC, transaction_processed_at DESC) tid_row
      FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`alipay__tmall_trade_strade` AS s_strade
      WHERE NOT EXISTS (SELECT * FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`alipay__tmall_settlement_settle` s_settle WHERE s_settle.transaction_id = s_strade.tmall_transaction_id)
  ) sg_strade
  WHERE tid_row = 1
  UNION ALL
  SELECT
    tmall_transaction_id
  , in_usd
  FROM
  (
      SELECT
        tmall_transaction_id
      , 1 / rate AS in_usd
      , row_number() OVER (PARTITION BY tmall_transaction_id ORDER BY file_time DESC, transaction_processed_at DESC) tid_row
      FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`alipay__palace_trade_strade` AS p_strade
      WHERE NOT EXISTS (SELECT * FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`alipay__palace_settlement_settle` pa_settle WHERE pa_settle.transaction_id = p_strade.tmall_transaction_id)
  ) pa_strade
  WHERE tid_row = 1
  UNION ALL
  SELECT
    transaction_id
  , in_usd
  FROM api
  WHERE NOT EXISTS (SELECT * FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`alipay__tmall_settlement_settle` s_settle WHERE s_settle.transaction_id = api.transaction_id)
  AND NOT EXISTS (SELECT * FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`alipay__palace_settlement_settle` p_settle WHERE p_settle.transaction_id = api.transaction_id)
  AND NOT EXISTS (SELECT * FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`alipay__tmall_trade_strade` s_strade WHERE s_strade.tmall_transaction_id = api.transaction_id)
  AND NOT EXISTS (SELECT * FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`alipay__palace_trade_strade` p_strade WHERE p_strade.tmall_transaction_id = api.transaction_id)

), settlements AS (

  SELECT transaction_id
  , data_source
  , checkout_status
  , payment_amount
  , payment_processed_at
  , payment_fee
  , refund_amount
  , refund_processed_at
  , refund_fee
  , settlement_date
  , file_time
  , settlement_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_tmall_settlements`

), strades AS (

  SELECT transaction_id
  , data_source
  , checkout_status
  , payment_amount
  , payment_processed_at
  , payment_fee
  , refund_amount
  , refund_processed_at
  , refund_fee
  , settlement_date
  , file_time
  , settlement_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_tmall_strades` AS strade
  WHERE NOT EXISTS (SELECT * FROM settlements WHERE settlements.transaction_id = strade.transaction_id)

), api_without_strades_or_settlements AS (

  SELECT
    api.transaction_id
  , api.data_source
  , api.checkout_status
  , api.payment_amount_rmb * currency_matrix.in_usd AS payment_amount
  , api.payment_processed_at
  , api.payment_fee
  , api.refund_amount_rmb * currency_matrix.in_usd AS refund_amount
  , api.refund_processed_at
  , api.refund_fee
  , api.settlement_date
  , api.file_time
  , CAST(NULL AS string) AS settlement_id
  FROM api
  LEFT JOIN currency_matrix ON currency_matrix.transaction_id = api.transaction_id
  WHERE NOT EXISTS (SELECT * FROM settlements WHERE settlements.transaction_id = api.transaction_id)
  AND NOT EXISTS (SELECT * FROM strades WHERE strades.transaction_id = api.transaction_id)

), unioned AS (

  SELECT *
  FROM settlements
  UNION ALL
  SELECT *
  FROM strades
  UNION ALL
  SELECT *
  FROM api_without_strades_or_settlements

), final AS (

  SELECT
    unioned.transaction_id
  , mag_order.mag_order_id
  , unioned.settlement_id
  , CASE
      WHEN api.seller_nickname = 'palace海外旗舰店' OR mag_order.channel = 'palace_b2c'
        THEN cast('Tmall Palace' AS string)
      WHEN api.duties_rmb <> 0 OR mag_order.channel = 'tmall_b2c'
        THEN cast('Tmall B2C' AS string)
      ELSE
        cast('Tmall' AS string)
    END AS channel_or_gateway
  , unioned.data_source
  , CASE
      WHEN unioned.data_source = 'Alipay Settlements'
      THEN cast('Settled' AS string)
      ELSE cast('Not Settled' AS string)
    END AS transaction_state
  , unioned.checkout_status
  , currency_matrix.in_usd AS currency_conversion_rate
  , unioned.payment_processed_at
  , unioned.payment_amount
  , unioned.payment_fee
  , unioned.refund_processed_at
  , unioned.refund_amount
  , unioned.refund_fee
  , unioned.settlement_date
  , unioned.file_time

  , api.total_item_price_rmb * currency_matrix.in_usd AS total_item_price

  , api.total_item_discount_rmb * currency_matrix.in_usd AS total_item_discount

  , api.total_item_tax_rmb * currency_matrix.in_usd AS total_item_tax

  , api.shipping_price_rmb * currency_matrix.in_usd AS shipping_price

  , api.shipping_discount_rmb * currency_matrix.in_usd AS shipping_discount

  , api.shipping_tax_rmb * currency_matrix.in_usd AS shipping_tax

  , api.duties_rmb * currency_matrix.in_usd AS duties

  , cast('Tmall' AS string) AS sales_channel
  , current_timestamp AS rebuild_timestamp
  FROM unioned
  LEFT JOIN mag_order
    ON mag_order.tmall_order_id = unioned.transaction_id
  LEFT JOIN api
    ON api.transaction_id = unioned.transaction_id
  LEFT JOIN currency_matrix
    ON currency_matrix.transaction_id = unioned.transaction_id

)

SELECT * FROM final
  );
    