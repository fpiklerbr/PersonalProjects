/*
TODO for DE-3487: update docs
*/







WITH orphan_transactions AS (

  SELECT
    farfetch_transactions.mag_order_id AS stadium_order_id
  , farfetch_transactions.transaction_id AS payment_id
  , CASE
      WHEN farfetch_transactions.refund_processed_at IS NOT NULL
      THEN farfetch_transactions.transaction_id
    END AS refund_id
  , farfetch_transactions.fps_order_code
  , farfetch_transactions.fps_stock_point_id
  , farfetch_transactions.fps_merchant_name
  , farfetch_transactions.channel_or_gateway
  , farfetch_transactions.business_unit
  , farfetch_transactions.sales_channel
  , farfetch_transactions.data_source
  , farfetch_transactions.transaction_state
  , farfetch_transactions.checkout_status
  , farfetch_transactions.payment_processed_at AS order_created_at
  , safe_cast(datetime(safe_cast(farfetch_transactions.payment_processed_at AS timestamp), 'America/New_York') AS date) AS order_date
  , farfetch_transactions.base_currency AS order_base_currency
  , farfetch_transactions.payment_base_amount AS actual_payment_total_base_amount
  , farfetch_transactions.payment_amount AS actual_payment_total
  , farfetch_transactions.payment_fee_base_amount AS payment_total_fee_base_amount
  , farfetch_transactions.payment_fee AS payment_total_fee
  , farfetch_transactions.payment_shipping_subsidy_base_amount AS payment_total_shipping_subsidy_base_amount
  , farfetch_transactions.payment_shipping_subsidy AS payment_total_shipping_subsidy
  , safe_cast(datetime(safe_cast(farfetch_transactions.refund_processed_at AS timestamp), 'America/New_York') AS datetime) AS refund_timestamp_nyc
  , farfetch_transactions.refund_base_amount AS actual_refund_total_base_amount
  , farfetch_transactions.refund_amount AS actual_refund_total
  , farfetch_transactions.refund_fee_base_amount AS refund_total_fee_base_amount
  , farfetch_transactions.refund_fee AS refund_total_fee
  , farfetch_transactions.refund_shipping_subsidy_base_amount AS refund_total_shipping_subsidy_base_amount
  , farfetch_transactions.refund_shipping_subsidy AS refund_total_shipping_subsidy
  , farfetch_transactions.geography_type
  , farfetch_transactions.geography
  , upcharge_percentage.upcharge_value AS channel_upcharge_percentage
  , upcharge_flat.upcharge_value AS channel_upcharge_flat_base_amount --currency unknown but this is always zero for farfetch/fps
  , lookup_channels.fee_percentage AS channel_fee_percentage
  , lookup_channels.agency_percentage
  , lookup_channels.riskified_percentage
  , lookup_channels.return_refund_deduction
  , lookup_channels.return_refund_threshold
  , farfetch_transactions.shipping_price_base_amount AS order_total_shipping_price_base_amount
  , farfetch_transactions.shipping_discount_base_amount AS order_total_shipping_discount_base_amount
  , farfetch_transactions.shipping_tax_base_amount AS order_total_shipping_tax_base_amount
  , CASE WHEN farfetch_transactions.fps_stock_point_id = '14376' THEN 0
    ELSE farfetch_transactions.total_item_discount_base_amount
        END AS order_total_item_discount_base_amount
  , farfetch_transactions.promo_code
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_farfetch_transactions` AS farfetch_transactions
  INNER JOIN (
    SELECT DISTINCT
      channel_or_gateway
      , fee_percentage
      , agency_percentage
      , riskified_percentage
      , return_refund_deduction
      , return_refund_threshold
    FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_channels`
  ) AS lookup_channels
    ON farfetch_transactions.channel_or_gateway = lookup_channels.channel_or_gateway
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_channel_upcharge_history` AS upcharge_flat
    ON farfetch_transactions.channel_or_gateway = upcharge_flat.channel_or_gateway
    AND coalesce(farfetch_transactions.payment_processed_at, farfetch_transactions.refund_processed_at) BETWEEN upcharge_flat.valid_from AND upcharge_flat.valid_to
    AND upcharge_flat.upcharge_type = 'flat'
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_channel_upcharge_history` AS upcharge_percentage
    ON farfetch_transactions.channel_or_gateway = upcharge_percentage.channel_or_gateway
    AND coalesce(farfetch_transactions.payment_processed_at, farfetch_transactions.refund_processed_at) BETWEEN upcharge_percentage.valid_from AND upcharge_percentage.valid_to
    AND upcharge_percentage.upcharge_type = 'percentage'
  WHERE farfetch_transactions.is_excluded_from_financial_reporting IS NOT TRUE
    AND farfetch_transactions.payment_processed_at IS NOT NULL
    AND farfetch_transactions.checkout_status IN ('Paid', 'Approved')

), orphan_order_lines AS (

  SELECT
      orphan_transactions.stadium_order_id
    , orphan_transactions.payment_id
    , coalesce(
          orphan_transactions.fps_order_code
        , orphan_transactions.stadium_order_id
        , orphan_transactions.payment_id
      ) AS order_or_payment_id
    , orphan_transactions.fps_stock_point_id
    , orphan_transactions.fps_merchant_name
    , orphan_transactions.channel_or_gateway
    , orphan_transactions.business_unit
    , orphan_transactions.sales_channel
    , orphan_transactions.data_source
    , orphan_transactions.order_date
    , nullif(count(*) OVER (PARTITION BY orphan_transactions.payment_id), 0) AS total_order_lines
    , orphan_transactions.order_base_currency
    , fps_order_items.payment_currency_conversion_date
    , fps_order_items.payment_currency_conversion_rate
    , cast(NULL AS numeric) AS expected_payment_total
    , orphan_transactions.actual_payment_total_base_amount
    , orphan_transactions.actual_payment_total
    , orphan_transactions.payment_total_fee_base_amount
    , orphan_transactions.payment_total_fee
    , orphan_transactions.payment_total_shipping_subsidy_base_amount
    , orphan_transactions.payment_total_shipping_subsidy
    , coalesce(stadium_order_lines.simple_sku, fps_order_lines.simple_sku) AS simple_sku
    , stadium_order_lines.order_simple_sku_line
    , stadium_order_lines.mag_order_id
    , fps_order_lines.order_item_id
    , stadium_order_lines.order_item_line
    , stadium_order_lines.ether_order_number
    , stadium_order_lines.ether_order_item_line_number
    , stadium_order_lines.x3_order_id
    , stadium_order_lines.x3_order_line
    , stadium_order_lines.fulfillment_number
    , stadium_order_lines.allocation_line_number
    , products.attribute_set AS product_attribute_set
    , products.brand AS product_brand
    , products.name AS product_name
    , products.mfg_sku AS product_sku
    , products.size AS variant_size
    , stadium_order_lines.serial_source
    , stadium_order_lines.order_sku_size_source_line
    , stadium_order_lines.order_serial
    , stadium_order_lines.order_serial_base_currency
    , stadium_order_lines.order_serial_price_base_amount
    , stadium_order_lines.order_serial_price
    , stadium_order_lines.line_item_price_raw
    , stadium_order_lines.line_item_discount_raw
    , stadium_order_lines.line_item_discount AS line_item_discount_base_amount
    , CASE WHEN orphan_transactions.fps_stock_point_id = '14376'
        THEN fps_order_items.payment_item_price_base_amount
      ELSE coalesce(
          fps_order_lines.item_price_base_amount
        , fps_order_items.payment_item_price_base_amount
      )
        END AS line_item_price_base_amount
    , CASE WHEN orphan_transactions.fps_stock_point_id = '14376'
        THEN 0
      ELSE coalesce(
          fps_order_lines.item_discount_base_amount
        , abs(fps_order_items.payment_item_discount_base_amount)
      )
        END AS line_item_external_discount_base_amount
    , cast(0 AS numeric) AS line_item_store_credit_applied_base_amount
    , CAST(NULL AS numeric) AS expected_line_item_payment
    , CASE WHEN orphan_transactions.fps_stock_point_id = '14376'
        THEN fps_order_items.payment_item_tax_base_amount
      ELSE coalesce(
          fps_order_lines.item_tax_base_amount
        , fps_order_items.payment_item_tax_base_amount
      )
        END AS line_item_tax_base_amount
    , orphan_transactions.order_total_shipping_price_base_amount / nullif(count(*) OVER (PARTITION BY orphan_transactions.payment_id), 0) AS line_shipping_price_base_amount
    , orphan_transactions.order_total_shipping_discount_base_amount / nullif(count(*) OVER (PARTITION BY orphan_transactions.payment_id), 0) AS line_shipping_discount_base_amount
    , cast(0 AS numeric) AS line_shipping_store_credit_applied_base_amount
    , CAST(NULL AS numeric) AS expected_line_shipping_payment
    , orphan_transactions.order_total_shipping_tax_base_amount / nullif(count(*) OVER (PARTITION BY orphan_transactions.payment_id), 0) AS line_shipping_tax_base_amount
    , CAST(NULL AS numeric) AS tmall_order_shipping
    , stadium_order_lines.serial_number
    , stadium_order_lines.serial_base_currency
    , stadium_order_lines.serial_price_base_amount
    , stadium_order_lines.serial_price
    , stadium_order_lines.commission_rate
    , stadium_order_lines.serial_cost_base_amount
    , stadium_order_lines.serial_cost
    , stadium_order_lines.serial_purchase_price
    , stadium_order_lines.purchase_id
    , stadium_order_lines.purchase_reference
    , stadium_order_lines.payout_invoice_id
    , stadium_order_lines.last_invoice_id
    , stadium_order_lines.inventory_base_currency
    , stadium_order_lines.inventory_cost_currency_conversion_date
    , stadium_order_lines.inventory_cost_currency_conversion_rate
    , stadium_order_lines.inventory_cost_base_amount
    , stadium_order_lines.inventory_cost
    , coalesce(stadium_order_lines.inventory_relationship, '3P') AS inventory_relationship
    , coalesce(stadium_order_lines.inventory_type, 'Consignment') AS inventory_type
    , stadium_order_lines.inventory_source
    , coalesce(stadium_order_lines.inventory_seller, 'Unknown') AS inventory_seller
    , stadium_order_lines.dispatch_date
    , stadium_order_lines.dispatch_warehouse
    , stadium_order_lines.dispatch_country
    , coalesce(stadium_order_lines.serial_order_match, FALSE) AS serial_order_match
    , coalesce(stadium_order_lines.returns, 0) AS `returns`
    , stadium_order_lines.mag_creditmemo_ids
    , stadium_order_lines.mag_rma_ids
    , stadium_order_lines.x3_return_id
    , stadium_order_lines.x3_creditmemo_id
    , stadium_order_lines.x3_creditmemo_line
    , stadium_order_lines.x3_creditmemo_creation_nyc
    , stadium_order_lines.x3_creditmemo_total_refunded
    , CASE
        WHEN fps_order_items.refund_processed_at IS NOT NULL
        THEN orphan_transactions.refund_id
      END AS refund_id
    , CASE
        WHEN fps_order_items.refund_processed_at IS NOT NULL
        THEN orphan_transactions.refund_timestamp_nyc
      END AS refund_timestamp_nyc
    , CASE
        WHEN fps_order_items.refund_processed_at IS NOT NULL
        THEN fps_order_items.refund_currency_conversion_date
      END AS refund_currency_conversion_date
    , CASE
        WHEN fps_order_items.refund_processed_at IS NOT NULL
        THEN fps_order_items.refund_currency_conversion_rate
      END AS refund_currency_conversion_rate
    , CASE
        WHEN fps_order_items.refund_processed_at IS NOT NULL
        THEN orphan_transactions.actual_refund_total_base_amount
      END AS actual_refund_total_base_amount
    , CASE
        WHEN fps_order_items.refund_processed_at IS NOT NULL
        THEN orphan_transactions.actual_refund_total
      END AS actual_refund_total
    , cast(0 AS numeric) AS actual_store_credit_total_base_amount
    , cast(0 AS numeric) AS actual_store_credit_total
    , CASE
        WHEN fps_order_items.refund_processed_at IS NOT NULL
        THEN orphan_transactions.refund_total_fee_base_amount
      END AS refund_total_fee_base_amount
    , CASE
        WHEN fps_order_items.refund_processed_at IS NOT NULL
        THEN orphan_transactions.refund_total_fee
      END AS refund_total_fee
    , CASE
        WHEN fps_order_items.refund_processed_at IS NOT NULL
        THEN orphan_transactions.refund_total_shipping_subsidy_base_amount
      END AS refund_total_shipping_subsidy_base_amount
    , CASE
        WHEN fps_order_items.refund_processed_at IS NOT NULL
        THEN orphan_transactions.refund_total_shipping_subsidy
      END AS refund_total_shipping_subsidy
    , coalesce(stadium_order_lines.ship_cost, 0) AS ship_cost
    , coalesce(stadium_order_lines.packaging_cost, 0) AS packaging_cost
    , orphan_transactions.agency_percentage
    , orphan_transactions.channel_fee_percentage
    , orphan_transactions.riskified_percentage
    , coalesce(stadium_order_lines.order_total_affiliate_commission, 0) AS order_total_affiliate_commission
    , stadium_order_lines.affiliate_offer
    , stadium_order_lines.affiliate_publisher
    , stadium_order_lines.affiliate_publisher_group
    , stadium_order_lines.acquisition_medium
    , stadium_order_lines.acquisition_source
    , stadium_order_lines.acquisition_campaign
    , stadium_order_lines.acquisition_device_category
    , stadium_order_lines.unique_email
    , stadium_order_lines.private_customer_status
    , stadium_order_lines.private_customer_stylist
    , stadium_order_lines.private_customer_type
    , stadium_order_lines.private_customer_source
    , stadium_order_lines.private_client_customer_id
    , stadium_order_lines.customer_id
    , stadium_order_lines.order_creation_nyc
    , stadium_order_lines.mag_order_entity_id
    , coalesce(stadium_order_lines.geography_type, orphan_transactions.geography_type) AS geography_type
    , coalesce(stadium_order_lines.geography, orphan_transactions.geography) AS geography
    , stadium_order_lines.receipt_date
    , stadium_order_lines.tracking_number
    , coalesce(
          orphan_transactions.promo_code
        , stadium_order_lines.coupon_code
      ) AS coupon_code
    , stadium_order_lines.shipping_postcode

    , orphan_transactions.transaction_state
    , stadium_order_lines.marketing_channel AS acquisition_channel
    , stadium_order_lines.marketing_channel AS default_channel_grouping
    , stadium_order_lines.ship_cost_source
    , stadium_order_lines.external_return_id
    , CAST(0 AS numeric) AS total_channel_discount
    , CAST(0 AS numeric) AS total_channel_duties
    , CAST(0 AS numeric) AS total_channel_shipping
    , CAST(0 AS numeric) AS total_channel_additional_gtv
    , stadium_order_lines.customer_name
    , stadium_order_lines.customer_city
    , coalesce(stadium_order_lines.marketing_channel, orphan_transactions.sales_channel) AS marketing_channel
    , FALSE AS return_if_refunded
    , orphan_transactions.return_refund_threshold
    , orphan_transactions.return_refund_deduction
    , FALSE AS fee_includes_ship_cost
    , FALSE AS fee_includes_duties
    , coalesce(
          cast(stadium_order_lines.free_shipping_value AS numeric)
        , 0
      ) AS free_shipping_value_base_amount
    , stadium_order_lines.order_shipping_description
    , stadium_order_lines.delivery_shipping_description
    , stadium_order_lines.rma_statuses
    , stadium_order_lines.ship_cost_type
    , stadium_order_lines.creditmemo_transaction_ids
    , stadium_order_lines.first_creditmemo_creation_nyc
    , stadium_order_lines.last_creditmemo_update_nyc
    , stadium_order_lines.creditmemo_reason
    , stadium_order_lines.creditmemo_item_price
    , stadium_order_lines.creditmemo_item_qty
    , stadium_order_lines.creditmemo_item_discount
    , stadium_order_lines.creditmemo_item_tax
    , stadium_order_lines.creditmemo_shipping
    , stadium_order_lines.creditmemo_shipping_tax
    , stadium_order_lines.creditmemo_discount
    , stadium_order_lines.creditmemo_tax
    , stadium_order_lines.creditmemo_adjustment
    , stadium_order_lines.creditmemo_refunded
    , stadium_order_lines.creditmemo_store_credit
    , stadium_order_lines.creditmemo_store_credit_refunded
    , stadium_order_lines.ship_cost_from_fulfillment
    , stadium_order_lines.ship_cost_from_fulfillment_type
    , stadium_order_lines.ship_cost_from_fulfillment_source
    , stadium_order_lines.tracking_number_from_fulfillment
    , stadium_order_lines.p2p_ship_cost
    , stadium_order_lines.dhl_ship_cost
    , stadium_order_lines.fps_ship_cost
    , stadium_order_lines.cap_invoiced_ship_cost
    , stadium_order_lines.fedex_ship_cost
    , stadium_order_lines.cap_confirmed_ship_cost
    , stadium_order_lines.ship_cost_from_crossdock
    , stadium_order_lines.ship_cost_from_crossdock_type
    , stadium_order_lines.ship_cost_from_crossdock_source
    , stadium_order_lines.crossdock_reference
    , stadium_order_lines.zebra_ship_cost
    , stadium_order_lines.flow_ship_cost
    , stadium_order_lines.tmall_b2c_ship_cost
    , stadium_order_lines.dhl_customs_invoice_id
    , stadium_order_lines.dhl_customs_cost
    , stadium_order_lines.dhl_duties_invoice_id
    , stadium_order_lines.dhl_duties_cost
    , stadium_order_lines.tmall_b2c_duties_cost
    , stadium_order_lines.flow_duties_cost
    , stadium_order_lines.dropship_order_paid_out
    , stadium_order_lines.seller_name
    , stadium_order_lines.return_intake_creation_nyc
    , stadium_order_lines.return_intake_id
    , stadium_order_lines.new_serial_from_return
    , stadium_order_lines.new_serial_inventory_relationship
    , stadium_order_lines.x3_return_creation_nyc
    , stadium_order_lines.rma_closed_nyc
    , stadium_order_lines.rma_package_approved_nyc
    , stadium_order_lines.rma_last_reply_name
    , stadium_order_lines.rma_last_reply_nyc
    , stadium_order_lines.last_rma_update_nyc AS rma_last_update_nyc
    , stadium_order_lines.issued_serial_next_journal_date_after_dispatch_date
    , stadium_order_lines.issued_serial_next_journal_document_id_after_dispatch_date
    , stadium_order_lines.billing_country
    , stadium_order_lines.billing_city
    , coalesce(stadium_order_lines.delivery_id, stadium_order_lines.mag_shipment_ids) AS shipment_id
    , stadium_order_lines.ship_method AS ship_method
    , stadium_order_lines.ship_method_is_express AS ship_method_is_express
    , stadium_order_lines.order_shipping_is_express AS order_shipping_is_express

    , orphan_transactions.channel_upcharge_percentage
    , orphan_transactions.channel_upcharge_flat_base_amount
    , orphan_transactions.order_created_at
    , stadium_order_lines.order_serial_previous_price
    , stadium_order_lines.order_serial_price_changed_at
    , stadium_order_lines.seller_portal_promotion_type
    , stadium_order_lines.seller_portal_promotion_started_at
    , stadium_order_lines.marketing_promo_type
    , stadium_order_lines.marketing_promo_description
    , stadium_order_lines.seller_country
    , stadium_order_lines.seller_city
    , CASE
        WHEN orphan_transactions.order_total_item_discount_base_amount <> 0
        THEN TRUE
        ELSE FALSE
      END AS external_order_has_item_discount
    , CASE
        WHEN orphan_transactions.order_total_shipping_discount_base_amount <> 0
        THEN TRUE
        ELSE FALSE
      END AS external_order_has_shipping_discount
    , stadium_order_lines.rma_item_qty_requested
    , stadium_order_lines.return_date
    , stadium_order_lines.return_source
    , orphan_transactions.fps_order_code
    , fps_order_lines.fps_order_line
    , substr(
    concat(
    
      coalesce(orphan_transactions.fps_order_code|| '-' , '')
    
      , coalesce(
coalesce(
    fps_order_lines.fps_order_line
  , substr(
    concat(
    
      coalesce(fps_order_items.fps_order_id|| '-' , '')
    
      , coalesce(fps_order_items.fps_parent_product_id|| '-' , '')
    
      , coalesce(fps_order_items.fps_product_size|| '-' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(fps_order_items.fps_order_id|| '-' , '')
    
      , coalesce(fps_order_items.fps_parent_product_id|| '-' , '')
    
      , coalesce(fps_order_items.fps_product_size|| '-' , '')
    
  )) - length('-')
      , 0
    )
)
)
|| '-' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(orphan_transactions.fps_order_code|| '-' , '')
    
      , coalesce(
coalesce(
    fps_order_lines.fps_order_line
  , substr(
    concat(
    
      coalesce(fps_order_items.fps_order_id|| '-' , '')
    
      , coalesce(fps_order_items.fps_parent_product_id|| '-' , '')
    
      , coalesce(fps_order_items.fps_product_size|| '-' , '')
    
  )
  , 1
  , greatest(
        length(concat(
    
      coalesce(fps_order_items.fps_order_id|| '-' , '')
    
      , coalesce(fps_order_items.fps_parent_product_id|| '-' , '')
    
      , coalesce(fps_order_items.fps_product_size|| '-' , '')
    
  )) - length('-')
      , 0
    )
)
)
|| '-' , '')
    
  )) - length('-')
      , 0
    )
) AS order_line_id
  FROM orphan_transactions
  INNER JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`fps_order_items` AS fps_order_items
    ON orphan_transactions.payment_id = fps_order_items.fps_order_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`fps_order_lines` AS fps_order_lines
    ON fps_order_items.fps_order_id = fps_order_lines.fps_order_id
    AND fps_order_items.fps_parent_product_id = fps_order_lines.fps_parent_product_id
    AND fps_order_items.fps_product_size = fps_order_lines.fps_product_size
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_order_lines` AS stadium_order_lines
    ON fps_order_lines.order_item_id = stadium_order_lines.order_item_id
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_products` AS products
    ON coalesce(stadium_order_lines.simple_sku, fps_order_lines.simple_sku) = products.simple_sku

), currency_conversion AS (

  SELECT
      orphan_order_lines.*

    , coalesce(payment_currency_conversion_rate, refund_currency_conversion_rate) * line_item_discount_base_amount AS line_item_discount

    , coalesce(payment_currency_conversion_rate, refund_currency_conversion_rate) * line_item_price_base_amount AS line_item_price

    , coalesce(payment_currency_conversion_rate, refund_currency_conversion_rate) * line_item_external_discount_base_amount AS line_item_external_discount

    , coalesce(payment_currency_conversion_rate, refund_currency_conversion_rate) * line_item_store_credit_applied_base_amount AS line_item_store_credit_applied

    , coalesce(payment_currency_conversion_rate, refund_currency_conversion_rate) * line_item_tax_base_amount AS line_item_tax

    , coalesce(payment_currency_conversion_rate, refund_currency_conversion_rate) * line_shipping_price_base_amount AS line_shipping_price

    , coalesce(payment_currency_conversion_rate, refund_currency_conversion_rate) * line_shipping_discount_base_amount AS line_shipping_discount

    , coalesce(payment_currency_conversion_rate, refund_currency_conversion_rate) * line_shipping_store_credit_applied_base_amount AS line_shipping_store_credit_applied

    , coalesce(payment_currency_conversion_rate, refund_currency_conversion_rate) * line_shipping_tax_base_amount AS line_shipping_tax

    , coalesce(payment_currency_conversion_rate, refund_currency_conversion_rate) * channel_upcharge_flat_base_amount AS channel_upcharge_flat

    , coalesce(payment_currency_conversion_rate, refund_currency_conversion_rate) * free_shipping_value_base_amount AS free_shipping_value

  FROM orphan_order_lines

), final AS (

  SELECT
      *
    , coalesce(
          (
            coalesce(line_item_price_base_amount,0) + coalesce(line_item_tax_base_amount,0) + coalesce(line_shipping_price_base_amount,0) + coalesce(line_shipping_tax_base_amount,0)
          ) / nullif(sum(
            coalesce(line_item_price_base_amount,0) + coalesce(line_item_tax_base_amount,0) + coalesce(line_shipping_price_base_amount,0) + coalesce(line_shipping_tax_base_amount,0)
          ) OVER (PARTITION BY payment_id), 0)
        , 
cast(1 AS numeric) / total_order_lines

      ) AS line_share_of_order_gtv
    , coalesce(
          (coalesce(line_item_price_base_amount, 0)) / nullif(sum(coalesce(line_item_price_base_amount, 0)) OVER (PARTITION BY payment_id), 0)
        , 
cast(1 AS numeric) / total_order_lines

      ) AS line_share_of_order_total_item_price
    , coalesce(
          (
coalesce(line_item_price_base_amount, 0)
- coalesce(line_item_external_discount_base_amount, 0)
+ coalesce(line_item_tax_base_amount, 0)
+ coalesce(line_shipping_price_base_amount, 0)
- coalesce(line_shipping_discount_base_amount, 0)
+ coalesce(line_shipping_tax_base_amount, 0)
) / nullif(sum(
coalesce(line_item_price_base_amount, 0)
- coalesce(line_item_external_discount_base_amount, 0)
+ coalesce(line_item_tax_base_amount, 0)
+ coalesce(line_shipping_price_base_amount, 0)
- coalesce(line_shipping_discount_base_amount, 0)
+ coalesce(line_shipping_tax_base_amount, 0)
) OVER (PARTITION BY payment_id), 0)
        , 
cast(1 AS numeric) / total_order_lines

      ) AS line_share_of_payment
    , coalesce(
          (
coalesce(line_item_price_base_amount, 0)
- coalesce(line_item_external_discount_base_amount, 0)
+ coalesce(line_item_tax_base_amount, 0)
+ coalesce(line_shipping_price_base_amount, 0)
- coalesce(line_shipping_discount_base_amount, 0)
+ coalesce(line_shipping_tax_base_amount, 0)
) / nullif(sum(
coalesce(line_item_price_base_amount, 0)
- coalesce(line_item_external_discount_base_amount, 0)
+ coalesce(line_item_tax_base_amount, 0)
+ coalesce(line_shipping_price_base_amount, 0)
- coalesce(line_shipping_discount_base_amount, 0)
+ coalesce(line_shipping_tax_base_amount, 0)
) OVER (PARTITION BY payment_id), 0)
        , 
cast(1 AS numeric) / total_order_lines

      ) AS line_share_of_payment_and_credit_redeemed
    , 
cast(1 AS numeric) / total_order_lines
 AS line_share_of_order_shipping
    , coalesce(
          (
            coalesce(line_item_price_base_amount, 0) - coalesce(line_item_external_discount_base_amount, 0)
          ) / nullif(actual_payment_total_base_amount, 0)
        , 
cast(1 AS numeric) / total_order_lines

      ) AS line_item_price_share_of_order_payment
    , coalesce(
          coalesce(line_item_tax_base_amount, 0) / nullif(actual_payment_total_base_amount, 0)
        , 
cast(1 AS numeric) / total_order_lines

      ) AS line_item_tax_share_of_order_payment
    , coalesce(
          (
            coalesce(line_shipping_price_base_amount, 0) - coalesce(line_shipping_discount_base_amount, 0)
          ) / nullif(actual_payment_total_base_amount, 0)
        , 
cast(1 AS numeric) / total_order_lines

      ) AS line_shipping_price_share_of_order_payment
    , coalesce(
          coalesce(line_shipping_tax_base_amount, 0) / nullif(actual_payment_total_base_amount, 0)
        , 
cast(1 AS numeric) / total_order_lines

      ) AS line_shipping_tax_share_of_order_payment
    , cast(0 AS numeric) AS line_duties_share_of_order_payment
  FROM currency_conversion

)

SELECT * from final