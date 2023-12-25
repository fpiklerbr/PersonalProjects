

WITH v2_items_and_headers AS (

  SELECT
    coalesce(items.fps_order_id, headers.fps_order_id) AS fps_order_id
    , coalesce(items.payment_processed_at, headers.payment_processed_at) AS payment_processed_at
    , coalesce(items.payment_file_name, headers.payment_file_name) AS payment_file_name
    , coalesce(items.payment_file_time, headers.payment_file_time) AS payment_file_time
    , coalesce(items.payment_transaction_type, headers.payment_transaction_type) AS payment_transaction_type
    , coalesce(
          items.refund_processed_at
        , CASE
            WHEN headers.refund_transaction_type IN ('Adjustment', 'Special Payment')
            THEN headers.refund_processed_at
          END
      ) AS refund_processed_at
    , coalesce(
          items.refund_file_name
        , CASE
            WHEN headers.refund_transaction_type IN ('Adjustment', 'Special Payment')
            THEN headers.refund_file_name
          END
      ) AS refund_file_name
    , coalesce(
          items.refund_file_time
        , CASE
            WHEN headers.refund_transaction_type IN ('Adjustment', 'Special Payment')
            THEN headers.refund_file_time
          END
      ) AS refund_file_time
    , coalesce(
          items.refund_transaction_type
        , CASE
            WHEN headers.refund_transaction_type IN ('Adjustment', 'Special Payment')
            THEN headers.refund_transaction_type
          END
      ) AS refund_transaction_type
    , items.`fps_parent_product_id`,
  items.`fps_product_size`,
  items.`payment_item_quantity`,
  items.`payment_posted_date`,
  items.`payment_item_price_base_amount`,
  items.`payment_item_discount_base_amount`,
  items.`payment_item_tax_base_amount`,
  items.`payment_effective_commission_base_amount`,
  items.`payment_marketing_discounts_co_payment_base_amount`,
  items.`payment_shipping_subsidy_base_amount`,
  items.`payment_free_return_contribution_base_amount`,
  items.`payment_no_stock_vouchers_base_amount`,
  items.`payment_pricing_difference_capture_base_amount`,
  items.`refund_item_quantity`,
  items.`refund_posted_date`,
  items.`refund_item_price_base_amount`,
  items.`refund_item_discount_base_amount`,
  items.`refund_item_tax_base_amount`,
  items.`refund_effective_commission_base_amount`,
  items.`refund_marketing_discounts_co_payment_base_amount`,
  items.`refund_shipping_subsidy_base_amount`,
  items.`refund_free_return_contribution_base_amount`,
  items.`refund_no_stock_vouchers_base_amount`,
  items.`refund_pricing_difference_capture_base_amount`,
  items.`return_timestamp`,
  items.`return_file_time`,
  items.`return_item_quantity`
    , headers.`fps_tenant_id`,
  headers.`fps_stock_point_id`,
  headers.`fps_channel_id`,
  headers.`customer_country`,
  headers.`tax_non_tax`,
  headers.`courier_name`,
  headers.`tracking_number`,
  headers.`order_payment_shipping_price_base_amount`,
  headers.`order_payment_adjustments_base_amount`,
  headers.`order_payment_credit_card_fee_base_amount`,
  headers.`order_payment_partner_contribution_on_shipping_base_amount`,
  headers.`order_payment_special_payments_base_amount`,
  headers.`order_refund_shipping_price_base_amount`,
  headers.`order_refund_adjustments_base_amount`,
  headers.`order_refund_credit_card_fee_base_amount`,
  headers.`order_refund_partner_contribution_on_shipping_base_amount`,
  headers.`order_refund_special_payments_base_amount`
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_farfetch_financial_v2_order_items` AS items
  FULL JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_farfetch_financial_v2_order_headers` AS headers
    ON items.fps_order_id = headers.fps_order_id

), v2_with_share AS (

  SELECT
      *
    
    , coalesce(
          cast(payment_item_quantity AS float64)
          / nullif(sum(payment_item_quantity) OVER (PARTITION BY fps_order_id), 0)
        , cast(CASE WHEN payment_processed_at IS NOT NULL THEN 1 ELSE 0 END AS float64)
          / nullif(count(payment_processed_at) OVER (PARTITION BY fps_order_id), 0)
      ) AS item_share_of_order_payment_quantity
    
    , coalesce(
          cast(refund_item_quantity AS float64)
          / nullif(sum(refund_item_quantity) OVER (PARTITION BY fps_order_id), 0)
        , cast(CASE WHEN refund_processed_at IS NOT NULL THEN 1 ELSE 0 END AS float64)
          / nullif(count(refund_processed_at) OVER (PARTITION BY fps_order_id), 0)
      ) AS item_share_of_order_refund_quantity
    
  FROM v2_items_and_headers

), v2 AS (

  SELECT
      *
    , (
          order_payment_shipping_price_base_amount
        * item_share_of_order_payment_quantity
      ) AS payment_shipping_price_base_amount
  
    , (
          order_payment_adjustments_base_amount
        * item_share_of_order_payment_quantity
      ) AS payment_adjustments_base_amount
  
    , (
          order_payment_credit_card_fee_base_amount
        * item_share_of_order_payment_quantity
      ) AS payment_credit_card_fee_base_amount
  
    , (
          order_payment_partner_contribution_on_shipping_base_amount
        * item_share_of_order_payment_quantity
      ) AS payment_partner_contribution_on_shipping_base_amount
  
    , (
          order_payment_special_payments_base_amount
        * item_share_of_order_payment_quantity
      ) AS payment_special_payments_base_amount
  
    , (
          order_refund_shipping_price_base_amount
        * item_share_of_order_refund_quantity
      ) AS refund_shipping_price_base_amount
  
    , (
          order_refund_adjustments_base_amount
        * item_share_of_order_refund_quantity
      ) AS refund_adjustments_base_amount
  
    , (
          order_refund_credit_card_fee_base_amount
        * item_share_of_order_refund_quantity
      ) AS refund_credit_card_fee_base_amount
  
    , (
          order_refund_partner_contribution_on_shipping_base_amount
        * item_share_of_order_refund_quantity
      ) AS refund_partner_contribution_on_shipping_base_amount
  
    , (
          order_refund_special_payments_base_amount
        * item_share_of_order_refund_quantity
      ) AS refund_special_payments_base_amount
  FROM v2_with_share

)

