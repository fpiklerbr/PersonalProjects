



WITH tax_collection_effective_dates AS (

  SELECT
      upper(shipping_regions.shipping_region) AS shipping_state
    , shipping_regions.shipping_country
    , tax_collection_effective_dates.geography
    , min(effective_date) AS effective_date
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_amazon_marketplace_tax_collection_effective_dates` AS tax_collection_effective_dates
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_shipping_regions` AS shipping_regions
    ON tax_collection_effective_dates.geography = shipping_regions.geography
  GROUP BY 1, 2, 3

), mag_orders AS (

  SELECT
      external_order_id AS transaction_id
    , mag_order_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order`
  WHERE channel IN ('amazon', 'amazon_fba')
    AND external_order_id IS NOT NULL
  UNION ALL
  SELECT
      mao.amazon_order_id AS transaction_id
    , sfo.mag_order_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m2epro_amazon_order` AS mao
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__m2epro_order` AS mo
    ON mo.m2epro_order_id = mao.m2epro_order_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order` AS sfo
    ON sfo.sales_flat_order_id = mo.sales_flat_order_id
  LEFT JOIN (
    SELECT *
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order`
    WHERE channel IN ('amazon', 'amazon_fba')
  ) upper_part
   ON upper_part.external_order_id = mao.amazon_order_id
    WHERE upper_part.external_order_id IS NULL

), order_reports AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`amazon_marketplace__order_reports_sp`

), settlement_reports AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_amazon_marketplace_settlements`

), europe_settlements AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`amazon_marketplace__europe_settlements`

), daily_exchange_rates AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_forex_daily_exchange_rates`

), settlements AS (

  SELECT
      settlement_id
    , base_currency
    , settlement_date
  FROM settlement_reports
  WHERE settlement_date IS NOT NULL
  UNION DISTINCT
  SELECT
      settlement_id
    , base_currency
    , settlement_date
  FROM europe_settlements
  WHERE settlement_date IS NOT NULL

), north_america_settled AS (

  SELECT
      settlement_reports.transaction_id
    , cast('Amazon Marketplace Settlements' AS string) AS data_source
    , settlement_reports.marketplace_name
    , settlement_reports.is_fba
    , cast(TRUE AS boolean) AS is_approved
    , settlement_reports.payment_processed_at
    , settlement_reports.base_payment_amount
    , settlement_reports.base_payment_fee
    , settlement_reports.refund_processed_at
    , settlement_reports.base_refund_amount
    , settlement_reports.base_refund_fee
    , settlement_reports.file_time
    , settlement_reports.tax_is_withheld
    , settlement_reports.settlement_id
    , settlements.settlement_date
    , settlements.base_currency
    , settlements.settlement_date AS transaction_date
  FROM settlement_reports
  LEFT JOIN settlements
    ON settlement_reports.settlement_id = settlements.settlement_id
  WHERE settlement_reports.transaction_id IS NOT NULL

), europe_settled AS (

  SELECT
      europe_settlements.transaction_id
    , cast('Amazon Europe Settlement Reports' AS string) AS data_source
    , europe_settlements.marketplace_name
    , europe_settlements.is_fba
    , cast(TRUE AS boolean) AS is_approved
    , europe_settlements.payment_processed_at
    , europe_settlements.base_payment_amount
    , europe_settlements.base_payment_fee
    , europe_settlements.refund_processed_at
    , europe_settlements.base_refund_amount
    , europe_settlements.base_refund_fee
    , europe_settlements.file_time
    , cast(FALSE AS boolean) AS tax_is_withheld
    , europe_settlements.settlement_id
    , settlements.settlement_date
    , settlements.base_currency
    , settlements.settlement_date AS transaction_date
  FROM europe_settlements
  LEFT JOIN settlements
    ON europe_settlements.settlement_id = settlements.settlement_id
  LEFT JOIN north_america_settled
    ON north_america_settled.transaction_id = europe_settlements.transaction_id
  WHERE europe_settlements.transaction_id IS NOT NULL
    AND north_america_settled.transaction_id IS NULL

), not_settled_raw AS (

  SELECT
      *
    , ROW_NUMBER() OVER (PARTITION BY transaction_id ORDER BY file_time desc) AS row_num
  FROM order_reports
  
), not_settled AS (

  SELECT
      order_reports.transaction_id
    , cast('Amazon Marketplace Orders' AS string) AS data_source
    , order_reports.marketplace_name
    , order_reports.is_fba
    , order_reports.is_approved
    , order_reports.payment_processed_at
    , (
        (order_reports.base_item_price + order_reports.base_shipping_price)
        + CASE
            WHEN tax_collection_effective_dates.effective_date IS NULL 
              THEN (order_reports.base_item_tax_collected + order_reports.base_shipping_tax_collected) 
            WHEN (tax_collection_effective_dates.effective_date <= order_reports.order_date) THEN 0
            ELSE (order_reports.base_item_tax_collected + order_reports.base_shipping_tax_collected)
          END
        - (order_reports.base_item_discount + order_reports.base_shipping_discount)
      ) AS base_payment_amount
    , cast(NULL AS numeric) AS base_payment_fee
    , cast(NULL AS timestamp) AS refund_processed_at
    , cast(NULL AS numeric) AS base_refund_amount
    , cast(NULL AS numeric) AS base_refund_fee
    , order_reports.file_time
    , (tax_collection_effective_dates.effective_date <= order_reports.order_date) AS tax_is_withheld
    , cast(NULL AS string) AS settlement_id
    , cast(NULL AS date) AS settlement_date
    , order_reports.base_currency
    , order_reports.order_date AS transaction_date
  FROM not_settled_raw as order_reports
  LEFT JOIN tax_collection_effective_dates
    ON order_reports.shipping_state = tax_collection_effective_dates.shipping_state
    AND order_reports.shipping_country = tax_collection_effective_dates.shipping_country
  LEFT JOIN ( SELECT * FROM north_america_settled
        WHERE north_america_settled.marketplace_name IS NOT NULL
  ) north_america
    ON order_reports.transaction_id = north_america.transaction_id
  LEFT JOIN europe_settled
    ON order_reports.transaction_id = europe_settled.transaction_id
  WHERE europe_settled.transaction_id IS NULL
    AND north_america.transaction_id IS NULL
    AND order_reports.row_num = 1

), transactions_union AS (

  SELECT *
  FROM north_america_settled
  UNION ALL
  SELECT *
  FROM europe_settled
  UNION ALL
  SELECT *
  FROM not_settled

), transactions_with_exchange_rates AS (

  SELECT
      transactions_union.*
    , CASE
        WHEN transactions_union.base_currency = 'USD'
        THEN 1
        WHEN transactions_union.base_currency IS NULL
        THEN 0
        ELSE daily_exchange_rates.in_usd
      END AS in_usd
  FROM transactions_union
  LEFT JOIN daily_exchange_rates
    ON transactions_union.base_currency = daily_exchange_rates.currency
    AND transactions_union.transaction_date = daily_exchange_rates.transaction_date

), transactions_grouped AS (

  SELECT
      transaction_id
    , string_agg(DISTINCT data_source, ', ') AS data_source
    , (
        string_agg(DISTINCT marketplace_name, ', ')
        || CASE WHEN sum(CASE WHEN is_fba THEN 1 ELSE 0 END) > 0 THEN ' (FBA)' ELSE '' END
      ) AS channel_or_gateway
    , CASE WHEN sum(CASE WHEN is_approved THEN 1 ELSE 0 END) > 0 THEN 'Approved' ELSE 'Not Approved' END AS checkout_status
    , CASE WHEN count(settlement_id) > 0 THEN 'Settled' ELSE 'Not Settled' END AS transaction_state
    , min(payment_processed_at) AS payment_processed_at
    , sum(base_payment_amount) AS base_payment_amount
    , sum(base_payment_fee) AS base_payment_fee
    , min(refund_processed_at) AS refund_processed_at
    , abs(sum(base_refund_amount)) AS base_refund_amount
    , sum(base_refund_fee) AS base_refund_fee
    , max(file_time) AS file_time
    , sum(CASE WHEN tax_is_withheld THEN 1 ELSE 0 END) > 0 AS tax_is_withheld
    , string_agg(DISTINCT settlement_id, ', ') AS settlement_id
    , min(settlement_date) AS settlement_date
    , string_agg(DISTINCT base_currency, ', ') AS base_currency
    , avg(in_usd) AS in_usd
    , sum(base_payment_amount * in_usd) AS payment_amount
    , sum(base_payment_fee * in_usd) AS payment_fee
    , abs(sum(base_refund_amount * in_usd)) AS refund_amount
    , sum(base_refund_fee * in_usd) AS refund_fee
  FROM transactions_with_exchange_rates
  GROUP BY 1

), order_pricing_raw AS (

  SELECT
      transaction_id
    , base_item_price
    , base_item_discount 
    , base_item_tax_collected 
    , base_shipping_price
    , base_shipping_discount 
    , base_shipping_tax_collected 
    , ROW_NUMBER() OVER (PARTITION BY transaction_id ORDER BY file_time desc) AS row_num
  FROM order_reports


), order_pricing AS (

    SELECT
      transaction_id
    , base_item_price AS base_total_item_price
    , base_item_discount AS base_total_item_discount
    , base_item_tax_collected AS base_total_item_tax_collected
    , base_shipping_price AS base_shipping_price
    , base_shipping_discount AS base_shipping_discount
    , base_shipping_tax_collected AS base_shipping_tax_collected
  FROM order_pricing_raw
  WHERE row_num = 1

), final AS (

  SELECT
    transactions_grouped.*
  , mag_orders.mag_order_id
  , transactions_grouped.in_usd * order_pricing.base_total_item_price AS total_item_price
  , transactions_grouped.in_usd * order_pricing.base_total_item_discount AS total_item_discount
  , transactions_grouped.in_usd * order_pricing.base_total_item_tax_collected AS total_item_tax_charged
  , transactions_grouped.in_usd * CASE WHEN transactions_grouped.tax_is_withheld THEN order_pricing.base_total_item_tax_collected ELSE 0 END AS total_item_tax_withheld
  , transactions_grouped.in_usd * CASE WHEN transactions_grouped.tax_is_withheld THEN 0 ELSE order_pricing.base_total_item_tax_collected END AS total_item_tax
  , transactions_grouped.in_usd * order_pricing.base_shipping_price AS shipping_price
  , transactions_grouped.in_usd * order_pricing.base_shipping_discount AS shipping_discount
  , transactions_grouped.in_usd * order_pricing.base_shipping_tax_collected AS shipping_tax_charged
  , transactions_grouped.in_usd * CASE WHEN transactions_grouped.tax_is_withheld THEN order_pricing.base_shipping_tax_collected ELSE 0 END AS shipping_tax_withheld
  , transactions_grouped.in_usd * CASE WHEN transactions_grouped.tax_is_withheld THEN 0 ELSE order_pricing.base_shipping_tax_collected END AS shipping_tax
  , CASE
      WHEN transactions_grouped.channel_or_gateway = 'Non-Amazon (FBA)'
      THEN 'Offline Sales'
      ELSE 'Amazon'
    END AS sales_channel
  , current_timestamp AS rebuild_timestamp
  FROM transactions_grouped
  LEFT JOIN mag_orders
    ON transactions_grouped.transaction_id = mag_orders.transaction_id
  LEFT JOIN order_pricing
    ON transactions_grouped.transaction_id = order_pricing.transaction_id
  WHERE transactions_grouped.channel_or_gateway IS NOT NULL
    OR transactions_grouped.data_source <> 'Amazon Marketplace Settlements'

)

SELECT * FROM final