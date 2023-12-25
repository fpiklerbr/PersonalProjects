

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_farfetch_financial_v2_order_headers`
  
  
  OPTIONS()
  as (
    SELECT
    headers.fps_order_id
  , string_agg(DISTINCT headers.fps_tenant_id, ', ') AS fps_tenant_id
  , string_agg(DISTINCT headers.fps_stock_point_id, ', ') AS fps_stock_point_id
  , string_agg(DISTINCT headers.fps_channel_id, ', ') AS fps_channel_id
  , string_agg(DISTINCT headers.customer_country, ', ') AS customer_country
  , string_agg(DISTINCT headers.tax_non_tax, ', ') AS tax_non_tax
  , string_agg(DISTINCT headers.courier_name, ', ') AS courier_name
  , string_agg(DISTINCT headers.tracking_number, ', ') AS tracking_number

  , min(
      CASE
        WHEN headers.transaction_description = 'payment'
        THEN headers.transaction_processed_at
      END
    ) AS payment_processed_at
  , max(
      CASE
        WHEN headers.transaction_description = 'payment'
        THEN headers.file_time
      END
    ) AS payment_file_time
  , string_agg(DISTINCT
        CASE
          WHEN headers.transaction_description = 'payment'
          THEN headers.file_name
        END
      , ', '
    ) AS payment_file_name
  , string_agg(DISTINCT
        CASE
          WHEN headers.transaction_description = 'payment'
          THEN headers.transaction_type
        END
      , ', '
    ) AS payment_transaction_type
  , sum(
      CASE
        WHEN headers.transaction_description = 'payment'
        THEN headers.shipping_price_base_amount
      END
    ) AS order_payment_shipping_price_base_amount
  , sum(
      CASE
        WHEN headers.transaction_description = 'payment'
        THEN headers.adjustments_base_amount
      END
    ) AS order_payment_adjustments_base_amount
  , sum(
      CASE
        WHEN headers.transaction_description = 'payment'
        THEN headers.credit_card_fee_base_amount
      END
    ) AS order_payment_credit_card_fee_base_amount
  , sum(
      CASE
        WHEN headers.transaction_description = 'payment'
        THEN headers.partner_contribution_on_shipping_base_amount
      END
    ) AS order_payment_partner_contribution_on_shipping_base_amount
  , sum(
      CASE
        WHEN headers.transaction_description = 'payment'
        THEN headers.special_payments_base_amount
      END
    ) AS order_payment_special_payments_base_amount

  , min(
      CASE
        WHEN headers.transaction_description = 'refund'
        THEN headers.transaction_processed_at
      END
    ) AS refund_processed_at
  , max(
      CASE
        WHEN headers.transaction_description = 'refund'
        THEN headers.file_time
      END
    ) AS refund_file_time
  , string_agg(DISTINCT
        CASE
          WHEN headers.transaction_description = 'refund'
          THEN headers.file_name
        END
      , ', '
    ) AS refund_file_name
  , string_agg(DISTINCT
        CASE
          WHEN headers.transaction_description = 'refund'
          THEN headers.transaction_type
        END
      , ', '
    ) AS refund_transaction_type
  , sum(
      CASE
        WHEN headers.transaction_description = 'refund'
        THEN headers.shipping_price_base_amount
      END
    ) AS order_refund_shipping_price_base_amount
  , sum(
      CASE
        WHEN headers.transaction_description = 'refund'
        THEN headers.adjustments_base_amount
      END
    ) AS order_refund_adjustments_base_amount
  , sum(
      CASE
        WHEN headers.transaction_description = 'refund'
        THEN headers.credit_card_fee_base_amount
      END
    ) AS order_refund_credit_card_fee_base_amount
  , sum(
      CASE
        WHEN headers.transaction_description = 'refund'
        THEN headers.partner_contribution_on_shipping_base_amount
      END
    ) AS order_refund_partner_contribution_on_shipping_base_amount
  , sum(
      CASE
        WHEN headers.transaction_description = 'refund'
        THEN headers.special_payments_base_amount
      END
    ) AS order_refund_special_payments_base_amount

FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__financial_v2_order` AS headers
INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_farfetch_financial_v2_current_order_reports` AS current_reports
  ON headers.file_name = current_reports.file_name
WHERE headers.entry_type = 'Header'
  AND headers.transaction_type IS NOT NULL
GROUP BY 1
  );
    