/*
TODO for DE-3487: update docs
*/









































WITH refund_id_window AS (

  SELECT
    refund_id
  , count(*) AS refund_total_lines
  , sum(line_share_of_payment) AS refund_total_share_of_payment
  , sum(actual_payment_total_base_amount * line_share_of_payment) AS refund_total_payment_base_amount
  , sum(actual_payment_total * line_share_of_payment) AS refund_total_payment_amount
  , sum(line_share_of_payment_and_credit_redeemed) AS refund_total_share_of_payment_and_credit_redeemed
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_finance_lines_transaction_lines`
  GROUP BY 1

), finance_lines_raw AS (

  SELECT
    *
  , actual_payment_total_base_amount * line_share_of_payment AS line_payment_base_amount
  , actual_payment_total * line_share_of_payment AS line_payment_amount
  , actual_payment_total_base_amount * line_item_price_share_of_order_payment AS line_item_price_paid_base_amount
  , actual_payment_total * line_item_price_share_of_order_payment AS line_item_price_paid
  , actual_payment_total_base_amount * line_item_tax_share_of_order_payment AS line_item_tax_paid_base_amount
  , actual_payment_total * line_item_tax_share_of_order_payment AS line_item_tax_paid
  , actual_payment_total_base_amount * line_shipping_price_share_of_order_payment AS line_shipping_price_paid_base_amount
  , actual_payment_total * line_shipping_price_share_of_order_payment AS line_shipping_price_paid
  , actual_payment_total_base_amount * line_shipping_tax_share_of_order_payment AS line_shipping_tax_paid_base_amount
  , actual_payment_total * line_shipping_tax_share_of_order_payment AS line_shipping_tax_paid
  , actual_payment_total_base_amount * line_duties_share_of_order_payment AS line_duties_paid_base_amount
  , actual_payment_total * line_duties_share_of_order_payment AS line_duties_paid

  , CASE 
  WHEN refund_id IS NULL
  THEN 0
  ELSE coalesce(
      line_share_of_payment / nullif(refund_id_window.refund_total_share_of_payment, 0)
    , (CAST(1 AS numeric) / refund_id_window.refund_total_lines)
  )
 * 
  CASE
    WHEN data_source = 'Farfetch API' AND refund_id IS NOT NULL -- N.B. 'AND refund_id IS NOT NULL' not included in subquery appearance pre-dbt
    THEN nullif(
     least(
      coalesce(refund_id_window.refund_total_payment_base_amount, CAST('9.9999999999999999999999999999999999999E+28' AS numeric))
      ,coalesce(actual_refund_total_base_amount, CAST('9.9999999999999999999999999999999999999E+28' AS numeric))
      
      )
     , CAST('9.9999999999999999999999999999999999999E+28' AS numeric)
  )
    ELSE actual_refund_total_base_amount
  END
 END AS line_payment_refunded_base_amount
  , CASE 
  WHEN refund_id IS NULL
  THEN 0
  ELSE coalesce(
      line_share_of_payment / nullif(refund_id_window.refund_total_share_of_payment, 0)
    , (CAST(1 AS numeric) / refund_id_window.refund_total_lines)
  )
 * 
  CASE
    WHEN data_source = 'Farfetch API' AND refund_id IS NOT NULL -- N.B. 'AND refund_id IS NOT NULL' not included in subquery appearance pre-dbt
    THEN nullif(
     least(
      coalesce(refund_id_window.refund_total_payment_amount, CAST('9.9999999999999999999999999999999999999E+28' AS numeric))
      ,coalesce(actual_refund_total, CAST('9.9999999999999999999999999999999999999E+28' AS numeric))
      
      )
     , CAST('9.9999999999999999999999999999999999999E+28' AS numeric)
  )
    ELSE actual_refund_total
  END
 END AS line_payment_refunded
  , 
  CASE
    WHEN data_source = 'Farfetch API' AND refund_id IS NOT NULL -- N.B. 'AND refund_id IS NOT NULL' not included in subquery appearance pre-dbt
    THEN nullif(
     least(
      coalesce(refund_id_window.refund_total_payment_base_amount, CAST('9.9999999999999999999999999999999999999E+28' AS numeric))
      ,coalesce(actual_refund_total_base_amount, CAST('9.9999999999999999999999999999999999999E+28' AS numeric))
      
      )
     , CAST('9.9999999999999999999999999999999999999E+28' AS numeric)
  )
    ELSE actual_refund_total_base_amount
  END
 AS total_payment_refunded_base_amount
  , 
  CASE
    WHEN data_source = 'Farfetch API' AND refund_id IS NOT NULL -- N.B. 'AND refund_id IS NOT NULL' not included in subquery appearance pre-dbt
    THEN nullif(
     least(
      coalesce(refund_id_window.refund_total_payment_amount, CAST('9.9999999999999999999999999999999999999E+28' AS numeric))
      ,coalesce(actual_refund_total, CAST('9.9999999999999999999999999999999999999E+28' AS numeric))
      
      )
     , CAST('9.9999999999999999999999999999999999999E+28' AS numeric)
  )
    ELSE actual_refund_total
  END
 AS total_payment_refunded
  , CASE 
  WHEN refund_id IS NULL
  THEN 0
  ELSE coalesce(
      line_share_of_payment / nullif(refund_id_window.refund_total_share_of_payment, 0)
    , (CAST(1 AS numeric) / refund_id_window.refund_total_lines)
  )
 END AS line_share_of_refund
  , CASE 
  WHEN refund_id IS NULL
  THEN 0
  ELSE coalesce(
      line_share_of_payment_and_credit_redeemed / nullif(refund_id_window.refund_total_share_of_payment_and_credit_redeemed, 0)
    , (CAST(1 AS numeric) / refund_id_window.refund_total_lines)
  )
 * actual_store_credit_total_base_amount END AS line_payment_credited_base_amount
  , CASE 
  WHEN refund_id IS NULL
  THEN 0
  ELSE coalesce(
      line_share_of_payment_and_credit_redeemed / nullif(refund_id_window.refund_total_share_of_payment_and_credit_redeemed, 0)
    , (CAST(1 AS numeric) / refund_id_window.refund_total_lines)
  )
 * actual_store_credit_total END AS line_payment_credited
  , CASE 
  WHEN refund_id IS NULL
  THEN 0
  ELSE coalesce(
      line_share_of_payment_and_credit_redeemed / nullif(refund_id_window.refund_total_share_of_payment_and_credit_redeemed, 0)
    , (CAST(1 AS numeric) / refund_id_window.refund_total_lines)
  )
 END AS line_share_of_credit

  , CAST(0 AS numeric) AS line_channel_discount
  , CAST(0 AS numeric) AS line_channel_duties
  , CAST(0 AS numeric) AS line_channel_shipping
  , CAST(0 AS numeric) AS line_channel_additional_gtv
  , order_total_affiliate_commission * line_share_of_payment AS line_affiliate_commission
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_finance_lines_transaction_lines` AS transaction_lines
  LEFT JOIN refund_id_window USING (refund_id)

), final AS (

  SELECT
    stadium_order_id
  , order_or_payment_id
  , order_base_currency
  , fps_stock_point_id
  , CASE
      WHEN fps_merchant_name = 'STADIUM GOODS EU'
      THEN fps_merchant_name
      ELSE 'STADIUM GOODS USA'
    END AS business_entity
  , channel_or_gateway
  , sales_channel
  , business_unit
  , data_source
  , order_date
  , order_creation_nyc
  , mag_order_entity_id
  , customer_id
  , unique_email
  , geography_type
  , geography
  , affiliate_offer
  , affiliate_publisher
  , affiliate_publisher_group
  , acquisition_medium
  , acquisition_source
  , acquisition_campaign
  , acquisition_device_category
  , total_order_lines
  , payment_id
  , actual_payment_total AS total_amount_paid
  , actual_payment_total_base_amount AS total_amount_paid_base_amount
  , payment_total_fee
  , payment_total_shipping_subsidy_base_amount
  , payment_total_shipping_subsidy
  , simple_sku
  , order_simple_sku_line
  , mag_order_id
  , order_item_id
  , order_item_line
  , order_line_id
  , ether_order_number
  , ether_order_item_line_number
  , x3_order_id
  , x3_order_line
  , fulfillment_number
  , allocation_line_number
  , product_sku
  , variant_size
  , serial_source
  , order_sku_size_source_line
  , serial_number
  , serial_order_match
  , mag_creditmemo_ids
  , mag_rma_ids
  , x3_return_id
  , inventory_base_currency
  , inventory_cost_currency_conversion_date
  , inventory_cost_currency_conversion_rate
  , CASE
      WHEN (dispatch_date IS NULL AND refund_timestamp_nyc IS NOT NULL)
        OR NOT serial_order_match
        OR (inventory_relationship = '1P' AND (
  dispatch_date IS NOT NULL
  AND (
    returns = 1
    OR 
(return_if_refunded AND line_payment_refunded > return_refund_threshold * (line_payment_amount - return_refund_deduction))

  )
))
      THEN 0
      ELSE inventory_cost_base_amount
    END AS inventory_cost_base_amount
  , CASE
      WHEN (dispatch_date IS NULL AND refund_timestamp_nyc IS NOT NULL)
        OR NOT serial_order_match
        OR (inventory_relationship = '1P' AND (
  dispatch_date IS NOT NULL
  AND (
    returns = 1
    OR 
(return_if_refunded AND line_payment_refunded > return_refund_threshold * (line_payment_amount - return_refund_deduction))

  )
))
      THEN 0
      ELSE inventory_cost
    END AS inventory_cost
  , inventory_relationship
  , inventory_type
  , inventory_source
  , inventory_seller
  , refund_id
  , actual_store_credit_total AS total_store_credit_refunded
  , total_payment_refunded
  , refund_total_fee
  , refund_total_shipping_subsidy_base_amount
  , refund_total_shipping_subsidy
  , dispatch_date
  , dispatch_warehouse
  , dispatch_country
  , receipt_date
  , 
CAST(CAST(refund_timestamp_nyc AS datetime) AS date)
 AS refund_date
  , coalesce(
        CASE WHEN inventory_relationship = '1P' THEN receipt_date ELSE dispatch_date END
      , CAST(CAST(refund_timestamp_nyc AS datetime) AS date)
      , order_date
    ) AS reporting_date
  , CASE
      WHEN dispatch_date IS NULL
        THEN CASE
          WHEN refund_timestamp_nyc IS NULL
          THEN 'Deferred'
          ELSE 'Cancelled'
        END
      WHEN (
  dispatch_date IS NOT NULL
  AND (
    returns = 1
    OR 
(return_if_refunded AND line_payment_refunded > return_refund_threshold * (line_payment_amount - return_refund_deduction))

  )
)
        THEN 'Returned'
      ELSE 'Dispatched'
    END AS reporting_status
  , payment_currency_conversion_date
  , payment_currency_conversion_rate
  , 
    nullif(
     greatest(
      coalesce(order_serial_price_base_amount - 
CASE
WHEN order_date < '2021-07-01' THEN (line_item_price_paid_base_amount + line_item_store_credit_applied_base_amount)
ELSE (line_item_price_paid_base_amount + line_item_store_credit_applied_base_amount - channel_upcharge_flat_base_amount) / (1 + channel_upcharge_percentage)
END
, CAST('-9.9999999999999999999999999999999999999E+28' AS numeric))
      ,coalesce(line_item_discount_base_amount, CAST('-9.9999999999999999999999999999999999999E+28' AS numeric))
      ,coalesce(0, CAST('-9.9999999999999999999999999999999999999E+28' AS numeric))
      
      )
     , CAST('-9.9999999999999999999999999999999999999E+28' AS numeric)
  )
 AS line_item_discount_base_amount
  , 
    nullif(
     greatest(
      coalesce(order_serial_price - 
CASE
WHEN order_date < '2021-07-01' THEN (line_item_price_paid + line_item_store_credit_applied)
ELSE (line_item_price_paid + line_item_store_credit_applied - channel_upcharge_flat) / (1 + channel_upcharge_percentage)
END
, CAST('-9.9999999999999999999999999999999999999E+28' AS numeric))
      ,coalesce(line_item_discount, CAST('-9.9999999999999999999999999999999999999E+28' AS numeric))
      ,coalesce(0, CAST('-9.9999999999999999999999999999999999999E+28' AS numeric))
      
      )
     , CAST('-9.9999999999999999999999999999999999999E+28' AS numeric)
  )
 AS line_item_discount
  , line_item_store_credit_applied_base_amount
  , line_item_store_credit_applied
  , line_item_price_paid_base_amount
  , line_item_price_paid
  , line_item_tax_paid_base_amount
  , line_item_tax_paid
  , 
  CASE
    WHEN 
  (
    line_shipping_discount_base_amount
    + line_shipping_store_credit_applied_base_amount
    + line_shipping_price_paid_base_amount
    + line_shipping_tax_paid_base_amount
    = 0
  )

    THEN free_shipping_value_base_amount / total_order_lines
    ELSE line_shipping_discount_base_amount
  END
 AS line_shipping_discount_base_amount
  , 
  CASE
    WHEN 
  (
    line_shipping_discount_base_amount
    + line_shipping_store_credit_applied_base_amount
    + line_shipping_price_paid_base_amount
    + line_shipping_tax_paid_base_amount
    = 0
  )

    THEN free_shipping_value / total_order_lines
    ELSE line_shipping_discount
  END
 AS line_shipping_discount
  , line_shipping_store_credit_applied_base_amount
  , line_shipping_store_credit_applied
  , line_shipping_price_paid_base_amount
  , line_shipping_price_paid
  , line_shipping_tax_paid_base_amount
  , line_shipping_tax_paid
  , line_duties_paid_base_amount

  , refund_currency_conversion_date
  , refund_currency_conversion_rate
  , CASE
      WHEN actual_payment_total_base_amount = 0 OR line_share_of_payment = 0
      THEN cast(0 AS numeric)
      ELSE coalesce(line_item_price_share_of_order_payment, 0) / line_share_of_payment
    END * line_payment_refunded_base_amount AS line_item_price_refunded_base_amount
  , CASE
      WHEN actual_payment_total = 0 OR line_share_of_payment = 0
      THEN cast(0 AS numeric)
      ELSE coalesce(line_item_price_share_of_order_payment, 0) / line_share_of_payment
    END * line_payment_refunded AS line_item_price_refunded
  , CASE
      WHEN actual_payment_total_base_amount = 0 OR line_share_of_payment = 0
      THEN cast(0 AS numeric)
      ELSE coalesce(line_item_tax_share_of_order_payment, 0) / line_share_of_payment
    END * line_payment_refunded_base_amount AS line_item_tax_refunded_base_amount
  , CASE
      WHEN actual_payment_total = 0 OR line_share_of_payment = 0
      THEN cast(0 AS numeric)
      ELSE coalesce(line_item_tax_share_of_order_payment, 0) / line_share_of_payment
    END * line_payment_refunded AS line_item_tax_refunded
  , CASE
      WHEN actual_payment_total_base_amount = 0 OR line_share_of_payment = 0
      THEN cast(0 AS numeric)
      ELSE coalesce(line_shipping_price_share_of_order_payment, 0) / line_share_of_payment
    END * line_payment_refunded_base_amount AS line_shipping_price_refunded_base_amount
  , CASE
      WHEN actual_payment_total = 0 OR line_share_of_payment = 0
      THEN cast(0 AS numeric)
      ELSE coalesce(line_shipping_price_share_of_order_payment, 0) / line_share_of_payment
    END * line_payment_refunded AS line_shipping_price_refunded
  , CASE
      WHEN actual_payment_total_base_amount = 0 OR line_share_of_payment = 0
      THEN cast(0 AS numeric)
      ELSE coalesce(line_shipping_tax_share_of_order_payment, 0) / line_share_of_payment
    END * line_payment_refunded_base_amount AS line_shipping_tax_refunded_base_amount
  , CASE
      WHEN actual_payment_total = 0 OR line_share_of_payment = 0
      THEN cast(0 AS numeric)
      ELSE coalesce(line_shipping_tax_share_of_order_payment, 0) / line_share_of_payment
    END * line_payment_refunded AS line_shipping_tax_refunded
  , 
CASE WHEN 
  dispatch_date IS NOT NULL
  AND (
    returns = 1
    OR 
(return_if_refunded AND line_payment_refunded > return_refund_threshold * (line_payment_amount - return_refund_deduction))

  )

THEN line_item_price_paid_base_amount + line_item_store_credit_applied_base_amount + line_item_tax_paid_base_amount
ELSE 0
END
 AS return_refund_expected_base_amount
  , 
CASE WHEN 
  dispatch_date IS NOT NULL
  AND (
    returns = 1
    OR 
(return_if_refunded AND line_payment_refunded > return_refund_threshold * (line_payment_amount - return_refund_deduction))

  )

THEN line_item_price_paid + line_item_store_credit_applied + line_item_tax_paid
ELSE 0
END
 AS return_refund_expected

  , 
  (line_payment_base_amount + line_item_store_credit_applied_base_amount + line_shipping_store_credit_applied_base_amount)
 AS line_paid_and_credited_base_amount
  , 
  (line_payment_amount + line_item_store_credit_applied + line_shipping_store_credit_applied)
 AS line_paid_and_credited
  , line_payment_credited_base_amount * coalesce(
        (line_item_price_paid_base_amount + line_item_store_credit_applied_base_amount) / nullif(
  (line_payment_base_amount + line_item_store_credit_applied_base_amount + line_shipping_store_credit_applied_base_amount)
, 0)
      , 0
    ) AS line_item_price_credited_base_amount
  , line_payment_credited * coalesce(
        (line_item_price_paid + line_item_store_credit_applied) / nullif(
  (line_payment_amount + line_item_store_credit_applied + line_shipping_store_credit_applied)
, 0)
      , 0
    ) AS line_item_price_credited
  , line_payment_credited_base_amount * coalesce(
        line_item_tax_paid_base_amount / nullif(
  (line_payment_base_amount + line_item_store_credit_applied_base_amount + line_shipping_store_credit_applied_base_amount)
, 0)
      , 0
    ) AS line_item_tax_credited_base_amount
  , line_payment_credited * coalesce(
        line_item_tax_paid / nullif(
  (line_payment_amount + line_item_store_credit_applied + line_shipping_store_credit_applied)
, 0)
      , 0
    ) AS line_item_tax_credited
  , line_payment_credited_base_amount * coalesce(
        (line_shipping_price_paid_base_amount + line_shipping_store_credit_applied_base_amount) / nullif(
  (line_payment_base_amount + line_item_store_credit_applied_base_amount + line_shipping_store_credit_applied_base_amount)
, 0)
      , 0
    ) AS line_shipping_price_credited_base_amount
  , line_payment_credited * coalesce(
        (line_shipping_price_paid + line_shipping_store_credit_applied) / nullif(
  (line_payment_amount + line_item_store_credit_applied + line_shipping_store_credit_applied)
, 0)
      , 0
    ) AS line_shipping_price_credited
  , line_payment_credited_base_amount * coalesce(
        line_shipping_tax_paid_base_amount / nullif(
  (line_payment_base_amount + line_item_store_credit_applied_base_amount + line_shipping_store_credit_applied_base_amount)
, 0)
      , 0
    ) AS line_shipping_tax_credited_base_amount
  , line_payment_credited * coalesce(
        line_shipping_tax_paid / nullif(
  (line_payment_amount + line_item_store_credit_applied + line_shipping_store_credit_applied)
, 0)
      , 0
    ) AS line_shipping_tax_credited
  , coalesce(
        payment_total_fee * line_share_of_payment
      , -1 * channel_fee_percentage * line_payment_amount
    ) - (agency_percentage * line_payment_amount) AS line_payment_fee
  , coalesce(payment_total_shipping_subsidy_base_amount * line_share_of_order_total_item_price, 0) AS line_payment_shipping_subsidy_base_amount
  , coalesce(payment_total_shipping_subsidy * line_share_of_order_total_item_price, 0) AS line_payment_shipping_subsidy
  , coalesce(
        refund_total_fee * line_share_of_refund
      , channel_fee_percentage * line_payment_refunded
    ) + (agency_percentage * line_payment_refunded) AS line_refund_fee
  , coalesce(refund_total_shipping_subsidy_base_amount * line_share_of_refund, 0) AS line_refund_shipping_subsidy_base_amount
  , coalesce(refund_total_shipping_subsidy * line_share_of_refund, 0) AS line_refund_shipping_subsidy
  , -1 * riskified_percentage * (line_payment_amount - line_payment_refunded) AS line_riskified_fee
  , ship_cost AS line_ship_cost
  , packaging_cost AS line_packaging_cost
  , line_affiliate_commission
/* fields after this get added to the end of sfl: */
  , tracking_number
  , coupon_code
  , shipping_postcode
  , transaction_state
  , acquisition_channel
  , default_channel_grouping
  , CASE
      WHEN sales_channel NOT IN ('SG Web', 'SG App')
        THEN sales_channel
      WHEN acquisition_channel = 'All Others' OR default_channel_grouping = 'Affiliates'
        THEN default_channel_grouping
      ELSE acquisition_channel
    END AS media_channel
  , ship_cost_source
  , line_channel_discount
  , line_channel_duties
  , line_channel_shipping
  , line_channel_additional_gtv
  , customer_name
  , customer_city
  , marketing_channel
  , line_share_of_payment
  , line_payment_amount
  , (line_item_store_credit_applied + line_shipping_store_credit_applied) AS line_credit_redeemed
  , (
    nullif(
     greatest(
      coalesce(order_serial_price - 
CASE
WHEN order_date < '2021-07-01' THEN (line_item_price_paid + line_item_store_credit_applied)
ELSE (line_item_price_paid + line_item_store_credit_applied - channel_upcharge_flat) / (1 + channel_upcharge_percentage)
END
, CAST('-9.9999999999999999999999999999999999999E+28' AS numeric))
      ,coalesce(line_item_discount, CAST('-9.9999999999999999999999999999999999999E+28' AS numeric))
      ,coalesce(0, CAST('-9.9999999999999999999999999999999999999E+28' AS numeric))
      
      )
     , CAST('-9.9999999999999999999999999999999999999E+28' AS numeric)
  )
 + 
  CASE
    WHEN 
  (
    line_shipping_discount_base_amount
    + line_shipping_store_credit_applied_base_amount
    + line_shipping_price_paid_base_amount
    + line_shipping_tax_paid_base_amount
    = 0
  )

    THEN free_shipping_value / total_order_lines
    ELSE line_shipping_discount
  END
) AS line_discount
  , (
  (line_payment_amount + line_item_store_credit_applied + line_shipping_store_credit_applied)
 + 
    nullif(
     greatest(
      coalesce(order_serial_price - 
CASE
WHEN order_date < '2021-07-01' THEN (line_item_price_paid + line_item_store_credit_applied)
ELSE (line_item_price_paid + line_item_store_credit_applied - channel_upcharge_flat) / (1 + channel_upcharge_percentage)
END
, CAST('-9.9999999999999999999999999999999999999E+28' AS numeric))
      ,coalesce(line_item_discount, CAST('-9.9999999999999999999999999999999999999E+28' AS numeric))
      ,coalesce(0, CAST('-9.9999999999999999999999999999999999999E+28' AS numeric))
      
      )
     , CAST('-9.9999999999999999999999999999999999999E+28' AS numeric)
  )
 + 
  CASE
    WHEN 
  (
    line_shipping_discount_base_amount
    + line_shipping_store_credit_applied_base_amount
    + line_shipping_price_paid_base_amount
    + line_shipping_tax_paid_base_amount
    = 0
  )

    THEN free_shipping_value / total_order_lines
    ELSE line_shipping_discount
  END
) AS line_gtv
  , (line_item_tax_paid + line_shipping_tax_paid) AS line_tax_paid
  , line_share_of_refund
  , line_payment_refunded
  , line_share_of_credit
  , line_payment_credited
  , line_duties_paid
  , line_payment_refunded * coalesce(line_duties_paid / nullif(line_payment_amount, 0), 0) AS line_duties_refunded
  , line_payment_credited * coalesce(
        line_duties_paid / nullif(
  (line_payment_amount + line_item_store_credit_applied + line_shipping_store_credit_applied)
, 0)
      , 0
    ) AS line_duties_credited
  , return_if_refunded
  , return_refund_threshold
  , return_refund_deduction
  , 
(return_if_refunded AND line_payment_refunded > return_refund_threshold * (line_payment_amount - return_refund_deduction))
 AS return_is_assumed_from_refund
  , fee_includes_ship_cost
  , fee_includes_duties
  , order_shipping_description
  , delivery_shipping_description
  , (
  (
    line_shipping_discount_base_amount
    + line_shipping_store_credit_applied_base_amount
    + line_shipping_price_paid_base_amount
    + line_shipping_tax_paid_base_amount
    = 0
  )
) AS free_shipping
  , rma_statuses
  , ship_cost_type
  , nullif(nullif(array_to_string(creditmemo_transaction_ids, ', '), 'NULL'), '') AS creditmemo_transaction_ids
  , first_creditmemo_creation_nyc
  , last_creditmemo_update_nyc
  , creditmemo_reason
  , creditmemo_item_price
  , creditmemo_item_qty
  , creditmemo_item_discount
  , creditmemo_item_tax
  , creditmemo_shipping
  , creditmemo_shipping_tax
  , creditmemo_discount
  , creditmemo_tax
  , creditmemo_adjustment
  , creditmemo_refunded
  , creditmemo_store_credit
  , creditmemo_store_credit_refunded
  , order_serial
  , order_serial_price_base_amount
  , order_serial_price
  , line_item_price_raw
  , line_item_discount_raw
  , serial_base_currency
  , serial_price
  , commission_rate
  , serial_cost_base_amount
  , serial_cost
  , purchase_id
  , purchase_reference
  , serial_purchase_price
  , payout_invoice_id
  , last_invoice_id
  , product_brand
  , product_name
  , product_attribute_set
  , ship_cost_from_fulfillment
  , ship_cost_from_fulfillment_type
  , ship_cost_from_fulfillment_source
  , tracking_number_from_fulfillment
  , p2p_ship_cost
  , dhl_ship_cost
  , fps_ship_cost
  , cap_invoiced_ship_cost
  , fedex_ship_cost
  , cap_confirmed_ship_cost
  , ship_cost_from_crossdock
  , ship_cost_from_crossdock_type
  , ship_cost_from_crossdock_source
  , crossdock_reference
  , zebra_ship_cost
  , flow_ship_cost
  , tmall_b2c_ship_cost
  , dhl_customs_invoice_id
  , dhl_customs_cost
  , dhl_duties_invoice_id
  , dhl_duties_cost
  , tmall_b2c_duties_cost
  , flow_duties_cost
  , private_customer_status
  , private_customer_stylist
  , private_customer_type
  , private_customer_source
  , private_client_customer_id
  , dropship_order_paid_out
  , seller_name
  , x3_creditmemo_id
  , x3_creditmemo_line
  , x3_creditmemo_creation_nyc
  , x3_creditmemo_total_refunded
  , return_intake_creation_nyc
  , return_intake_id
  , new_serial_from_return
  , new_serial_inventory_relationship
  , x3_return_creation_nyc
  , rma_closed_nyc
  , rma_package_approved_nyc
  , rma_last_reply_name
  , rma_last_reply_nyc
  , rma_last_update_nyc
  , issued_serial_next_journal_date_after_dispatch_date
  , issued_serial_next_journal_document_id_after_dispatch_date
  , billing_country
  , billing_city
  , shipment_id
  , ship_method
  , ship_method_is_express
  , order_shipping_is_express
  , 
CASE
WHEN order_date < '2021-07-01' THEN (line_item_price_paid_base_amount + line_item_store_credit_applied_base_amount)
ELSE (line_item_price_paid_base_amount + line_item_store_credit_applied_base_amount - channel_upcharge_flat_base_amount) / (1 + channel_upcharge_percentage)
END
 AS line_item_price_before_upcharge_base_amount
  , 
CASE
WHEN order_date < '2021-07-01' THEN (line_item_price_paid + line_item_store_credit_applied)
ELSE (line_item_price_paid + line_item_store_credit_applied - channel_upcharge_flat) / (1 + channel_upcharge_percentage)
END
 AS line_item_price_before_upcharge
  , 
(line_item_price_paid_base_amount + line_item_store_credit_applied_base_amount)
- 
CASE
WHEN order_date < '2021-07-01' THEN (line_item_price_paid_base_amount + line_item_store_credit_applied_base_amount)
ELSE (line_item_price_paid_base_amount + line_item_store_credit_applied_base_amount - channel_upcharge_flat_base_amount) / (1 + channel_upcharge_percentage)
END

 AS line_item_upcharge_base_amount
  , 
(line_item_price_paid + line_item_store_credit_applied)
- 
CASE
WHEN order_date < '2021-07-01' THEN (line_item_price_paid + line_item_store_credit_applied)
ELSE (line_item_price_paid + line_item_store_credit_applied - channel_upcharge_flat) / (1 + channel_upcharge_percentage)
END

 AS line_item_upcharge
  , order_created_at
  , order_serial_previous_price
  , order_serial_price_changed_at
  , seller_portal_promotion_type
  , seller_portal_promotion_started_at
  , marketing_promo_type
  , marketing_promo_description
  , seller_country
  , seller_city
  , external_order_has_item_discount
  , external_order_has_shipping_discount
  , rma_item_qty_requested
  , CASE
      WHEN ( 
  dispatch_date IS NOT NULL
  AND (
    returns = 1
    OR 
(return_if_refunded AND line_payment_refunded > return_refund_threshold * (line_payment_amount - return_refund_deduction))

  )
 )
      THEN nullif(
     least(
      coalesce(return_date, CAST('9999-12-31' AS date))
      ,coalesce(CASE WHEN 
(return_if_refunded AND line_payment_refunded > return_refund_threshold * (line_payment_amount - return_refund_deduction))
 THEN 
CAST(CAST(refund_timestamp_nyc AS datetime) AS date)
 END, CAST('9999-12-31' AS date))
      
      )
     , CAST('9999-12-31' AS date)
  )
    END AS return_date
  , CASE
      WHEN ( 
  dispatch_date IS NOT NULL
  AND (
    returns = 1
    OR 
(return_if_refunded AND line_payment_refunded > return_refund_threshold * (line_payment_amount - return_refund_deduction))

  )
 )
      THEN coalesce(return_source, CASE WHEN 
(return_if_refunded AND line_payment_refunded > return_refund_threshold * (line_payment_amount - return_refund_deduction))
 THEN 'Assumed from Refund' END)
    END AS return_source
  FROM finance_lines_raw
  

)

SELECT * FROM final