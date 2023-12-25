SELECT
    lines.fps_order_id
  , CASE WHEN parent_fix.fps_parent_product_id_fix IS NOT NULL 
    THEN parent_fix.fps_parent_product_id_fix ELSE lines.fps_parent_product_id
    END AS fps_parent_product_id
  , lines.fps_product_size

  , string_agg(DISTINCT
        CASE
          WHEN lines.transaction_description = 'payment'
          THEN lines.transaction_type
        END
      , ', '
    ) AS payment_transaction_type
  , string_agg(DISTINCT
        CASE
          WHEN lines.transaction_description = 'payment'
          THEN lines.file_name
        END
      , ', '
    ) AS payment_file_name
  , max(
      CASE
        WHEN lines.transaction_description = 'payment'
        THEN lines.file_time
      END
    ) AS payment_file_time
  , sum(
      CASE
        WHEN lines.transaction_description = 'payment'
        THEN lines.item_quantity
      END
    ) AS payment_item_quantity
  , min(
      CASE
        WHEN lines.transaction_description = 'payment'
        THEN lines.transaction_processed_at
      END
    ) AS payment_processed_at
  , max(
      CASE
        WHEN lines.transaction_description = 'payment'
        THEN lines.posted_date
      END
    ) AS payment_posted_date
  , sum(
      CASE
        WHEN lines.transaction_description = 'payment'
        THEN lines.item_price_base_amount
      END
    ) AS payment_item_price_base_amount
  , sum(
      CASE
        WHEN lines.transaction_description = 'payment'
        THEN lines.item_discount_base_amount
      END
    ) AS payment_item_discount_base_amount
  , sum(
      CASE
        WHEN lines.transaction_description = 'payment'
        THEN lines.item_tax_base_amount
      END
    ) AS payment_item_tax_base_amount
  , sum(
      CASE
        WHEN lines.transaction_description = 'payment'
        THEN lines.effective_commission_base_amount
      END
    ) AS payment_effective_commission_base_amount
  , sum(
      CASE
        WHEN lines.transaction_description = 'payment'
        THEN lines.marketing_discounts_co_payment_base_amount
      END
    ) AS payment_marketing_discounts_co_payment_base_amount
  , sum(
      CASE
        WHEN lines.transaction_description = 'payment'
        THEN lines.shipping_subsidy_base_amount
      END
    ) AS payment_shipping_subsidy_base_amount
  , sum(
      CASE
        WHEN lines.transaction_description = 'payment'
        THEN lines.free_return_contribution_base_amount
      END
    ) AS payment_free_return_contribution_base_amount
  , sum(
      CASE
        WHEN lines.transaction_description = 'payment'
        THEN lines.no_stock_vouchers_base_amount
      END
    ) AS payment_no_stock_vouchers_base_amount
  , sum(
      CASE
        WHEN lines.transaction_description = 'payment'
        THEN lines.pricing_difference_capture_base_amount
      END
    ) AS payment_pricing_difference_capture_base_amount

  , string_agg(DISTINCT
        CASE
          WHEN lines.transaction_description = 'refund'
          THEN lines.transaction_type
        END
      , ', '
    ) AS refund_transaction_type
  , string_agg(DISTINCT
        CASE
          WHEN lines.transaction_description = 'refund'
          THEN lines.file_name
        END
      , ', '
    ) AS refund_file_name
  , max(
      CASE
        WHEN lines.transaction_description = 'refund'
        THEN lines.file_time
      END
    ) AS refund_file_time
  , sum(
      CASE
        WHEN lines.transaction_description = 'refund'
        THEN lines.item_quantity
      END
    ) AS refund_item_quantity
  , min(
      CASE
        WHEN lines.transaction_description = 'refund'
        THEN lines.transaction_processed_at
      END
    ) AS refund_processed_at
  , max(
      CASE
        WHEN lines.transaction_description = 'refund'
        THEN lines.posted_date
      END
    ) AS refund_posted_date
  , sum(
      CASE
        WHEN lines.transaction_description = 'refund'
        THEN lines.item_price_base_amount
      END
    ) AS refund_item_price_base_amount
  , sum(
      CASE
        WHEN lines.transaction_description = 'refund'
        THEN lines.item_discount_base_amount
      END
    ) AS refund_item_discount_base_amount
  , sum(
      CASE
        WHEN lines.transaction_description = 'refund'
        THEN lines.item_tax_base_amount
      END
    ) AS refund_item_tax_base_amount
  , sum(
      CASE
        WHEN lines.transaction_description = 'refund'
        THEN lines.effective_commission_base_amount
      END
    ) AS refund_effective_commission_base_amount
  , sum(
      CASE
        WHEN lines.transaction_description = 'refund'
        THEN lines.marketing_discounts_co_payment_base_amount
      END
    ) AS refund_marketing_discounts_co_payment_base_amount
  , sum(
      CASE
        WHEN lines.transaction_description = 'refund'
        THEN lines.shipping_subsidy_base_amount
      END
    ) AS refund_shipping_subsidy_base_amount
  , sum(
      CASE
        WHEN lines.transaction_description = 'refund'
        THEN lines.free_return_contribution_base_amount
      END
    ) AS refund_free_return_contribution_base_amount
  , sum(
      CASE
        WHEN lines.transaction_description = 'refund'
        THEN lines.no_stock_vouchers_base_amount
      END
    ) AS refund_no_stock_vouchers_base_amount
  , sum(
      CASE
        WHEN lines.transaction_description = 'refund'
        THEN lines.pricing_difference_capture_base_amount
      END
    ) AS refund_pricing_difference_capture_base_amount

  , min(CASE WHEN lines.transaction_type = 'Return' THEN lines.transaction_processed_at END) AS return_timestamp
  , max(CASE WHEN lines.transaction_type = 'Return' THEN lines.file_time END) AS return_file_time
  , sum(CASE WHEN lines.transaction_type = 'Return' THEN lines.item_quantity END) AS return_item_quantity
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`farfetch__financial_v2_order` AS lines
INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_farfetch_financial_v2_current_order_reports` AS current_reports
  ON lines.file_name = current_reports.file_name
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_fix_parent_product_id_ff_financials` AS parent_fix
  USING (fps_parent_product_id,fps_order_id)
WHERE lines.entry_type = 'Line'
  AND lines.transaction_type IS NOT NULL
GROUP BY 1, 2, 3