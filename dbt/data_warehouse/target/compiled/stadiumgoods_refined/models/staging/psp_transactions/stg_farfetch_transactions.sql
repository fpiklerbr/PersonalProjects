/*
  TODO for DE-3487: update docs
*/

WITH order_totals AS (

  SELECT
    fps_order_id
    
    , min(payment_processed_at) AS payment_processed_at
    , min(payment_posted_date) AS payment_posted_date
    , min(payment_currency_conversion_date) AS payment_currency_conversion_date
    , coalesce(max(financial_payment_file_time), max(fps_payment_file_time)) AS payment_file_time
    , CASE
        WHEN count(financial_payment_item_quantity) > 0
        THEN cast('Farfetch Financials' AS string)
        ELSE cast('Farfetch API' AS string)
      END AS payment_data_source
    , sum(fps_payment_item_quantity) AS fps_payment_item_quantity
    , sum(financial_payment_item_quantity) AS financial_payment_item_quantity
    , sum(payment_item_price) AS payment_item_price
    , sum(payment_item_discount) AS payment_item_discount, sum(payment_item_tax) AS payment_item_tax, sum(payment_item_duties) AS payment_item_duties, sum(payment_shipping_price) AS payment_shipping_price, sum(payment_shipping_tax) AS payment_shipping_tax, sum(payment_adjustments) AS payment_adjustments, sum(payment_effective_commission) AS payment_effective_commission, sum(payment_marketing_discounts_co_payment) AS payment_marketing_discounts_co_payment, sum(payment_credit_card_fee) AS payment_credit_card_fee, sum(payment_shipping_subsidy) AS payment_shipping_subsidy, sum(payment_partner_contribution_on_shipping) AS payment_partner_contribution_on_shipping, sum(payment_free_return_contribution) AS payment_free_return_contribution, sum(payment_no_stock_vouchers) AS payment_no_stock_vouchers, sum(payment_special_payments) AS payment_special_payments, sum(payment_pricing_difference_capture) AS payment_pricing_difference_capture
    , sum(payment_item_price_base_amount) AS payment_item_price_base_amount
    , sum(payment_item_discount_base_amount) AS payment_item_discount_base_amount, sum(payment_item_tax_base_amount) AS payment_item_tax_base_amount, sum(payment_item_duties_base_amount) AS payment_item_duties_base_amount, sum(payment_shipping_price_base_amount) AS payment_shipping_price_base_amount, sum(payment_shipping_tax_base_amount) AS payment_shipping_tax_base_amount, sum(payment_adjustments_base_amount) AS payment_adjustments_base_amount, sum(payment_effective_commission_base_amount) AS payment_effective_commission_base_amount, sum(payment_marketing_discounts_co_payment_base_amount) AS payment_marketing_discounts_co_payment_base_amount, sum(payment_credit_card_fee_base_amount) AS payment_credit_card_fee_base_amount, sum(payment_shipping_subsidy_base_amount) AS payment_shipping_subsidy_base_amount, sum(payment_partner_contribution_on_shipping_base_amount) AS payment_partner_contribution_on_shipping_base_amount, sum(payment_free_return_contribution_base_amount) AS payment_free_return_contribution_base_amount, sum(payment_no_stock_vouchers_base_amount) AS payment_no_stock_vouchers_base_amount, sum(payment_special_payments_base_amount) AS payment_special_payments_base_amount, sum(payment_pricing_difference_capture_base_amount) AS payment_pricing_difference_capture_base_amount
    , min(refund_processed_at) AS refund_processed_at
    , min(refund_posted_date) AS refund_posted_date
    , min(refund_currency_conversion_date) AS refund_currency_conversion_date
    , coalesce(max(financial_refund_file_time), max(fps_refund_file_time)) AS refund_file_time
    , CASE
        WHEN count(financial_refund_item_quantity) > 0
        THEN cast('Farfetch Financials' AS string)
        ELSE cast('Farfetch API' AS string)
      END AS refund_data_source
    , sum(fps_refund_item_quantity) AS fps_refund_item_quantity
    , sum(financial_refund_item_quantity) AS financial_refund_item_quantity
    , sum(refund_item_price) AS refund_item_price
    , sum(refund_item_discount) AS refund_item_discount, sum(refund_item_tax) AS refund_item_tax, sum(refund_item_duties) AS refund_item_duties, sum(refund_shipping_price) AS refund_shipping_price, sum(refund_shipping_tax) AS refund_shipping_tax, sum(refund_adjustments) AS refund_adjustments, sum(refund_effective_commission) AS refund_effective_commission, sum(refund_marketing_discounts_co_payment) AS refund_marketing_discounts_co_payment, sum(refund_credit_card_fee) AS refund_credit_card_fee, sum(refund_shipping_subsidy) AS refund_shipping_subsidy, sum(refund_partner_contribution_on_shipping) AS refund_partner_contribution_on_shipping, sum(refund_free_return_contribution) AS refund_free_return_contribution, sum(refund_no_stock_vouchers) AS refund_no_stock_vouchers, sum(refund_special_payments) AS refund_special_payments, sum(refund_pricing_difference_capture) AS refund_pricing_difference_capture
    , sum(refund_item_price_base_amount) AS refund_item_price_base_amount
    , sum(refund_item_discount_base_amount) AS refund_item_discount_base_amount, sum(refund_item_tax_base_amount) AS refund_item_tax_base_amount, sum(refund_item_duties_base_amount) AS refund_item_duties_base_amount, sum(refund_shipping_price_base_amount) AS refund_shipping_price_base_amount, sum(refund_shipping_tax_base_amount) AS refund_shipping_tax_base_amount, sum(refund_adjustments_base_amount) AS refund_adjustments_base_amount, sum(refund_effective_commission_base_amount) AS refund_effective_commission_base_amount, sum(refund_marketing_discounts_co_payment_base_amount) AS refund_marketing_discounts_co_payment_base_amount, sum(refund_credit_card_fee_base_amount) AS refund_credit_card_fee_base_amount, sum(refund_shipping_subsidy_base_amount) AS refund_shipping_subsidy_base_amount, sum(refund_partner_contribution_on_shipping_base_amount) AS refund_partner_contribution_on_shipping_base_amount, sum(refund_free_return_contribution_base_amount) AS refund_free_return_contribution_base_amount, sum(refund_no_stock_vouchers_base_amount) AS refund_no_stock_vouchers_base_amount, sum(refund_special_payments_base_amount) AS refund_special_payments_base_amount, sum(refund_pricing_difference_capture_base_amount) AS refund_pricing_difference_capture_base_amount
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`fps_order_items` AS fps
  GROUP BY 1

), headers_with_totals AS (

  SELECT
      order_totals.*
    , order_headers.`fps_stock_point_id`,
  order_headers.`farfetch_order_id`,
  order_headers.`fps_tenant_id`,
  order_headers.`fps_channel_id`,
  order_headers.`fps_order_code`,
  order_headers.`farfetch_order_created_at`,
  order_headers.`customer_email`,
  order_headers.`customer_country`,
  order_headers.`customer_country_id`,
  order_headers.`promo_code`,
  order_headers.`order_shipping_price_base_amount`,
  order_headers.`order_shipping_tax_base_amount`,
  order_headers.`sales_flat_order_id`,
  order_headers.`mag_order_id`,
  order_headers.`order_base_currency`,
  order_headers.`base_currency`,
  order_headers.`is_excluded_from_financial_reporting`,
  order_headers.`fps_merchant_name`,
  order_headers.`business_unit`,
  order_headers.`sales_channel`,
  order_headers.`channel_or_gateway`,
  order_headers.`shipping_is_withheld`,
  order_headers.`duties_are_withheld`,
  order_headers.`geography_type`,
  order_headers.`geography`
    , CASE
        WHEN order_totals.payment_processed_at IS NOT NULL
        THEN cast('Approved' AS string)
        ELSE cast('Not Approved' AS string)
      END AS checkout_status
    , CASE
        WHEN order_totals.payment_data_source = 'Farfetch Financials' OR order_totals.refund_data_source = 'Farfetch Financials'
        THEN cast('Settled' AS string)
        ELSE cast('Not Settled' AS string)
      END AS transaction_state
    , nullif(
     least(
      coalesce(order_totals.payment_posted_date, CAST('9999-12-31' AS date))
      ,coalesce(order_totals.refund_posted_date, CAST('9999-12-31' AS date))
      
      )
     , CAST('9999-12-31' AS date)
  ) AS settlement_date
    , nullif(
     greatest(
      coalesce(order_totals.payment_file_time, CAST('0001-01-01 00:00:00' AS timestamp))
      ,coalesce(order_totals.refund_file_time, CAST('0001-01-01 00:00:00' AS timestamp))
      
      )
     , CAST('0001-01-01 00:00:00' AS timestamp)
  ) AS file_time
    , CASE
        WHEN order_totals.payment_data_source = 'Farfetch Financials' OR order_totals.refund_data_source = 'Farfetch Financials'
        THEN cast('Farfetch Financials' AS string)
        ELSE cast('Farfetch API' AS string)
      END AS data_source
    , CASE
        WHEN order_totals.payment_processed_at IS NOT NULL
        THEN
            coalesce(order_totals.payment_item_price, 0)
          + (CASE WHEN order_headers.fps_stock_point_id = '14376' THEN 0
            ELSE coalesce(order_totals.payment_item_discount, 0)
                END)
          + coalesce(order_totals.payment_item_tax, 0)
          + coalesce(CASE WHEN order_headers.shipping_is_withheld IS FALSE THEN order_totals.payment_shipping_price END, 0)
          + (CASE WHEN order_headers.fps_stock_point_id = '14376' THEN 0
                ELSE coalesce(CASE WHEN order_headers.shipping_is_withheld IS FALSE THEN order_totals.payment_shipping_tax END, 0)
                END)
          + coalesce(CASE WHEN order_headers.duties_are_withheld IS FALSE THEN order_totals.payment_item_duties END, 0)
          + coalesce( payment_adjustments, 0)
      END * 1 AS payment_amount
    , CASE
        WHEN payment_data_source = 'Farfetch Financials'
        THEN
            coalesce(order_totals.payment_effective_commission, 0)
          + coalesce(order_totals.payment_marketing_discounts_co_payment, 0)
          + coalesce(order_totals.payment_credit_card_fee, 0)
          + coalesce(order_totals.payment_partner_contribution_on_shipping, 0)
          + coalesce(order_totals.payment_free_return_contribution, 0)
          + coalesce(order_totals.payment_no_stock_vouchers, 0)
          + coalesce(order_totals.payment_special_payments, 0)
          + coalesce(order_totals.payment_pricing_difference_capture, 0)
      END AS payment_fee
    , CASE
        WHEN order_totals.refund_processed_at IS NOT NULL
        THEN
            coalesce(order_totals.refund_item_price, 0)
          + (CASE WHEN order_headers.fps_stock_point_id = '14376' THEN 0
            ELSE coalesce(order_totals.refund_item_discount, 0)
                END)
          + coalesce(order_totals.refund_item_tax, 0)
          + coalesce(CASE WHEN order_headers.shipping_is_withheld IS FALSE THEN order_totals.refund_shipping_price END, 0)
          + (CASE WHEN order_headers.fps_stock_point_id = '14376' THEN 0
                ELSE coalesce(CASE WHEN order_headers.shipping_is_withheld IS FALSE THEN order_totals.refund_shipping_tax END, 0)
                END)
          + coalesce(CASE WHEN order_headers.duties_are_withheld IS FALSE THEN order_totals.refund_item_duties END, 0)
          + coalesce( refund_adjustments, 0)
      END * -1 AS refund_amount
    , CASE
        WHEN refund_data_source = 'Farfetch Financials'
        THEN
            coalesce(order_totals.refund_effective_commission, 0)
          + coalesce(order_totals.refund_marketing_discounts_co_payment, 0)
          + coalesce(order_totals.refund_credit_card_fee, 0)
          + coalesce(order_totals.refund_partner_contribution_on_shipping, 0)
          + coalesce(order_totals.refund_free_return_contribution, 0)
          + coalesce(order_totals.refund_no_stock_vouchers, 0)
          + coalesce(order_totals.refund_special_payments, 0)
          + coalesce(order_totals.refund_pricing_difference_capture, 0)
      END AS refund_fee

    , order_totals.payment_item_price AS total_item_price
    , (-1 * order_totals.payment_item_discount) AS total_item_discount
    , order_totals.payment_item_tax AS total_item_tax
    , order_totals.payment_shipping_price AS shipping_price_charged
    , CASE WHEN order_headers.shipping_is_withheld IS NOT FALSE THEN order_totals.payment_shipping_price ELSE 0 END AS shipping_price_withheld
    , CASE WHEN order_headers.shipping_is_withheld IS FALSE THEN order_totals.payment_shipping_price ELSE 0 END AS shipping_price
    , cast(0 AS float64) AS shipping_discount
    , order_totals.payment_shipping_tax AS shipping_tax_charged
    , CASE WHEN order_headers.shipping_is_withheld IS NOT FALSE THEN payment_shipping_tax ELSE 0 END AS shipping_tax_withheld
    , CASE WHEN order_headers.shipping_is_withheld IS FALSE THEN payment_shipping_tax ELSE 0 END AS shipping_tax
    , order_totals.payment_item_duties AS duties_charged
    , CASE WHEN order_headers.duties_are_withheld IS NOT FALSE THEN order_totals.payment_item_duties ELSE 0 END AS duties_withheld
    , CASE WHEN order_headers.duties_are_withheld IS FALSE THEN order_totals.payment_item_duties ELSE 0 END AS duties
    , CASE
        WHEN order_totals.payment_processed_at IS NOT NULL
        THEN
            coalesce(order_totals.payment_item_price_base_amount, 0)
          + (CASE WHEN order_headers.fps_stock_point_id = '14376' THEN 0
            ELSE coalesce(order_totals.payment_item_discount_base_amount, 0)
                END)
          + coalesce(order_totals.payment_item_tax_base_amount, 0)
          + coalesce(CASE WHEN order_headers.shipping_is_withheld IS FALSE THEN order_totals.payment_shipping_price_base_amount END, 0)
          + (CASE WHEN order_headers.fps_stock_point_id = '14376' THEN 0
                ELSE coalesce(CASE WHEN order_headers.shipping_is_withheld IS FALSE THEN order_totals.payment_shipping_tax_base_amount END, 0)
                END)
          + coalesce(CASE WHEN order_headers.duties_are_withheld IS FALSE THEN order_totals.payment_item_duties_base_amount END, 0)
          + coalesce( payment_adjustments_base_amount, 0)
      END * 1 AS payment_base_amount
    , CASE
        WHEN payment_data_source = 'Farfetch Financials'
        THEN
            coalesce(order_totals.payment_effective_commission_base_amount, 0)
          + coalesce(order_totals.payment_marketing_discounts_co_payment_base_amount, 0)
          + coalesce(order_totals.payment_credit_card_fee_base_amount, 0)
          + coalesce(order_totals.payment_partner_contribution_on_shipping_base_amount, 0)
          + coalesce(order_totals.payment_free_return_contribution_base_amount, 0)
          + coalesce(order_totals.payment_no_stock_vouchers_base_amount, 0)
          + coalesce(order_totals.payment_special_payments_base_amount, 0)
          + coalesce(order_totals.payment_pricing_difference_capture_base_amount, 0)
      END AS payment_fee_base_amount
    , CASE
        WHEN order_totals.refund_processed_at IS NOT NULL
        THEN
            coalesce(order_totals.refund_item_price_base_amount, 0)
          + (CASE WHEN order_headers.fps_stock_point_id = '14376' THEN 0
            ELSE coalesce(order_totals.refund_item_discount_base_amount, 0)
                END)
          + coalesce(order_totals.refund_item_tax_base_amount, 0)
          + coalesce(CASE WHEN order_headers.shipping_is_withheld IS FALSE THEN order_totals.refund_shipping_price_base_amount END, 0)
          + (CASE WHEN order_headers.fps_stock_point_id = '14376' THEN 0
                ELSE coalesce(CASE WHEN order_headers.shipping_is_withheld IS FALSE THEN order_totals.refund_shipping_tax_base_amount END, 0)
                END)
          + coalesce(CASE WHEN order_headers.duties_are_withheld IS FALSE THEN order_totals.refund_item_duties_base_amount END, 0)
          + coalesce( refund_adjustments_base_amount, 0)
      END * -1 AS refund_base_amount
    , CASE
        WHEN refund_data_source = 'Farfetch Financials'
        THEN
            coalesce(order_totals.refund_effective_commission_base_amount, 0)
          + coalesce(order_totals.refund_marketing_discounts_co_payment_base_amount, 0)
          + coalesce(order_totals.refund_credit_card_fee_base_amount, 0)
          + coalesce(order_totals.refund_partner_contribution_on_shipping_base_amount, 0)
          + coalesce(order_totals.refund_free_return_contribution_base_amount, 0)
          + coalesce(order_totals.refund_no_stock_vouchers_base_amount, 0)
          + coalesce(order_totals.refund_special_payments_base_amount, 0)
          + coalesce(order_totals.refund_pricing_difference_capture_base_amount, 0)
      END AS refund_fee_base_amount

    , order_totals.payment_item_price_base_amount AS total_item_price_base_amount
    , (-1 * order_totals.payment_item_discount_base_amount) AS total_item_discount_base_amount
    , order_totals.payment_item_tax_base_amount AS total_item_tax_base_amount
    , order_totals.payment_shipping_price_base_amount AS shipping_price_charged_base_amount
    , CASE WHEN order_headers.shipping_is_withheld IS NOT FALSE THEN order_totals.payment_shipping_price_base_amount ELSE 0 END AS shipping_price_withheld_base_amount
    , CASE WHEN order_headers.shipping_is_withheld IS FALSE THEN order_totals.payment_shipping_price_base_amount ELSE 0 END AS shipping_price_base_amount
    , cast(0 AS float64) AS shipping_discount_base_amount
    , order_totals.payment_shipping_tax_base_amount AS shipping_tax_charged_base_amount
    , CASE WHEN order_headers.shipping_is_withheld IS NOT FALSE THEN payment_shipping_tax_base_amount ELSE 0 END AS shipping_tax_withheld_base_amount
    , CASE WHEN order_headers.shipping_is_withheld IS FALSE THEN payment_shipping_tax_base_amount ELSE 0 END AS shipping_tax_base_amount
    , order_totals.payment_item_duties_base_amount AS duties_charged_base_amount
    , CASE WHEN order_headers.duties_are_withheld IS NOT FALSE THEN order_totals.payment_item_duties_base_amount ELSE 0 END AS duties_withheld_base_amount
    , CASE WHEN order_headers.duties_are_withheld IS FALSE THEN order_totals.payment_item_duties_base_amount ELSE 0 END AS duties_base_amount
  FROM order_totals
  FULL JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`fps_orders` AS order_headers
    ON order_totals.fps_order_id = order_headers.fps_order_id

), final AS (

  SELECT
      *
    , fps_order_id AS transaction_id
    , cast(settlement_date AS string) AS settlement_id
    , current_timestamp AS rebuild_timestamp
  FROM headers_with_totals

)

SELECT * FROM final