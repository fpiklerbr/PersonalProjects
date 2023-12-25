

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_finance_lines_order_transactions`
  
  
  OPTIONS()
  as (
    /*
  TODO for DE-3487: update docs
*/












SELECT
    sol_matrix.stadium_order_id
  , order_payments.payment_id
  , coalesce(order_payments.fps_order_code, sol_matrix.stadium_order_id) AS order_or_payment_id
  , order_payments.fps_stock_point_id
  , order_payments.fps_merchant_name
  , coalesce(
        order_payments.payment_channel_or_gateway
      , CASE
          WHEN coalesce(order_payments.payment_amount, sol_matrix.mag_order_payment, sol_matrix.x3_order_total, 0) = 0
            AND (sol_matrix.order_total_item_store_credit_applied + sol_matrix.order_shipping_store_credit_applied) <> 0
          THEN 'Store Credit'
        END
      , sol_matrix.channel_or_gateway
    ) AS channel_or_gateway
  , coalesce(order_payments.payment_business_unit, sol_matrix.business_unit) AS business_unit
  , coalesce(order_payments.payment_sales_channel, sol_matrix.sales_channel) AS sales_channel
  , coalesce(order_payments.payment_data_source, sol_matrix.data_source) AS data_source
  , nullif(
     least(
      coalesce(SAFE_CAST(SAFE_CAST(order_payments.payment_timestamp_nyc AS datetime) AS date), CAST('9999-12-31' AS date))
      ,coalesce(sol_matrix.order_date, CAST('9999-12-31' AS date))
      
      )
     , CAST('9999-12-31' AS date)
  ) AS order_date
  , sol_matrix.total_order_lines
  , sol_matrix.expected_order_payment AS expected_payment_total
  , coalesce(order_payments.payment_amount, sol_matrix.mag_order_payment, sol_matrix.x3_order_total, 0) AS actual_payment_total_base_amount
  , coalesce(order_payments.payment_amount, sol_matrix.mag_order_payment, sol_matrix.x3_order_total, 0) AS actual_payment_total --TODO: remove after currency-conversion consolidation for DE-3611
  , order_payments.payment_fee AS payment_total_fee
  , order_payments.payment_shipping_subsidy AS payment_total_shipping_subsidy_base_amount
  , order_payments.payment_shipping_subsidy AS payment_total_shipping_subsidy --TODO: remove after currency-conversion consolidation for DE-3611
  , sol_matrix.simple_sku
  , sol_matrix.order_simple_sku_line
  , sol_matrix.mag_order_id
  , sol_matrix.order_item_id
  , sol_matrix.order_item_line
  , sol_matrix.ether_order_number
  , sol_matrix.ether_order_item_line_number
  , sol_matrix.x3_order_id
  , sol_matrix.x3_order_line
  , sol_matrix.fulfillment_number
  , sol_matrix.allocation_line_number
  , sol_matrix.product_attribute_set
  , sol_matrix.product_brand
  , sol_matrix.product_name
  , sol_matrix.product_sku
  , sol_matrix.variant_size
  , sol_matrix.serial_source
  , sol_matrix.order_sku_size_source_line
  , sol_matrix.order_serial
  , sol_matrix.order_serial_base_currency
  , sol_matrix.order_serial_price_base_amount
  , sol_matrix.order_serial_price --TODO: remove after currency-conversion consolidation for DE-3611
  , sol_matrix.order_base_currency
  , sol_matrix.line_item_price_raw
  , sol_matrix.line_item_discount_raw
  , sol_matrix.line_item_price
  , sol_matrix.line_item_discount AS line_item_discount_base_amount
  , sol_matrix.line_item_discount --TODO: remove after currency-conversion consolidation for DE-3611
  , sol_matrix.line_item_store_credit_applied AS line_item_store_credit_applied_base_amount
  , sol_matrix.line_item_store_credit_applied --TODO: remove after currency-conversion consolidation for DE-3611
  , CAST(NULL AS numeric) AS expected_line_item_payment
  , sol_matrix.line_item_tax
  , sol_matrix.line_shipping_price
  , sol_matrix.line_shipping_discount AS line_shipping_discount_base_amount
  , sol_matrix.line_shipping_discount --TODO: remove after currency-conversion consolidation for DE-3611
  , sol_matrix.line_shipping_store_credit_applied AS line_shipping_store_credit_applied_base_amount
  , sol_matrix.line_shipping_store_credit_applied --TODO: remove after currency-conversion consolidation for DE-3611
  , CAST(NULL AS numeric) AS expected_line_shipping_payment
  , sol_matrix.line_shipping_tax
  , CAST(NULL AS numeric) AS tmall_order_shipping
  , sol_matrix.serial_number
  , sol_matrix.serial_base_currency
  , sol_matrix.serial_price_base_amount
  , sol_matrix.serial_price --TODO: remove after currency-conversion consolidation for DE-3611
  , sol_matrix.commission_rate
  , sol_matrix.serial_cost_base_amount
  , sol_matrix.serial_cost --TODO: *don't* remove after currency-conversion consolidation for DE-3611, but *do* expose currency-conversion date & rate from the serial
  , sol_matrix.serial_purchase_price
  , sol_matrix.purchase_id
  , sol_matrix.purchase_reference
  , sol_matrix.payout_invoice_id
  , sol_matrix.last_invoice_id
  , sol_matrix.inventory_base_currency
  , sol_matrix.inventory_cost_base_amount
  , sol_matrix.inventory_cost --TODO: *don't* remove after currency-conversion consolidation for DE-3611, but *do* expose currency-conversion date & rate from the serial
  , sol_matrix.inventory_relationship
  , sol_matrix.inventory_type
  , sol_matrix.inventory_source
  , sol_matrix.inventory_seller
  , sol_matrix.dispatch_date
  , sol_matrix.dispatch_warehouse
  , sol_matrix.dispatch_country
  , coalesce(sol_matrix.serial_order_match, FALSE) AS serial_order_match
  , sol_matrix.`returns`
  , sol_matrix.mag_creditmemo_ids
  , sol_matrix.mag_rma_ids
  , sol_matrix.x3_return_id
  , sol_matrix.x3_creditmemo_id
  , sol_matrix.x3_creditmemo_line
  , sol_matrix.x3_creditmemo_creation_nyc
  , sol_matrix.x3_creditmemo_total_refunded
  , CASE
      WHEN creditmemo_refunds.creditmemo_refund_id IS NOT NULL
        THEN creditmemo_refunds.creditmemo_refund_id
      WHEN sol_matrix.mag_creditmemo_ids IS NOT NULL OR sol_matrix.x3_creditmemo_id IS NOT NULL
        THEN coalesce(
            order_refunds.order_refund_id
          , 'Mag Creditmemo ' || sol_matrix.mag_creditmemo_ids
          , 'X3 Creditmemo ' || sol_matrix.x3_creditmemo_id
        )
      WHEN 
  (
    (sol_matrix.mag_order_refunded > 0 OR sol_matrix.mag_order_store_credit > 0 OR order_refunds.order_refund_id IS NOT NULL)
    AND sol_matrix.order_lines_with_creditmemo = 0
    AND (
      sol_matrix.refund_expected
      OR sol_matrix.order_lines_with_refund_expected = 0
    )
  )

        THEN coalesce(
            order_refunds.order_refund_id
          , 'RMA ' || sol_matrix.mag_rma_ids
          , 'X3 Return ' || sol_matrix.x3_return_id
          , 'Mag Order ' || sol_matrix.mag_order_id
        )
    END AS refund_id
  , CASE
      WHEN creditmemo_refunds.creditmemo_refund_id IS NOT NULL
        THEN creditmemo_refunds.creditmemo_refund_timestamp_nyc
      WHEN sol_matrix.mag_creditmemo_ids IS NOT NULL OR sol_matrix.x3_creditmemo_id IS NOT NULL
        THEN coalesce(
            order_refunds.order_refund_timestamp_nyc
          , sol_matrix.first_creditmemo_creation_nyc
          , sol_matrix.x3_creditmemo_creation_nyc
        )
      WHEN 
  (
    (sol_matrix.mag_order_refunded > 0 OR sol_matrix.mag_order_store_credit > 0 OR order_refunds.order_refund_id IS NOT NULL)
    AND sol_matrix.order_lines_with_creditmemo = 0
    AND (
      sol_matrix.refund_expected
      OR sol_matrix.order_lines_with_refund_expected = 0
    )
  )

        THEN coalesce(order_refunds.order_refund_timestamp_nyc
          , sol_matrix.first_rma_creation_nyc
          , sol_matrix.x3_return_creation_nyc
          , sol_matrix.mag_order_creation_nyc
        )
    END AS refund_timestamp_nyc
  , CASE
      WHEN creditmemo_refunds.creditmemo_refund_id IS NOT NULL
        THEN coalesce(creditmemo_refunds.creditmemo_refund_amount, 0)
      WHEN sol_matrix.mag_creditmemo_ids IS NOT NULL OR sol_matrix.x3_creditmemo_id IS NOT NULL
        THEN coalesce(
            order_refunds.order_refund_amount
          , sol_matrix.creditmemo_refunded
          , sol_matrix.x3_creditmemo_total_refunded
          , 0
        )
      WHEN 
  (
    (sol_matrix.mag_order_refunded > 0 OR sol_matrix.mag_order_store_credit > 0 OR order_refunds.order_refund_id IS NOT NULL)
    AND sol_matrix.order_lines_with_creditmemo = 0
    AND (
      sol_matrix.refund_expected
      OR sol_matrix.order_lines_with_refund_expected = 0
    )
  )

        THEN coalesce(order_refunds.order_refund_amount, sol_matrix.mag_order_refunded, 0)
      ELSE 0
    END AS actual_refund_total_base_amount
  , CASE
      WHEN creditmemo_refunds.creditmemo_refund_id IS NOT NULL
        THEN coalesce(creditmemo_refunds.creditmemo_refund_amount, 0)
      WHEN sol_matrix.mag_creditmemo_ids IS NOT NULL OR sol_matrix.x3_creditmemo_id IS NOT NULL
        THEN coalesce(
            order_refunds.order_refund_amount
          , sol_matrix.creditmemo_refunded
          , sol_matrix.x3_creditmemo_total_refunded
          , 0
        )
      WHEN 
  (
    (sol_matrix.mag_order_refunded > 0 OR sol_matrix.mag_order_store_credit > 0 OR order_refunds.order_refund_id IS NOT NULL)
    AND sol_matrix.order_lines_with_creditmemo = 0
    AND (
      sol_matrix.refund_expected
      OR sol_matrix.order_lines_with_refund_expected = 0
    )
  )

        THEN coalesce(order_refunds.order_refund_amount, sol_matrix.mag_order_refunded, 0)
      ELSE 0
    END AS actual_refund_total --TODO: remove after currency-conversion consolidation for DE-3611
  , CASE
      WHEN sol_matrix.mag_creditmemo_ids IS NOT NULL OR sol_matrix.x3_creditmemo_id IS NOT NULL
        THEN coalesce(sol_matrix.creditmemo_store_credit_refunded, 0)
      WHEN 
  (
    (sol_matrix.mag_order_refunded > 0 OR sol_matrix.mag_order_store_credit > 0 OR order_refunds.order_refund_id IS NOT NULL)
    AND sol_matrix.order_lines_with_creditmemo = 0
    AND (
      sol_matrix.refund_expected
      OR sol_matrix.order_lines_with_refund_expected = 0
    )
  )

        THEN coalesce(sol_matrix.mag_order_store_credit, 0)
      ELSE 0
    END AS actual_store_credit_total_base_amount
  , CASE
      WHEN sol_matrix.mag_creditmemo_ids IS NOT NULL OR sol_matrix.x3_creditmemo_id IS NOT NULL
        THEN coalesce(sol_matrix.creditmemo_store_credit_refunded, 0)
      WHEN 
  (
    (sol_matrix.mag_order_refunded > 0 OR sol_matrix.mag_order_store_credit > 0 OR order_refunds.order_refund_id IS NOT NULL)
    AND sol_matrix.order_lines_with_creditmemo = 0
    AND (
      sol_matrix.refund_expected
      OR sol_matrix.order_lines_with_refund_expected = 0
    )
  )

        THEN coalesce(sol_matrix.mag_order_store_credit, 0)
      ELSE 0
    END AS actual_store_credit_total --TODO: remove after currency-conversion consolidation for DE-3611
  , CASE
      WHEN creditmemo_refunds.creditmemo_refund_id IS NOT NULL
        THEN creditmemo_refunds.creditmemo_refund_fee
      WHEN sol_matrix.mag_creditmemo_ids IS NOT NULL OR sol_matrix.x3_creditmemo_id IS NOT NULL
        THEN CASE WHEN order_refunds.order_refund_id IS NOT NULL THEN order_refunds.order_refund_fee END
      WHEN 
  (
    (sol_matrix.mag_order_refunded > 0 OR sol_matrix.mag_order_store_credit > 0 OR order_refunds.order_refund_id IS NOT NULL)
    AND sol_matrix.order_lines_with_creditmemo = 0
    AND (
      sol_matrix.refund_expected
      OR sol_matrix.order_lines_with_refund_expected = 0
    )
  )

        THEN CASE WHEN order_refunds.order_refund_id IS NOT NULL THEN order_refunds.order_refund_fee END
    END AS refund_total_fee
  , CASE
      WHEN creditmemo_refunds.creditmemo_refund_id IS NOT NULL
        THEN creditmemo_refunds.creditmemo_refund_shipping_subsidy_base_amount
      WHEN sol_matrix.mag_creditmemo_ids IS NOT NULL OR sol_matrix.x3_creditmemo_id IS NOT NULL
        THEN order_refunds.order_refund_shipping_subsidy_base_amount
      WHEN 
  (
    (sol_matrix.mag_order_refunded > 0 OR sol_matrix.mag_order_store_credit > 0 OR order_refunds.order_refund_id IS NOT NULL)
    AND sol_matrix.order_lines_with_creditmemo = 0
    AND (
      sol_matrix.refund_expected
      OR sol_matrix.order_lines_with_refund_expected = 0
    )
  )

        THEN order_refunds.order_refund_shipping_subsidy_base_amount
    END AS refund_total_shipping_subsidy_base_amount
  , CASE
      WHEN creditmemo_refunds.creditmemo_refund_id IS NOT NULL
        THEN creditmemo_refunds.creditmemo_refund_shipping_subsidy
      WHEN sol_matrix.mag_creditmemo_ids IS NOT NULL OR sol_matrix.x3_creditmemo_id IS NOT NULL
        THEN order_refunds.order_refund_shipping_subsidy
      WHEN 
  (
    (sol_matrix.mag_order_refunded > 0 OR sol_matrix.mag_order_store_credit > 0 OR order_refunds.order_refund_id IS NOT NULL)
    AND sol_matrix.order_lines_with_creditmemo = 0
    AND (
      sol_matrix.refund_expected
      OR sol_matrix.order_lines_with_refund_expected = 0
    )
  )

        THEN order_refunds.order_refund_shipping_subsidy
    END AS refund_total_shipping_subsidy --TODO: remove after currency-conversion consolidation for DE-3611
  , sol_matrix.ship_cost
  , sol_matrix.packaging_cost
  , sol_matrix.agency_percentage
  , sol_matrix.channel_fee_percentage
  , sol_matrix.riskified_percentage
  , sol_matrix.order_total_affiliate_commission
  , sol_matrix.affiliate_offer
  , sol_matrix.affiliate_publisher
  , sol_matrix.affiliate_publisher_group
  , sol_matrix.acquisition_medium
  , sol_matrix.acquisition_source
  , sol_matrix.acquisition_campaign
  , sol_matrix.acquisition_device_category
  , sol_matrix.unique_email
  , sol_matrix.private_customer_status
  , sol_matrix.private_customer_stylist
  , sol_matrix.private_customer_type
  , sol_matrix.private_customer_source
  , sol_matrix.private_client_customer_id
  , sol_matrix.customer_id
  , sol_matrix.order_creation_nyc
  , sol_matrix.mag_order_entity_id
  , sol_matrix.geography_type
  , sol_matrix.geography
  , sol_matrix.receipt_date
  , sol_matrix.tracking_number
  , sol_matrix.coupon_code
  , sol_matrix.shipping_postcode
  , coalesce(order_payments.payment_transaction_state, 'Not Settled') AS transaction_state
  , sol_matrix.marketing_channel AS acquisition_channel
  , sol_matrix.marketing_channel AS default_channel_grouping
  , sol_matrix.ship_cost_source
  , sol_matrix.external_return_id
  , CAST(0 AS numeric) AS total_channel_discount
  , CAST(0 AS numeric) AS total_channel_duties
  , CAST(0 AS numeric) AS total_channel_shipping
  , CAST(0 AS numeric) AS total_channel_additional_gtv
  , sol_matrix.customer_name
  , sol_matrix.customer_city
  , sol_matrix.marketing_channel
  , sol_matrix.line_share_of_order_gtv
  , sol_matrix.line_share_of_payment
  , sol_matrix.line_share_of_order_shipping
  , sol_matrix.line_share_of_order_total_item_price
  , sol_matrix.line_share_of_payment_and_credit_redeemed
  , sol_matrix.line_item_price_share_of_order_payment
  , sol_matrix.line_item_tax_share_of_order_payment
  , sol_matrix.line_shipping_price_share_of_order_payment
  , sol_matrix.line_shipping_tax_share_of_order_payment
  , sol_matrix.line_duties_share_of_order_payment
  , sol_matrix.return_if_refunded
  , sol_matrix.return_refund_threshold
  , sol_matrix.return_refund_deduction
  , sol_matrix.fee_includes_ship_cost
  , sol_matrix.fee_includes_duties
  , sol_matrix.free_shipping_value AS free_shipping_value_base_amount
  , sol_matrix.free_shipping_value --TODO: remove after currency-conversion consolidation for DE-3611
  , sol_matrix.order_shipping_description
  , sol_matrix.delivery_shipping_description
  , sol_matrix.rma_statuses
  , sol_matrix.ship_cost_type
  , sol_matrix.creditmemo_transaction_ids
  , sol_matrix.first_creditmemo_creation_nyc
  , sol_matrix.last_creditmemo_update_nyc
  , sol_matrix.creditmemo_reason
  , sol_matrix.creditmemo_item_price
  , sol_matrix.creditmemo_item_qty
  , sol_matrix.creditmemo_item_discount
  , sol_matrix.creditmemo_item_tax
  , sol_matrix.creditmemo_shipping
  , sol_matrix.creditmemo_shipping_tax
  , sol_matrix.creditmemo_discount
  , sol_matrix.creditmemo_tax
  , sol_matrix.creditmemo_adjustment
  , sol_matrix.creditmemo_refunded
  , sol_matrix.creditmemo_store_credit
  , sol_matrix.creditmemo_store_credit_refunded
  , sol_matrix.ship_cost_from_fulfillment
  , sol_matrix.ship_cost_from_fulfillment_type
  , sol_matrix.ship_cost_from_fulfillment_source
  , sol_matrix.tracking_number_from_fulfillment
  , sol_matrix.p2p_ship_cost
  , sol_matrix.dhl_ship_cost
  , sol_matrix.fps_ship_cost
  , sol_matrix.cap_invoiced_ship_cost
  , sol_matrix.fedex_ship_cost
  , sol_matrix.cap_confirmed_ship_cost
  , sol_matrix.ship_cost_from_crossdock
  , sol_matrix.ship_cost_from_crossdock_type
  , sol_matrix.ship_cost_from_crossdock_source
  , sol_matrix.crossdock_reference
  , sol_matrix.zebra_ship_cost
  , sol_matrix.flow_ship_cost
  , sol_matrix.tmall_b2c_ship_cost
  , sol_matrix.dhl_customs_invoice_id
  , sol_matrix.dhl_customs_cost
  , sol_matrix.dhl_duties_invoice_id
  , sol_matrix.dhl_duties_cost
  , sol_matrix.tmall_b2c_duties_cost
  , sol_matrix.flow_duties_cost
  , sol_matrix.dropship_order_paid_out
  , sol_matrix.seller_name
  , sol_matrix.return_intake_creation_nyc
  , sol_matrix.return_intake_id
  , sol_matrix.new_serial_from_return
  , sol_matrix.new_serial_inventory_relationship
  , sol_matrix.x3_return_creation_nyc
  , sol_matrix.rma_closed_nyc
  , sol_matrix.rma_package_approved_nyc
  , sol_matrix.rma_last_reply_name
  , sol_matrix.rma_last_reply_nyc
  , sol_matrix.last_rma_update_nyc AS rma_last_update_nyc
  , sol_matrix.issued_serial_next_journal_date_after_dispatch_date
  , sol_matrix.issued_serial_next_journal_document_id_after_dispatch_date
  , sol_matrix.billing_country
  , sol_matrix.billing_city
  , coalesce(sol_matrix.delivery_id, sol_matrix.mag_shipment_ids) AS shipment_id
  , sol_matrix.ship_method AS ship_method
  , sol_matrix.ship_method_is_express AS ship_method_is_express
  , sol_matrix.order_shipping_is_express AS order_shipping_is_express
  , sol_matrix.channel_upcharge_percentage
  , sol_matrix.channel_upcharge_flat AS channel_upcharge_flat_base_amount
  , sol_matrix.channel_upcharge_flat --TODO: remove after currency-conversion consolidation for DE-3611
  , sol_matrix.order_timestamp AS order_created_at
  , sol_matrix.order_serial_previous_price
  , sol_matrix.order_serial_price_changed_at
  , sol_matrix.seller_portal_promotion_type
  , sol_matrix.seller_portal_promotion_started_at
  , sol_matrix.marketing_promo_type
  , sol_matrix.marketing_promo_description
  , sol_matrix.seller_country
  , sol_matrix.seller_city
  , sol_matrix.external_order_has_item_discount
  , sol_matrix.external_order_has_shipping_discount
  , sol_matrix.rma_item_qty_requested
  , sol_matrix.return_date
  , sol_matrix.return_source
  , order_payments.fps_order_code
  , sol_matrix.external_line_id AS fps_order_line
  , coalesce(
        order_payments.fps_order_code || '-' || sol_matrix.external_line_id
      , sol_matrix.mag_order_id || '-' || sol_matrix.order_item_id || '-' || sol_matrix.order_item_line
      , sol_matrix.ether_order_number || '-' || sol_matrix.ether_order_item_line_number
      , sol_matrix.x3_order_id || '-' || sol_matrix.x3_order_line
    ) AS order_line_id
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_finance_lines_sol_matrix` AS sol_matrix
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_finance_lines_order_payments` AS order_payments
  ON sol_matrix.mag_order_id = order_payments.mag_order_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_finance_lines_order_refunds` AS order_refunds
  ON sol_matrix.mag_order_id = order_refunds.mag_order_id
LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_finance_lines_creditmemo_refunds` AS creditmemo_refunds
  ON sol_matrix.order_item_id = creditmemo_refunds.order_item_id
  );
    