/*
TODO for DE-3487: update docs
*/

-- depends_on: `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_finance_snapshots_close_dates`

WITH macro_result AS (



WITH finance_lines AS (

  SELECT
      stadium_order_id
    , order_date
    , financial_reporting_unit AS sales_channel_level_1
    , channel_or_gateway AS sales_channel_level_2
    , payment_id
    , order_line_id
    , geography_type
    , CASE WHEN geography_type = 'Domestic' THEN geography END AS us_state
    , CASE WHEN geography_type = 'Domestic' THEN COALESCE(
  CAST(regexp_extract(customer_city, 
  r'(.*),'
) AS string)
, customer_city) END AS us_city
    , CASE WHEN geography_type = 'Domestic' THEN shipping_postcode END AS us_postcode
    , serial_number
    , reporting_status
    , reporting_date
    , inventory_relationship
    , inventory_type
    , inventory_seller
    , product_sku
    , simple_sku
    , product_brand
    , refund_date
    , refund_id
    , return_date
    , return_outcome
    , serial_order_match
    , return_intake_creation_nyc
    , return_intake_id
    , new_serial_from_return
    , new_serial_inventory_relationship
    , x3_return_creation_nyc
    , x3_return_id
    , rma_package_approved_nyc
    , rma_closed_nyc
    , mag_rma_ids
    , rma_statuses
    , issued_serial_next_journal_date_after_dispatch_date
    , issued_serial_next_journal_document_id_after_dispatch_date
    , cast(1 AS int64) AS quantity
    , order_base_currency AS currency
    , round(order_serial_price_base_amount, 2) AS order_serial_price
    , round(line_item_price_before_upcharge_base_amount, 2) AS item_price_before_upcharge
    , round(line_item_upcharge_base_amount, 2) AS channel_upcharge
    , (
        round(line_item_price_paid_base_amount, 2)
        + round(line_item_store_credit_applied_base_amount, 2)
      ) AS item_price_paid
    , -1 * round(line_item_discount_base_amount, 2) AS item_discount
    , (
        round(line_shipping_price_paid_base_amount, 2)
        + round(line_shipping_store_credit_applied_base_amount, 2)
      ) AS shipping_price_paid
    , -1 * round(line_shipping_discount_base_amount, 2) AS shipping_discount
    , ( round(line_item_tax_paid_base_amount, 2) +
        CASE WHEN business_entity = 'STADIUM GOODS EU' THEN 0
        ELSE round(line_shipping_tax_paid_base_amount, 2)
        END ) AS tax_paid
    , -1 * (
        round(line_item_price_refunded_base_amount, 2)
        + round(line_item_price_credited_base_amount, 2)
      ) AS item_price_refunded
    , -1 * (
        round(line_shipping_price_refunded_base_amount, 2)
        + round(line_shipping_price_credited_base_amount, 2)
      ) AS shipping_price_refunded
    , -1 * (
        round(line_item_tax_refunded_base_amount, 2)
        + round(line_item_tax_credited_base_amount, 2)
        + CASE WHEN business_entity = 'STADIUM GOODS EU' THEN 0
            ELSE (round(line_shipping_tax_refunded_base_amount, 2)+ round(line_shipping_tax_credited_base_amount, 2))
            END
      ) AS tax_refunded
    , round(return_refund_expected_base_amount, 2) AS return_refund_expected
    , -1 * round(serial_cost_base_amount, 2) AS serial_cost
    , round(payment_total_shipping_subsidy_base_amount, 2) AS payment_total_shipping_subsidy
    , round(line_payment_shipping_subsidy_base_amount, 2) AS line_payment_shipping_subsidy
    , round(refund_total_shipping_subsidy_base_amount, 2) AS refund_total_shipping_subsidy
    , round(line_refund_shipping_subsidy_base_amount, 2) AS line_refund_shipping_subsidy
    , fps_stock_point_id
    , business_entity
    , payment_currency_conversion_rate
  FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`stadium_finance_lines_20231205`
  WHERE reporting_status IN ('Returned', 'Dispatched', 'Cancelled', 'Deferred')

), lines_with_calculations AS (

SELECT
    *
  , CASE WHEN business_entity = 'STADIUM GOODS USA'
    THEN nullif(
     greatest(
      coalesce((item_price_paid - channel_upcharge - item_discount), CAST('-9.9999999999999999999999999999999999999E+28' AS numeric))
      ,coalesce(order_serial_price, CAST('-9.9999999999999999999999999999999999999E+28' AS numeric))
      
      )
     , CAST('-9.9999999999999999999999999999999999999E+28' AS numeric)
  )
    WHEN business_entity = 'STADIUM GOODS EU'
    THEN ((item_price_paid) - item_discount - channel_upcharge)
     END AS serial_price
  , CASE WHEN business_entity = 'STADIUM GOODS USA'
    THEN nullif(
     greatest(
      coalesce((item_price_paid - channel_upcharge - item_discount), CAST('-9.9999999999999999999999999999999999999E+28' AS numeric))
      ,coalesce(order_serial_price, CAST('-9.9999999999999999999999999999999999999E+28' AS numeric))
      
      )
     , CAST('-9.9999999999999999999999999999999999999E+28' AS numeric)
  ) + channel_upcharge
    WHEN business_entity = 'STADIUM GOODS EU'
    THEN ((item_price_paid) - item_discount)
     END AS product_sales_price
  , item_discount AS basket_promo
  , (item_price_paid) AS item_basket_price_ex_tax
  , (shipping_price_paid - shipping_discount) AS shipping_revenue
  , shipping_discount AS shipping_promo
  , (item_price_paid + shipping_price_paid) AS basket_price_ex_tax
  , tax_paid AS sales_tax
  , (item_price_paid + shipping_price_paid + tax_paid) AS total_amount_paid
  , (item_price_refunded + shipping_price_refunded + tax_refunded) AS total_amount_refunded
  , nullif(
     greatest(
      coalesce(tax_paid * -1, CAST('-9.9999999999999999999999999999999999999E+28' AS numeric))
      ,coalesce((item_price_refunded + shipping_price_refunded + tax_refunded), CAST('-9.9999999999999999999999999999999999999E+28' AS numeric))
      
      )
     , CAST('-9.9999999999999999999999999999999999999E+28' AS numeric)
  ) AS sales_tax_refunded
  , ((item_price_refunded + shipping_price_refunded + tax_refunded) - nullif(
     greatest(
      coalesce(tax_paid * -1, CAST('-9.9999999999999999999999999999999999999E+28' AS numeric))
      ,coalesce((item_price_refunded + shipping_price_refunded + tax_refunded), CAST('-9.9999999999999999999999999999999999999E+28' AS numeric))
      
      )
     , CAST('-9.9999999999999999999999999999999999999E+28' AS numeric)
  )) AS basket_price_ex_tax_refunded
  , nullif(
     greatest(
      coalesce((item_price_paid) * -1, CAST('-9.9999999999999999999999999999999999999E+28' AS numeric))
      ,coalesce(((item_price_refunded + shipping_price_refunded + tax_refunded) - nullif(
     greatest(
      coalesce(tax_paid * -1, CAST('-9.9999999999999999999999999999999999999E+28' AS numeric))
      ,coalesce((item_price_refunded + shipping_price_refunded + tax_refunded), CAST('-9.9999999999999999999999999999999999999E+28' AS numeric))
      
      )
     , CAST('-9.9999999999999999999999999999999999999E+28' AS numeric)
  )), CAST('-9.9999999999999999999999999999999999999E+28' AS numeric))
      
      )
     , CAST('-9.9999999999999999999999999999999999999E+28' AS numeric)
  ) AS item_basket_price_ex_tax_refunded
  , (((item_price_refunded + shipping_price_refunded + tax_refunded) - nullif(
     greatest(
      coalesce(tax_paid * -1, CAST('-9.9999999999999999999999999999999999999E+28' AS numeric))
      ,coalesce((item_price_refunded + shipping_price_refunded + tax_refunded), CAST('-9.9999999999999999999999999999999999999E+28' AS numeric))
      
      )
     , CAST('-9.9999999999999999999999999999999999999E+28' AS numeric)
  )) - nullif(
     greatest(
      coalesce((item_price_paid) * -1, CAST('-9.9999999999999999999999999999999999999E+28' AS numeric))
      ,coalesce(((item_price_refunded + shipping_price_refunded + tax_refunded) - nullif(
     greatest(
      coalesce(tax_paid * -1, CAST('-9.9999999999999999999999999999999999999E+28' AS numeric))
      ,coalesce((item_price_refunded + shipping_price_refunded + tax_refunded), CAST('-9.9999999999999999999999999999999999999E+28' AS numeric))
      
      )
     , CAST('-9.9999999999999999999999999999999999999E+28' AS numeric)
  )), CAST('-9.9999999999999999999999999999999999999E+28' AS numeric))
      
      )
     , CAST('-9.9999999999999999999999999999999999999E+28' AS numeric)
  )) AS shipping_revenue_refunded
  , CASE WHEN inventory_relationship = '1P'  AND reporting_status <> 'Cancelled' THEN serial_cost END AS _1p_cogs
  , CASE WHEN inventory_relationship <> '1P' AND reporting_status <> 'Cancelled' THEN serial_cost END AS _3p_consignor_payout
FROM finance_lines

), sale_transactions AS (

  SELECT
      stadium_order_id
    , order_line_id
    , serial_number
    , cast('Sale' AS string) AS transaction_type
    , reporting_date AS transaction_date
    , order_date
    , sales_channel_level_1
    , sales_channel_level_2
    , payment_id
    , geography_type
    , us_state
    , us_city
    , us_postcode
    , reporting_status
    , inventory_relationship
    , inventory_type
    , inventory_seller
    , product_sku
    , simple_sku
    , product_brand
    , quantity
    , currency
    , serial_price
    , channel_upcharge
    , product_sales_price
    , basket_promo
    , item_basket_price_ex_tax
    , shipping_revenue
    , shipping_promo
    , basket_price_ex_tax
    , sales_tax
    , total_amount_paid
    , _1p_cogs
    , _3p_consignor_payout
    , cast(NULL AS date) AS refund_date
    , cast(NULL AS string) AS refund_id
    , cast(NULL AS numeric) AS returned_refunds_accrual
    , cast(NULL AS date) AS return_date
    , cast(NULL AS string) AS return_outcome
    , cast(NULL AS boolean) AS serial_order_match
    , cast(NULL AS datetime) AS return_intake_creation_nyc
    , cast(NULL AS string) AS return_intake_id
    , cast(NULL AS string) AS new_serial_from_return
    , cast(NULL AS string) AS new_serial_inventory_relationship
    , cast(NULL AS datetime) AS x3_return_creation_nyc
    , cast(NULL AS string) AS x3_return_id
    , cast(NULL AS datetime) AS rma_package_approved_nyc
    , cast(NULL AS datetime) AS rma_closed_nyc
    , cast(NULL AS string) AS mag_rma_ids
    , cast(NULL AS string) AS rma_statuses
    , cast(NULL AS date) AS issued_serial_next_journal_date_after_dispatch_date
    , cast(NULL AS string) AS issued_serial_next_journal_document_id_after_dispatch_date
    , reporting_date
    , payment_total_shipping_subsidy AS order_total_shipping_subsidy
    , line_payment_shipping_subsidy AS line_shipping_subsidy
    , fps_stock_point_id
    , business_entity
    , payment_currency_conversion_rate
  FROM lines_with_calculations
  WHERE reporting_status IN ('Returned', 'Dispatched','Cancelled','Deferred')

), return_transactions AS (

  SELECT
      stadium_order_id
    , order_line_id
    , serial_number
    , cast('Returned Inventory' AS string) AS transaction_type
    , return_date AS transaction_date
    , order_date
    , sales_channel_level_1
    , sales_channel_level_2
    , payment_id
    , geography_type
    , us_state
    , us_city
    , us_postcode
    , reporting_status
    , inventory_relationship
    , inventory_type
    , inventory_seller
    , product_sku
    , simple_sku
    , product_brand
    , cast(NULL AS int64) AS quantity
    , currency
    , cast(NULL AS numeric) AS serial_price
    , cast(NULL AS numeric) AS channel_upcharge
    , cast(NULL AS numeric) AS product_sales_price
    , cast(NULL AS numeric) AS basket_promo
    , cast(NULL AS numeric) AS item_basket_price_ex_tax
    , cast(NULL AS numeric) AS shipping_revenue
    , cast(NULL AS numeric) AS shipping_promo
    , cast(NULL AS numeric) AS basket_price_ex_tax
    , cast(NULL AS numeric) AS sales_tax
    , cast(NULL AS numeric) AS total_amount_paid
    , -1 * _1p_cogs AS _1p_cogs
    , -1 * _3p_consignor_payout AS _3p_consignor_payout
    , cast(NULL AS date) AS refund_date
    , cast(NULL AS string) AS refund_id
    , -1 * return_refund_expected AS returned_refunds_accrual
    , return_date
    , return_outcome
    , serial_order_match
    , return_intake_creation_nyc
    , return_intake_id
    , new_serial_from_return
    , new_serial_inventory_relationship
    , x3_return_creation_nyc
    , x3_return_id
    , rma_package_approved_nyc
    , rma_closed_nyc
    , mag_rma_ids
    , rma_statuses
    , issued_serial_next_journal_date_after_dispatch_date
    , issued_serial_next_journal_document_id_after_dispatch_date
    , reporting_date
    , cast(NULL AS numeric) AS order_total_shipping_subsidy
    , cast(NULL AS numeric) AS line_shipping_subsidy
    , fps_stock_point_id
    , business_entity
    , payment_currency_conversion_rate
  FROM lines_with_calculations
  WHERE return_date IS NOT NULL

), refund_transactions AS (

  SELECT
      stadium_order_id
    , order_line_id
    , serial_number
    , cast('Refunded Payment' AS string) AS transaction_type
    , refund_date AS transaction_date
    , order_date
    , sales_channel_level_1
    , sales_channel_level_2
    , payment_id
    , geography_type
    , us_state
    , us_city
    , us_postcode
    , reporting_status
    , inventory_relationship
    , inventory_type
    , inventory_seller
    , product_sku
    , simple_sku
    , product_brand
    , cast(NULL AS int64) AS quantity
    , currency
    , cast(NULL AS numeric) AS serial_price
    , cast(NULL AS numeric) AS channel_upcharge
    , cast(NULL AS numeric) AS product_sales_price
    , -1 * basket_promo AS basket_promo
    , item_basket_price_ex_tax_refunded AS item_basket_price_ex_tax
    , shipping_revenue_refunded AS shipping_revenue
    , -1 * shipping_promo AS shipping_promo
    , basket_price_ex_tax_refunded AS basket_price_ex_tax
    , sales_tax_refunded AS sales_tax
    , total_amount_refunded AS total_amount_paid
    , cast(NULL AS numeric) AS _1p_cogs
    , cast(NULL AS numeric) AS _3p_consignor_payout
    , refund_date
    , refund_id
    , return_refund_expected AS returned_refunds_accrual
    , cast(NULL AS date) AS return_date
    , cast(NULL AS string) AS return_outcome
    , cast(NULL AS boolean) AS serial_order_match
    , cast(NULL AS datetime) AS return_intake_creation_nyc
    , cast(NULL AS string) AS return_intake_id
    , cast(NULL AS string) AS new_serial_from_return
    , cast(NULL AS string) AS new_serial_inventory_relationship
    , cast(NULL AS datetime) AS x3_return_creation_nyc
    , cast(NULL AS string) AS x3_return_id
    , cast(NULL AS datetime) AS rma_package_approved_nyc
    , cast(NULL AS datetime) AS rma_closed_nyc
    , cast(NULL AS string) AS mag_rma_ids
    , cast(NULL AS string) AS rma_statuses
    , cast(NULL AS date) AS issued_serial_next_journal_date_after_dispatch_date
    , cast(NULL AS string) AS issued_serial_next_journal_document_id_after_dispatch_date
    , reporting_date
    , refund_total_shipping_subsidy AS order_total_shipping_subsidy
    , line_refund_shipping_subsidy AS line_shipping_subsidy
    , fps_stock_point_id
    , business_entity
    , payment_currency_conversion_rate
  FROM lines_with_calculations
  WHERE refund_date IS NOT NULL

), finance_line_transactions AS (

  SELECT
      *
  FROM sale_transactions
  UNION ALL
  SELECT
      *
  FROM return_transactions
  UNION ALL
  SELECT
      *
  FROM refund_transactions

), order_lines_with_transactions_in_month AS (

  SELECT DISTINCT order_line_id
  FROM finance_line_transactions
  WHERE transaction_date BETWEEN '2023-11-01' AND '2023-11-30'

), final AS (

SELECT
    cast(
    timestamp_trunc(
        cast(transaction_date as timestamp),
        month
    )

 AS date) AS transaction_month
  , transaction_date BETWEEN '2023-11-01' AND '2023-11-30' AS transaction_is_in_reporting_month
  , finance_line_transactions.stadium_order_id
  , finance_line_transactions.order_line_id
  , finance_line_transactions.serial_number
  , finance_line_transactions.transaction_type
  , finance_line_transactions.transaction_date
  , finance_line_transactions.order_date
  , finance_line_transactions.sales_channel_level_1
  , finance_line_transactions.sales_channel_level_2
  , CASE WHEN finance_line_transactions.payment_id IS NULL THEN trans.transaction_id ELSE finance_line_transactions.payment_id END AS payment_id
  , finance_line_transactions.geography_type
  , finance_line_transactions.us_state
  , finance_line_transactions.us_city
  , finance_line_transactions.us_postcode
  , finance_line_transactions.reporting_status
  , finance_line_transactions.inventory_relationship
  , finance_line_transactions.inventory_type
  , finance_line_transactions.inventory_seller
  , finance_line_transactions.product_sku
  , finance_line_transactions.simple_sku
  , finance_line_transactions.product_brand
  , finance_line_transactions.quantity
  , finance_line_transactions.currency
  , finance_line_transactions.serial_price
  , finance_line_transactions.channel_upcharge
  , finance_line_transactions.product_sales_price
  , finance_line_transactions.basket_promo
  , finance_line_transactions.item_basket_price_ex_tax
  , finance_line_transactions.shipping_revenue
  , finance_line_transactions.shipping_promo
  , finance_line_transactions.basket_price_ex_tax
  , finance_line_transactions.sales_tax
  , finance_line_transactions.total_amount_paid
  , finance_line_transactions._1p_cogs
  , finance_line_transactions._3p_consignor_payout
  , finance_line_transactions.refund_date
  , finance_line_transactions.refund_id
  , finance_line_transactions.returned_refunds_accrual
  , finance_line_transactions.return_date
  , finance_line_transactions.return_outcome
  , finance_line_transactions.serial_order_match
  , finance_line_transactions.return_intake_creation_nyc
  , finance_line_transactions.return_intake_id
  , finance_line_transactions.new_serial_from_return
  , finance_line_transactions.new_serial_inventory_relationship
  , finance_line_transactions.x3_return_creation_nyc
  , finance_line_transactions.x3_return_id
  , finance_line_transactions.rma_package_approved_nyc
  , finance_line_transactions.rma_closed_nyc
  , finance_line_transactions.mag_rma_ids
  , finance_line_transactions.rma_statuses
  , finance_line_transactions.issued_serial_next_journal_date_after_dispatch_date
  , finance_line_transactions.issued_serial_next_journal_document_id_after_dispatch_date
  , finance_line_transactions.reporting_date
  , finance_line_transactions.order_total_shipping_subsidy
  , finance_line_transactions.line_shipping_subsidy
  , finance_line_transactions.fps_stock_point_id
  , finance_line_transactions.business_entity
  , finance_line_transactions.payment_currency_conversion_rate
  , cast('2023-11-30' AS date) AS month_ending
  , cast('2023-12-05' AS date) AS snapshot_date
  , (order_lines_with_transactions_in_month.order_line_id IS NOT NULL) AS order_line_has_transaction_in_reporting_month
FROM finance_line_transactions
LEFT JOIN order_lines_with_transactions_in_month
  ON finance_line_transactions.order_line_id = order_lines_with_transactions_in_month.order_line_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_transactions` trans 
  ON finance_line_transactions.stadium_order_id = trans.mag_order_id

)

SELECT * FROM final




)
SELECT transaction_month, transaction_is_in_reporting_month, stadium_order_id, order_line_id, serial_number, transaction_type, transaction_date, order_date, sales_channel_level_1, sales_channel_level_2, payment_id, geography_type, us_state, us_city, us_postcode, reporting_status, inventory_relationship, inventory_type, inventory_seller, product_sku, product_brand, quantity, currency, serial_price, channel_upcharge, product_sales_price, basket_promo, item_basket_price_ex_tax, shipping_revenue, shipping_promo, basket_price_ex_tax, sales_tax, total_amount_paid, _1p_cogs, _3p_consignor_payout, refund_date, refund_id, return_date, return_outcome, serial_order_match, return_intake_creation_nyc, return_intake_id, new_serial_from_return, new_serial_inventory_relationship, x3_return_creation_nyc, x3_return_id, rma_package_approved_nyc, rma_closed_nyc, mag_rma_ids, rma_statuses, issued_serial_next_journal_date_after_dispatch_date, issued_serial_next_journal_document_id_after_dispatch_date, reporting_date, order_line_has_transaction_in_reporting_month, order_total_shipping_subsidy, line_shipping_subsidy, fps_stock_point_id, business_entity, payment_currency_conversion_rate, month_ending, snapshot_date
FROM macro_result