

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`fps_order_items`
  
  
  OPTIONS()
  as (
    /*
  TODO for DE-3487: add docs
*/

WITH fps_items AS (

  SELECT
      order_lines.fps_order_id
    , order_lines.fps_parent_product_id
    , order_lines.fps_product_size
    , order_headers.order_shipping_price_base_amount AS order_total_shipping_price_base_amount
    , order_headers.order_shipping_tax_base_amount AS order_total_shipping_tax_base_amount
    , string_agg(order_lines.farfetch_order_line_id, ', ') AS farfetch_order_line_ids, string_agg(DISTINCT CASE WHEN order_lines.has_payment THEN order_lines.farfetch_order_line_id END, ', ') AS payment_line_ids
    , min(CASE WHEN order_lines.has_payment THEN order_headers.farfetch_order_created_at END) AS payment_processed_at
    , max(CASE WHEN order_lines.has_payment THEN order_lines.fps_order_line_file_time END) AS payment_file_time
    , sum(CASE WHEN order_lines.has_payment THEN 1 * order_lines.item_quantity END) AS payment_item_quantity
    , sum(CASE WHEN order_lines.has_payment THEN 1 * order_lines.item_price_base_amount END) AS payment_item_price_base_amount
    , sum(CASE WHEN order_lines.has_payment THEN 1 * (-1 * order_lines.item_discount_base_amount) END) AS payment_item_discount_base_amount
    , sum(CASE WHEN order_lines.has_payment THEN 1 * order_lines.item_tax_base_amount END) AS payment_item_tax_base_amount
    , sum(CASE WHEN order_lines.has_payment THEN 1 * order_lines.item_duties_base_amount END) AS payment_item_duties_base_amount, string_agg(DISTINCT CASE WHEN order_lines.has_refund THEN order_lines.farfetch_order_line_id END, ', ') AS refund_line_ids
    , min(CASE WHEN order_lines.has_refund THEN order_headers.farfetch_order_created_at END) AS refund_processed_at
    , max(CASE WHEN order_lines.has_refund THEN order_lines.fps_order_line_file_time END) AS refund_file_time
    , sum(CASE WHEN order_lines.has_refund THEN -1 * order_lines.item_quantity END) AS refund_item_quantity
    , sum(CASE WHEN order_lines.has_refund THEN -1 * order_lines.item_price_base_amount END) AS refund_item_price_base_amount
    , sum(CASE WHEN order_lines.has_refund THEN -1 * (-1 * order_lines.item_discount_base_amount) END) AS refund_item_discount_base_amount
    , sum(CASE WHEN order_lines.has_refund THEN -1 * order_lines.item_tax_base_amount END) AS refund_item_tax_base_amount
    , sum(CASE WHEN order_lines.has_refund THEN -1 * order_lines.item_duties_base_amount END) AS refund_item_duties_base_amount

    , string_agg(DISTINCT CASE WHEN order_lines.is_fps_return THEN order_lines.farfetch_order_line_id END, ', ') AS return_line_ids
    , string_agg(DISTINCT CASE WHEN order_lines.is_fps_return THEN order_lines.fps_return_id END, ', ') AS fps_return_id
    , min(CASE WHEN order_lines.is_fps_return THEN order_lines.fps_return_created_at END) AS return_timestamp
    , max(CASE WHEN order_lines.is_fps_return THEN order_lines.fps_return_file_time END) AS return_file_time
    , sum(CASE WHEN order_lines.is_fps_return THEN -1 * order_lines.item_quantity END) AS return_item_quantity

    , sum(CASE WHEN order_lines.mag_order_is_expected THEN 1 ELSE 0 END) > 0 AS mag_order_is_expected
    , array_agg(DISTINCT order_lines.order_item_id
        IGNORE NULLS) AS order_item_ids
    , string_agg(DISTINCT order_lines.tracking_number, ', ') AS tracking_number
    , string_agg(DISTINCT order_lines.farfetch_order_status_id, ', ') AS farfetch_order_status_id
    , string_agg(DISTINCT order_lines.farfetch_order_status, ', ') AS farfetch_order_status
    , 'fps' as data_source

  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`fps_order_lines` AS order_lines
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`fps_orders` AS order_headers
    ON order_lines.fps_order_id = order_headers.fps_order_id
  GROUP BY 1, 2, 3, 4, 5

), fps_items_with_window AS (

  SELECT
      *
    , order_total_shipping_price_base_amount * (cast(payment_item_quantity AS float64) / sum(payment_item_quantity) OVER (PARTITION BY fps_order_id)) AS payment_shipping_price_base_amount
    , order_total_shipping_tax_base_amount * (cast(payment_item_quantity AS float64) / sum(payment_item_quantity) OVER (PARTITION BY fps_order_id)) AS payment_shipping_tax_base_amount
    , -1 * order_total_shipping_price_base_amount * (cast(refund_item_quantity AS float64) / sum(refund_item_quantity) OVER (PARTITION BY fps_order_id)) AS refund_shipping_price_base_amount
    , -1 * order_total_shipping_tax_base_amount * (cast(refund_item_quantity AS float64) / sum(refund_item_quantity) OVER (PARTITION BY fps_order_id)) AS refund_shipping_tax_base_amount
  FROM fps_items

), financial_and_fps_items AS (

  SELECT
      coalesce(financial.fps_order_id, fps.fps_order_id) AS fps_order_id
    , coalesce(financial.fps_parent_product_id, fps.fps_parent_product_id) AS fps_parent_product_id
    , coalesce(financial.fps_product_size, fps.fps_product_size) AS fps_product_size
    , fps.farfetch_order_line_ids, fps.payment_item_quantity AS fps_payment_item_quantity
    , financial.payment_item_quantity AS financial_payment_item_quantity
    , fps.payment_file_time AS fps_payment_file_time
    , financial.payment_file_time AS financial_payment_file_time
    , coalesce(
          financial.payment_processed_at
        , fps.payment_processed_at
      ) AS payment_processed_at
    , financial.payment_posted_date AS payment_posted_date
    , coalesce(
          financial.payment_posted_date
        , safe_cast(datetime(safe_cast(financial.payment_processed_at AS timestamp), 
  r'America/New_York'
) AS date)
        , safe_cast(datetime(safe_cast(fps.payment_processed_at AS timestamp), 
  r'America/New_York'
) AS date)
      ) AS payment_currency_conversion_date
    , coalesce(
          financial.payment_item_price_base_amount
        , fps.payment_item_price_base_amount
      ) AS payment_item_price_base_amount
    , coalesce(
          financial.payment_item_discount_base_amount
        , fps.payment_item_discount_base_amount
      ) AS payment_item_discount_base_amount
    , coalesce(
          financial.payment_item_tax_base_amount
        , fps.payment_item_tax_base_amount
      ) AS payment_item_tax_base_amount
    , fps.payment_item_duties_base_amount AS payment_item_duties_base_amount
    , coalesce(
          financial.payment_shipping_price_base_amount
        , fps.payment_shipping_price_base_amount
      ) AS payment_shipping_price_base_amount
    , fps.payment_shipping_tax_base_amount AS payment_shipping_tax_base_amount
    , financial.payment_adjustments_base_amount AS payment_adjustments_base_amount
    , financial.payment_effective_commission_base_amount AS payment_effective_commission_base_amount
    , financial.payment_marketing_discounts_co_payment_base_amount AS payment_marketing_discounts_co_payment_base_amount
    , financial.payment_credit_card_fee_base_amount AS payment_credit_card_fee_base_amount
    , financial.payment_shipping_subsidy_base_amount AS payment_shipping_subsidy_base_amount
    , financial.payment_partner_contribution_on_shipping_base_amount AS payment_partner_contribution_on_shipping_base_amount
    , financial.payment_free_return_contribution_base_amount AS payment_free_return_contribution_base_amount
    , financial.payment_no_stock_vouchers_base_amount AS payment_no_stock_vouchers_base_amount
    , financial.payment_special_payments_base_amount AS payment_special_payments_base_amount
    , financial.payment_pricing_difference_capture_base_amount AS payment_pricing_difference_capture_base_amount, fps.refund_item_quantity AS fps_refund_item_quantity
    , financial.refund_item_quantity AS financial_refund_item_quantity
    , fps.refund_file_time AS fps_refund_file_time
    , financial.refund_file_time AS financial_refund_file_time
    , coalesce(
          financial.refund_processed_at
        , fps.refund_processed_at
      ) AS refund_processed_at
    , financial.refund_posted_date AS refund_posted_date
    , coalesce(
          financial.refund_posted_date
        , safe_cast(datetime(safe_cast(financial.refund_processed_at AS timestamp), 
  r'America/New_York'
) AS date)
        , safe_cast(datetime(safe_cast(fps.refund_processed_at AS timestamp), 
  r'America/New_York'
) AS date)
      ) AS refund_currency_conversion_date
    , coalesce(
          financial.refund_item_price_base_amount
        , fps.refund_item_price_base_amount
      ) AS refund_item_price_base_amount
    , coalesce(
          financial.refund_item_discount_base_amount
        , fps.refund_item_discount_base_amount
      ) AS refund_item_discount_base_amount
    , coalesce(
          financial.refund_item_tax_base_amount
        , fps.refund_item_tax_base_amount
      ) AS refund_item_tax_base_amount
    , fps.refund_item_duties_base_amount AS refund_item_duties_base_amount
    , coalesce(
          financial.refund_shipping_price_base_amount
        , fps.refund_shipping_price_base_amount
      ) AS refund_shipping_price_base_amount
    , fps.refund_shipping_tax_base_amount AS refund_shipping_tax_base_amount
    , financial.refund_adjustments_base_amount AS refund_adjustments_base_amount
    , financial.refund_effective_commission_base_amount AS refund_effective_commission_base_amount
    , financial.refund_marketing_discounts_co_payment_base_amount AS refund_marketing_discounts_co_payment_base_amount
    , financial.refund_credit_card_fee_base_amount AS refund_credit_card_fee_base_amount
    , financial.refund_shipping_subsidy_base_amount AS refund_shipping_subsidy_base_amount
    , financial.refund_partner_contribution_on_shipping_base_amount AS refund_partner_contribution_on_shipping_base_amount
    , financial.refund_free_return_contribution_base_amount AS refund_free_return_contribution_base_amount
    , financial.refund_no_stock_vouchers_base_amount AS refund_no_stock_vouchers_base_amount
    , financial.refund_special_payments_base_amount AS refund_special_payments_base_amount
    , financial.refund_pricing_difference_capture_base_amount AS refund_pricing_difference_capture_base_amount

    , fps.fps_return_id
    , fps.return_timestamp AS fps_return_timestamp
    , fps.return_file_time AS fps_return_file_time
    , fps.return_item_quantity AS fps_return_item_quantity
    , financial.return_timestamp AS financial_return_timestamp
    , financial.return_file_time AS financial_return_file_time
    , financial.return_item_quantity AS financial_return_item_quantity

    , fps.mag_order_is_expected
    , fps.order_item_ids
    , fps.tracking_number AS fps_tracking_number
    , fps.farfetch_order_status_id AS farfetch_order_status_id
    , fps.farfetch_order_status_id AS farfetch_order_status
    , COALESCE(financial.data_source, fps.data_source) as data_source

  FROM fps_items_with_window AS fps
  FULL JOIN (SELECT *, 'financial' AS data_source
        FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_farfetch_financial_order_items`) AS financial
    ON fps.fps_order_id = financial.fps_order_id
    AND fps.fps_parent_product_id = financial.fps_parent_product_id
    AND fps.fps_product_size = financial.fps_product_size

), joined AS (

SELECT
    financial_and_fps_items.*
  , fps_orders.base_currency
  , CASE WHEN fps_orders.base_currency = 'USD' THEN 1.0 ELSE cast( payment_conversion.in_usd AS numeric) END AS payment_currency_conversion_rate
  , round(
        cast(financial_and_fps_items.payment_item_price_base_amount * CASE WHEN fps_orders.base_currency = 'USD' THEN 1.0 ELSE cast( payment_conversion.in_usd AS numeric) END AS numeric)
      , 2
    ) AS payment_item_price
  , round(
        cast(financial_and_fps_items.payment_item_discount_base_amount * CASE WHEN fps_orders.base_currency = 'USD' THEN 1.0 ELSE cast( payment_conversion.in_usd AS numeric) END AS numeric)
      , 2
    ) AS payment_item_discount
  , round(
        cast(financial_and_fps_items.payment_item_tax_base_amount * CASE WHEN fps_orders.base_currency = 'USD' THEN 1.0 ELSE cast( payment_conversion.in_usd AS numeric) END AS numeric)
      , 2
    ) AS payment_item_tax
  , round(
        cast(financial_and_fps_items.payment_item_duties_base_amount * CASE WHEN fps_orders.base_currency = 'USD' THEN 1.0 ELSE cast( payment_conversion.in_usd AS numeric) END AS numeric)
      , 2
    ) AS payment_item_duties
  , round(
        cast(financial_and_fps_items.payment_shipping_price_base_amount * CASE WHEN fps_orders.base_currency = 'USD' THEN 1.0 ELSE cast( payment_conversion.in_usd AS numeric) END AS numeric)
      , 2
    ) AS payment_shipping_price
  , round(
        cast(financial_and_fps_items.payment_shipping_tax_base_amount * CASE WHEN fps_orders.base_currency = 'USD' THEN 1.0 ELSE cast( payment_conversion.in_usd AS numeric) END AS numeric)
      , 2
    ) AS payment_shipping_tax
  , round(
        cast(financial_and_fps_items.payment_adjustments_base_amount * CASE WHEN fps_orders.base_currency = 'USD' THEN 1.0 ELSE cast( payment_conversion.in_usd AS numeric) END AS numeric)
      , 2
    ) AS payment_adjustments
  , round(
        cast(financial_and_fps_items.payment_effective_commission_base_amount * CASE WHEN fps_orders.base_currency = 'USD' THEN 1.0 ELSE cast( payment_conversion.in_usd AS numeric) END AS numeric)
      , 2
    ) AS payment_effective_commission
  , round(
        cast(financial_and_fps_items.payment_marketing_discounts_co_payment_base_amount * CASE WHEN fps_orders.base_currency = 'USD' THEN 1.0 ELSE cast( payment_conversion.in_usd AS numeric) END AS numeric)
      , 2
    ) AS payment_marketing_discounts_co_payment
  , round(
        cast(financial_and_fps_items.payment_credit_card_fee_base_amount * CASE WHEN fps_orders.base_currency = 'USD' THEN 1.0 ELSE cast( payment_conversion.in_usd AS numeric) END AS numeric)
      , 2
    ) AS payment_credit_card_fee
  , round(
        cast(financial_and_fps_items.payment_shipping_subsidy_base_amount * CASE WHEN fps_orders.base_currency = 'USD' THEN 1.0 ELSE cast( payment_conversion.in_usd AS numeric) END AS numeric)
      , 2
    ) AS payment_shipping_subsidy
  , round(
        cast(financial_and_fps_items.payment_partner_contribution_on_shipping_base_amount * CASE WHEN fps_orders.base_currency = 'USD' THEN 1.0 ELSE cast( payment_conversion.in_usd AS numeric) END AS numeric)
      , 2
    ) AS payment_partner_contribution_on_shipping
  , round(
        cast(financial_and_fps_items.payment_free_return_contribution_base_amount * CASE WHEN fps_orders.base_currency = 'USD' THEN 1.0 ELSE cast( payment_conversion.in_usd AS numeric) END AS numeric)
      , 2
    ) AS payment_free_return_contribution
  , round(
        cast(financial_and_fps_items.payment_no_stock_vouchers_base_amount * CASE WHEN fps_orders.base_currency = 'USD' THEN 1.0 ELSE cast( payment_conversion.in_usd AS numeric) END AS numeric)
      , 2
    ) AS payment_no_stock_vouchers
  , round(
        cast(financial_and_fps_items.payment_special_payments_base_amount * CASE WHEN fps_orders.base_currency = 'USD' THEN 1.0 ELSE cast( payment_conversion.in_usd AS numeric) END AS numeric)
      , 2
    ) AS payment_special_payments
  , round(
        cast(financial_and_fps_items.payment_pricing_difference_capture_base_amount * CASE WHEN fps_orders.base_currency = 'USD' THEN 1.0 ELSE cast( payment_conversion.in_usd AS numeric) END AS numeric)
      , 2
    ) AS payment_pricing_difference_capture
  , CASE WHEN fps_orders.base_currency = 'USD' THEN 1.0 ELSE cast( refund_conversion.in_usd AS numeric) END AS refund_currency_conversion_rate
  , round(
        cast(financial_and_fps_items.refund_item_price_base_amount * CASE WHEN fps_orders.base_currency = 'USD' THEN 1.0 ELSE cast( refund_conversion.in_usd AS numeric) END AS numeric)
      , 2
    ) AS refund_item_price
  , round(
        cast(financial_and_fps_items.refund_item_discount_base_amount * CASE WHEN fps_orders.base_currency = 'USD' THEN 1.0 ELSE cast( refund_conversion.in_usd AS numeric) END AS numeric)
      , 2
    ) AS refund_item_discount
  , round(
        cast(financial_and_fps_items.refund_item_tax_base_amount * CASE WHEN fps_orders.base_currency = 'USD' THEN 1.0 ELSE cast( refund_conversion.in_usd AS numeric) END AS numeric)
      , 2
    ) AS refund_item_tax
  , round(
        cast(financial_and_fps_items.refund_item_duties_base_amount * CASE WHEN fps_orders.base_currency = 'USD' THEN 1.0 ELSE cast( refund_conversion.in_usd AS numeric) END AS numeric)
      , 2
    ) AS refund_item_duties
  , round(
        cast(financial_and_fps_items.refund_shipping_price_base_amount * CASE WHEN fps_orders.base_currency = 'USD' THEN 1.0 ELSE cast( refund_conversion.in_usd AS numeric) END AS numeric)
      , 2
    ) AS refund_shipping_price
  , round(
        cast(financial_and_fps_items.refund_shipping_tax_base_amount * CASE WHEN fps_orders.base_currency = 'USD' THEN 1.0 ELSE cast( refund_conversion.in_usd AS numeric) END AS numeric)
      , 2
    ) AS refund_shipping_tax
  , round(
        cast(financial_and_fps_items.refund_adjustments_base_amount * CASE WHEN fps_orders.base_currency = 'USD' THEN 1.0 ELSE cast( refund_conversion.in_usd AS numeric) END AS numeric)
      , 2
    ) AS refund_adjustments
  , round(
        cast(financial_and_fps_items.refund_effective_commission_base_amount * CASE WHEN fps_orders.base_currency = 'USD' THEN 1.0 ELSE cast( refund_conversion.in_usd AS numeric) END AS numeric)
      , 2
    ) AS refund_effective_commission
  , round(
        cast(financial_and_fps_items.refund_marketing_discounts_co_payment_base_amount * CASE WHEN fps_orders.base_currency = 'USD' THEN 1.0 ELSE cast( refund_conversion.in_usd AS numeric) END AS numeric)
      , 2
    ) AS refund_marketing_discounts_co_payment
  , round(
        cast(financial_and_fps_items.refund_credit_card_fee_base_amount * CASE WHEN fps_orders.base_currency = 'USD' THEN 1.0 ELSE cast( refund_conversion.in_usd AS numeric) END AS numeric)
      , 2
    ) AS refund_credit_card_fee
  , round(
        cast(financial_and_fps_items.refund_shipping_subsidy_base_amount * CASE WHEN fps_orders.base_currency = 'USD' THEN 1.0 ELSE cast( refund_conversion.in_usd AS numeric) END AS numeric)
      , 2
    ) AS refund_shipping_subsidy
  , round(
        cast(financial_and_fps_items.refund_partner_contribution_on_shipping_base_amount * CASE WHEN fps_orders.base_currency = 'USD' THEN 1.0 ELSE cast( refund_conversion.in_usd AS numeric) END AS numeric)
      , 2
    ) AS refund_partner_contribution_on_shipping
  , round(
        cast(financial_and_fps_items.refund_free_return_contribution_base_amount * CASE WHEN fps_orders.base_currency = 'USD' THEN 1.0 ELSE cast( refund_conversion.in_usd AS numeric) END AS numeric)
      , 2
    ) AS refund_free_return_contribution
  , round(
        cast(financial_and_fps_items.refund_no_stock_vouchers_base_amount * CASE WHEN fps_orders.base_currency = 'USD' THEN 1.0 ELSE cast( refund_conversion.in_usd AS numeric) END AS numeric)
      , 2
    ) AS refund_no_stock_vouchers
  , round(
        cast(financial_and_fps_items.refund_special_payments_base_amount * CASE WHEN fps_orders.base_currency = 'USD' THEN 1.0 ELSE cast( refund_conversion.in_usd AS numeric) END AS numeric)
      , 2
    ) AS refund_special_payments
  , round(
        cast(financial_and_fps_items.refund_pricing_difference_capture_base_amount * CASE WHEN fps_orders.base_currency = 'USD' THEN 1.0 ELSE cast( refund_conversion.in_usd AS numeric) END AS numeric)
      , 2
    ) AS refund_pricing_difference_capture
FROM financial_and_fps_items
INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`fps_orders` AS fps_orders
  ON financial_and_fps_items.fps_order_id = fps_orders.fps_order_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_forex_daily_exchange_rates` AS payment_conversion
  ON financial_and_fps_items.payment_currency_conversion_date = payment_conversion.transaction_date
  AND fps_orders.base_currency = payment_conversion.currency
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_forex_daily_exchange_rates` AS refund_conversion
  ON financial_and_fps_items.refund_currency_conversion_date = refund_conversion.transaction_date
  AND fps_orders.base_currency = refund_conversion.currency

), eu_order_items AS (

  SELECT joined.*
  FROM joined
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`fps_orders` AS order_headers
    ON joined.fps_order_id = order_headers.fps_order_id
  WHERE order_headers.fps_stock_point_id = '14376'
  AND joined.data_source = 'financial'

), us_order_items AS (

  SELECT joined.*
  FROM joined
  WHERE NOT EXISTS (SELECT * FROM eu_order_items
    WHERE eu_order_items.fps_order_id = joined.fps_order_id)

), final AS (

  SELECT * FROM eu_order_items
  UNION ALL
  SELECT * FROM us_order_items

)

SELECT * FROM final
  );
    