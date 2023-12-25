

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_paypal_transactions`
  
  
  OPTIONS()
  as (
    

WITH no_tax AS (

  SELECT
      transaction_id
    , mag_order_id
    , CASE WHEN is_ebay = TRUE THEN 'eBay' ELSE 'Paypal' END AS channel_or_gateway
    , data_source
    , transaction_state
    , checkout_status
    , sum( payment_amount ) AS payment_amount
    , min( payment_processed_at ) AS payment_processed_at
    , sum( payment_fee ) AS payment_fee
    , sum( refund_amount ) AS refund_amount
    , min( refund_processed_at ) AS refund_processed_at
    , sum( refund_fee ) AS refund_fee
    , min(settlement_date) AS settlement_date
    , max(file_time) AS file_time
    , string_agg(settlement_id, ',') AS settlement_id
    , current_timestamp rebuild_timestamp
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_paypal_all_transactions`
  WHERE (has_mag_order OR is_ebay)
    AND NOT is_braintree
    AND transaction_event <> 'Tax Collected by Partner'
  GROUP BY 1, 2, 3, 4, 5, 6

), tax AS (

  SELECT
      mag_order_id
    , sum( payment_amount ) AS payment_amount
    , min( payment_processed_at ) AS payment_processed_at
    , sum( payment_fee ) AS payment_fee
    , sum( refund_amount ) AS refund_amount
    , min( refund_processed_at ) AS refund_processed_at
    , sum( refund_fee ) AS refund_fee    , min(settlement_date) AS settlement_date
    , max(file_time) AS file_time
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_paypal_all_transactions`
  WHERE (has_mag_order OR is_ebay)
    AND NOT is_braintree
    AND transaction_event = 'Tax Collected by Partner'
  GROUP BY 1

), no_tax_with_window AS (

  SELECT *
    , row_number() OVER (PARTITION BY mag_order_id ORDER BY payment_processed_at NULLS LAST) AS order_payment_row
    , row_number() OVER (PARTITION BY mag_order_id ORDER BY refund_processed_at NULLS LAST) AS order_refund_row
  FROM no_tax

), tax_relabeled AS (

  SELECT
      mag_order_id
    , tax.refund_amount AS sales_tax_collected
    , tax.payment_amount AS sales_tax_returned
  FROM tax

), final AS (

  SELECT
      no_tax_with_window.transaction_id
    , no_tax_with_window.mag_order_id
    , no_tax_with_window.settlement_id
    , no_tax_with_window.channel_or_gateway
    , no_tax_with_window.data_source
    , no_tax_with_window.transaction_state
    , no_tax_with_window.checkout_status
    , no_tax_with_window.payment_amount - coalesce(CASE WHEN no_tax_with_window.order_payment_row = 1 THEN tax_relabeled.sales_tax_collected END, 0) AS payment_amount
    , no_tax_with_window.payment_processed_at
    , no_tax_with_window.payment_fee
    , no_tax_with_window.refund_amount - coalesce(CASE WHEN no_tax_with_window.order_refund_row = 1 THEN tax_relabeled.sales_tax_returned END, 0) AS refund_amount
    , no_tax_with_window.refund_processed_at
    , no_tax_with_window.refund_fee
    , no_tax_with_window.settlement_date
    , no_tax_with_window.file_time
    , CASE WHEN no_tax_with_window.order_payment_row = 1 THEN tax_relabeled.sales_tax_collected END AS sales_tax_collected
    , no_tax_with_window.payment_amount AS payment_amount_including_sales_tax_collected
    , CASE WHEN no_tax_with_window.order_refund_row = 1 THEN tax_relabeled.sales_tax_returned END AS sales_tax_returned
    , no_tax_with_window.refund_amount AS refund_amount_including_sales_tax_returned
    , CASE
        WHEN no_tax_with_window.channel_or_gateway = 'eBay'
        THEN 'eBay'
        ELSE 'SG Web'
      END AS sales_channel
    , current_timestamp AS rebuild_timestamp
  FROM no_tax_with_window
  LEFT JOIN tax_relabeled
    ON no_tax_with_window.mag_order_id = tax_relabeled.mag_order_id

)

SELECT * FROM final
  );
    