SELECT
    coalesce(v2.fps_order_id, v1.fps_order_id) AS fps_order_id
  , coalesce(v2.fps_parent_product_id, v1.fps_parent_product_id) AS fps_parent_product_id
  , coalesce(v2.fps_product_size, v1.fps_product_size) AS fps_product_size
  , v2.fps_tenant_id
  , v2.fps_stock_point_id
  , v2.fps_channel_id
  , v2.customer_country
  , v2.tax_non_tax
  , v2.courier_name
  , v2.tracking_number

  , cast(CASE
      WHEN v2.payment_processed_at IS NOT NULL
      THEN 'v2'
      WHEN v1.payment_processed_at IS NOT NULL
      THEN 'v1'
      ELSE NULL
    END AS string) AS payment_source
  
  , CASE
      WHEN v2.payment_processed_at IS NOT NULL
      THEN v2.payment_transaction_type
      ELSE v1.payment_transaction_type
    END AS payment_transaction_type
  
  , CASE
      WHEN v2.payment_processed_at IS NOT NULL
      THEN v2.payment_file_name
      ELSE v1.payment_file_name
    END AS payment_file_name
  
  , CASE
      WHEN v2.payment_processed_at IS NOT NULL
      THEN v2.payment_file_time
      ELSE v1.payment_file_time
    END AS payment_file_time
  
  , CASE
      WHEN v2.payment_processed_at IS NOT NULL
      THEN v2.payment_processed_at
      ELSE v1.payment_processed_at
    END AS payment_processed_at
  
  , CASE
      WHEN v2.payment_processed_at IS NOT NULL
      THEN v2.payment_item_quantity
      ELSE v1.payment_item_quantity
    END AS payment_item_quantity
  
  , CASE
      WHEN v2.payment_processed_at IS NOT NULL
      THEN v2.payment_item_price_base_amount
      ELSE v1.payment_item_price_base_amount
    END AS payment_item_price_base_amount
  
  , CASE
      WHEN v2.payment_processed_at IS NOT NULL
      THEN v2.payment_item_discount_base_amount
      ELSE v1.payment_item_discount_base_amount
    END AS payment_item_discount_base_amount
  
  , CASE
      WHEN v2.payment_processed_at IS NOT NULL
      THEN v2.payment_item_tax_base_amount
      ELSE v1.payment_item_tax_base_amount
    END AS payment_item_tax_base_amount
  
  , CASE
      WHEN v2.payment_processed_at IS NOT NULL
      THEN v2.payment_shipping_price_base_amount
      ELSE v1.payment_shipping_price_base_amount
    END AS payment_shipping_price_base_amount
  
  , CASE
      WHEN v2.payment_processed_at IS NOT NULL
      THEN v2.payment_effective_commission_base_amount
      ELSE v1.payment_effective_commission_base_amount
    END AS payment_effective_commission_base_amount
  
  , CASE
      WHEN v2.payment_processed_at IS NOT NULL
      THEN v2.payment_marketing_discounts_co_payment_base_amount
      ELSE v1.payment_marketing_discounts_co_payment_base_amount
    END AS payment_marketing_discounts_co_payment_base_amount
  
  , CASE
      WHEN v2.payment_processed_at IS NOT NULL
      THEN v2.payment_credit_card_fee_base_amount
      ELSE v1.payment_credit_card_fee_base_amount
    END AS payment_credit_card_fee_base_amount
  
  , CASE
      WHEN v2.payment_processed_at IS NOT NULL
      THEN v2.payment_shipping_subsidy_base_amount
      ELSE v1.payment_shipping_subsidy_base_amount
    END AS payment_shipping_subsidy_base_amount
  
  , CASE
      WHEN v2.payment_processed_at IS NOT NULL
      THEN v2.payment_partner_contribution_on_shipping_base_amount
      ELSE v1.payment_partner_contribution_on_shipping_base_amount
    END AS payment_partner_contribution_on_shipping_base_amount
  
  , CASE
      WHEN v2.payment_processed_at IS NOT NULL
      THEN v2.payment_free_return_contribution_base_amount
      ELSE v1.payment_free_return_contribution_base_amount
    END AS payment_free_return_contribution_base_amount
  
  , CASE
      WHEN v2.payment_processed_at IS NOT NULL
      THEN v2.payment_no_stock_vouchers_base_amount
      ELSE v1.payment_no_stock_vouchers_base_amount
    END AS payment_no_stock_vouchers_base_amount
  
  
  , CASE
      WHEN v2.payment_processed_at IS NOT NULL
      THEN v2.payment_special_payments_base_amount
    END AS payment_special_payments_base_amount
  
  , CASE
      WHEN v2.payment_processed_at IS NOT NULL
      THEN v2.payment_pricing_difference_capture_base_amount
    END AS payment_pricing_difference_capture_base_amount
  
  , CASE
      WHEN v2.payment_processed_at IS NOT NULL
      THEN v2.payment_adjustments_base_amount
    END AS payment_adjustments_base_amount
  
  , CASE
      WHEN v2.payment_processed_at IS NOT NULL
      THEN v2.payment_posted_date
    END AS payment_posted_date
  

  , cast(CASE
      WHEN v2.refund_processed_at IS NOT NULL
      THEN 'v2'
      WHEN v1.refund_processed_at IS NOT NULL
      THEN 'v1'
      ELSE NULL
    END AS string) AS refund_source
  
  , CASE
      WHEN v2.refund_processed_at IS NOT NULL
      THEN v2.refund_transaction_type
      ELSE v1.refund_transaction_type
    END AS refund_transaction_type
  
  , CASE
      WHEN v2.refund_processed_at IS NOT NULL
      THEN v2.refund_file_name
      ELSE v1.refund_file_name
    END AS refund_file_name
  
  , CASE
      WHEN v2.refund_processed_at IS NOT NULL
      THEN v2.refund_file_time
      ELSE v1.refund_file_time
    END AS refund_file_time
  
  , CASE
      WHEN v2.refund_processed_at IS NOT NULL
      THEN v2.refund_processed_at
      ELSE v1.refund_processed_at
    END AS refund_processed_at
  
  , CASE
      WHEN v2.refund_processed_at IS NOT NULL
      THEN v2.refund_item_quantity
      ELSE v1.refund_item_quantity
    END AS refund_item_quantity
  
  , CASE
      WHEN v2.refund_processed_at IS NOT NULL
      THEN v2.refund_item_price_base_amount
      ELSE v1.refund_item_price_base_amount
    END AS refund_item_price_base_amount
  
  , CASE
      WHEN v2.refund_processed_at IS NOT NULL
      THEN v2.refund_item_discount_base_amount
      ELSE v1.refund_item_discount_base_amount
    END AS refund_item_discount_base_amount
  
  , CASE
      WHEN v2.refund_processed_at IS NOT NULL
      THEN v2.refund_item_tax_base_amount
      ELSE v1.refund_item_tax_base_amount
    END AS refund_item_tax_base_amount
  
  , CASE
      WHEN v2.refund_processed_at IS NOT NULL
      THEN v2.refund_shipping_price_base_amount
      ELSE v1.refund_shipping_price_base_amount
    END AS refund_shipping_price_base_amount
  
  , CASE
      WHEN v2.refund_processed_at IS NOT NULL
      THEN v2.refund_effective_commission_base_amount
      ELSE v1.refund_effective_commission_base_amount
    END AS refund_effective_commission_base_amount
  
  , CASE
      WHEN v2.refund_processed_at IS NOT NULL
      THEN v2.refund_marketing_discounts_co_payment_base_amount
      ELSE v1.refund_marketing_discounts_co_payment_base_amount
    END AS refund_marketing_discounts_co_payment_base_amount
  
  , CASE
      WHEN v2.refund_processed_at IS NOT NULL
      THEN v2.refund_credit_card_fee_base_amount
      ELSE v1.refund_credit_card_fee_base_amount
    END AS refund_credit_card_fee_base_amount
  
  , CASE
      WHEN v2.refund_processed_at IS NOT NULL
      THEN v2.refund_shipping_subsidy_base_amount
      ELSE v1.refund_shipping_subsidy_base_amount
    END AS refund_shipping_subsidy_base_amount
  
  , CASE
      WHEN v2.refund_processed_at IS NOT NULL
      THEN v2.refund_partner_contribution_on_shipping_base_amount
      ELSE v1.refund_partner_contribution_on_shipping_base_amount
    END AS refund_partner_contribution_on_shipping_base_amount
  
  , CASE
      WHEN v2.refund_processed_at IS NOT NULL
      THEN v2.refund_free_return_contribution_base_amount
      ELSE v1.refund_free_return_contribution_base_amount
    END AS refund_free_return_contribution_base_amount
  
  , CASE
      WHEN v2.refund_processed_at IS NOT NULL
      THEN v2.refund_no_stock_vouchers_base_amount
      ELSE v1.refund_no_stock_vouchers_base_amount
    END AS refund_no_stock_vouchers_base_amount
  
  
  , CASE
      WHEN v2.refund_processed_at IS NOT NULL
      THEN v2.refund_special_payments_base_amount
    END AS refund_special_payments_base_amount
  
  , CASE
      WHEN v2.refund_processed_at IS NOT NULL
      THEN v2.refund_pricing_difference_capture_base_amount
    END AS refund_pricing_difference_capture_base_amount
  
  , CASE
      WHEN v2.refund_processed_at IS NOT NULL
      THEN v2.refund_adjustments_base_amount
    END AS refund_adjustments_base_amount
  
  , CASE
      WHEN v2.refund_processed_at IS NOT NULL
      THEN v2.refund_posted_date
    END AS refund_posted_date
  


  , coalesce(v2.return_timestamp, v1.return_timestamp) AS return_timestamp

  , coalesce(v2.return_file_time, v1.return_file_time) AS return_file_time

  , coalesce(v2.return_item_quantity, v1.return_item_quantity) AS return_item_quantity

FROM v2
FULL JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_farfetch_financial_v1_order_items` AS v1
  ON v2.fps_order_id = v1.fps_order_id
  AND v2.fps_parent_product_id = v1.fps_parent_product_id
  AND v2.fps_product_size = v1.fps_product_size