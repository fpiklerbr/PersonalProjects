

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  
  
  OPTIONS()
  as (
    /*
  TODO for DE-3487: update docs
*/



/*
	N.B. this table is UNIONed with reporting.stadium_finance_snapshots, so...
		DO NOT DROP ANY COLUMNS
		DO NOT CHANGE THE COLUMN ORDER
		IF YOU ADD ANY COLUMNS, ADD THEM ONLY TO THE END OF THIS TABLE
*/

/*
	TODO (not for April):
	-- get timestamp for store credit without creditmemos from new mag_store_credits view <-
	-- get actual riskified fees
	-- get actual taxes from avatax
	-- simplify and streamline redundant calculations
*/































SELECT
    stadium_order_id
  , order_or_payment_id
  , order_base_currency
  , order_line_id
  , fps_stock_point_id
  , business_entity
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
  , total_amount_paid
  , payment_total_fee
  , simple_sku
  , order_simple_sku_line
  , mag_order_id
  , order_item_id
  , order_item_line
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
  , inventory_cost_base_amount
  , inventory_cost
  , inventory_relationship
  , inventory_type
  , inventory_source
  , inventory_seller
  , refund_id
  , total_store_credit_refunded
  , total_payment_refunded
  , refund_total_fee
  , dispatch_date
  , dispatch_warehouse
  , dispatch_country
  , receipt_date
  , refund_date
  , reporting_date
  , reporting_status
  , payment_currency_conversion_date
  , payment_currency_conversion_rate
  , line_item_discount_base_amount
  , line_item_discount
  , line_item_store_credit_applied_base_amount
  , line_item_store_credit_applied
  , line_item_price_paid_base_amount
  , line_item_price_paid
  , line_item_tax_paid_base_amount
  , line_item_tax_paid
  , line_shipping_discount_base_amount
  , line_shipping_discount
  , line_shipping_store_credit_applied_base_amount
  , line_shipping_store_credit_applied
  , line_shipping_price_paid_base_amount
  , line_shipping_price_paid
  , line_shipping_tax_paid_base_amount
  , line_shipping_tax_paid
  , refund_currency_conversion_date
  , refund_currency_conversion_rate
  , line_item_price_refunded_base_amount
  , line_item_price_refunded
  , line_item_tax_refunded_base_amount
  , line_item_tax_refunded
  , line_shipping_price_refunded_base_amount
  , line_shipping_price_refunded
  , line_shipping_tax_refunded_base_amount
  , line_shipping_tax_refunded
  , line_item_price_credited_base_amount
  , line_item_price_credited
  , line_item_tax_credited_base_amount
  , line_item_tax_credited
  , line_shipping_price_credited_base_amount
  , line_shipping_price_credited
  , line_shipping_tax_credited_base_amount
  , line_shipping_tax_credited
  , line_payment_fee
  , line_refund_fee
  , line_riskified_fee
  , line_ship_cost
  , line_packaging_cost
  , line_affiliate_commission

  , CASE WHEN reporting_status = 'Deferred' THEN reporting_status ELSE 'Non-Deferred' END AS deferred_status

/* GTV */
  , line_payment_amount AS gtv_paid
  , line_credit_redeemed AS gtv_credit_redeemed
  , line_item_discount AS gtv_item_discounts
  , line_shipping_discount AS gtv_shipping_discounts
  , line_gtv AS gtv_total

  , (
      line_gtv
      + CASE WHEN reporting_status IN ('Cancelled', 'Returned') THEN 0 ELSE -1 * (line_payment_refunded + line_payment_credited + line_discount) END
    ) AS gtv_less_promos

/* Cancellations */
  , CASE WHEN reporting_status = 'Cancelled' THEN 1 ELSE 0 END AS cancelled_qty
  , -1 * CASE reporting_status WHEN 'Cancelled' THEN line_payment_refunded END AS cancelled_refunds
  , -1 * CASE reporting_status WHEN 'Cancelled' THEN line_payment_credited END AS cancelled_credits
  , -1 * CASE reporting_status WHEN 'Cancelled' THEN line_item_discount END AS cancelled_item_discounts
  , -1 * CASE reporting_status WHEN 'Cancelled' THEN line_shipping_discount END AS cancelled_shipping_discounts
  , CASE reporting_status WHEN 'Cancelled' THEN (-1 * (line_payment_refunded + line_payment_credited + line_discount)) END AS cancelled_total

  , line_gtv + CASE reporting_status WHEN 'Cancelled' THEN (-1 * (line_payment_refunded + line_payment_credited + line_discount)) ELSE 0 END AS gtv_less_cancelled

  , -1 * CASE reporting_status WHEN 'Cancelled' THEN NULL WHEN 'Returned' THEN 0 ELSE line_tax_paid END AS sales_tax

/* Returns */
  , CASE WHEN reporting_status = 'Returned' THEN 1 ELSE 0 END AS returned_qty
  , -1 * CASE reporting_status WHEN 'Cancelled' THEN NULL WHEN 'Returned' THEN line_payment_refunded ELSE 0 END AS returned_refunds
  , -1 * CASE reporting_status WHEN 'Cancelled' THEN NULL WHEN 'Returned' THEN line_payment_credited ELSE 0 END AS returned_credits
  , -1 * CASE reporting_status WHEN 'Cancelled' THEN NULL WHEN 'Returned' THEN line_item_discount ELSE 0 END AS returned_item_discounts
  , -1 * CASE reporting_status WHEN 'Cancelled' THEN NULL WHEN 'Returned' THEN line_shipping_discount ELSE 0 END AS returned_shipping_discounts
  , CASE reporting_status WHEN 'Cancelled' THEN NULL WHEN 'Returned' THEN (-1 * (line_payment_refunded + line_payment_credited + line_discount)) ELSE 0 END AS returned_total
  , return_refund_expected_base_amount
  , return_refund_expected
  , 
CASE
  WHEN reporting_status = 'Returned' AND (line_payment_refunded + line_payment_credited) = 0
  THEN -1 * return_refund_expected
  ELSE 0
END
 AS returned_refunds_pending

  , CASE WHEN reporting_status IN ('Cancelled', 'Returned') THEN 0 ELSE 1 END AS gmv_qty
  , 
CASE
  WHEN reporting_status IN ('Cancelled', 'Returned')
  THEN line_gtv + (-1 * (line_payment_refunded + line_payment_credited + line_discount))
  ELSE line_gtv + coalesce(-1 * CASE reporting_status WHEN 'Cancelled' THEN NULL WHEN 'Returned' THEN 0 ELSE line_tax_paid END, 0)
END
 AS gmv_total
  , 
CASE
  WHEN reporting_status IN ('Cancelled', 'Returned')
  THEN line_gtv + (-1 * (line_payment_refunded + line_payment_credited + line_discount))
  ELSE line_gtv + coalesce(-1 * CASE reporting_status WHEN 'Cancelled' THEN NULL WHEN 'Returned' THEN 0 ELSE line_tax_paid END, 0)
END
 + 
CASE
  WHEN reporting_status = 'Returned' AND (line_payment_refunded + line_payment_credited) = 0
  THEN -1 * return_refund_expected
  ELSE 0
END
 AS gmv_less_returned_refunds_pending

  , 
(
  
CASE
  WHEN reporting_status IN ('Cancelled', 'Returned')
  THEN line_gtv + (-1 * (line_payment_refunded + line_payment_credited + line_discount))
  ELSE line_gtv + coalesce(-1 * CASE reporting_status WHEN 'Cancelled' THEN NULL WHEN 'Returned' THEN 0 ELSE line_tax_paid END, 0)
END

  - CASE
      WHEN reporting_status IN ('Cancelled', 'Returned')
      THEN 0
      ELSE line_shipping_price_paid + line_shipping_store_credit_applied + line_shipping_discount + line_duties_paid
    END
)
 AS net_sales
  , 
(
  
CASE
  WHEN reporting_status IN ('Cancelled', 'Returned')
  THEN line_gtv + (-1 * (line_payment_refunded + line_payment_credited + line_discount))
  ELSE line_gtv + coalesce(-1 * CASE reporting_status WHEN 'Cancelled' THEN NULL WHEN 'Returned' THEN 0 ELSE line_tax_paid END, 0)
END

  - CASE
      WHEN reporting_status IN ('Cancelled', 'Returned')
      THEN 0
      ELSE line_shipping_price_paid + line_shipping_store_credit_applied + line_shipping_discount + line_duties_paid
    END
)
 + 
CASE
  WHEN reporting_status = 'Returned' AND (line_payment_refunded + line_payment_credited) = 0
  THEN -1 * return_refund_expected
  ELSE 0
END
 AS net_sales_less_returned_refunds_pending

/* Consignor Payouts */
  , (-1 * CASE WHEN inventory_relationship = '1P' THEN NULL ELSE inventory_cost_base_amount END) AS consignor_payouts_payable_base_amount
  , (CASE WHEN inventory_relationship = '1P' THEN NULL ELSE CASE WHEN x3_return_id IS NOT NULL THEN inventory_cost_base_amount ELSE 0 END END) AS consignor_payouts_returned_base_amount
  , (CASE WHEN inventory_relationship = '1P' THEN NULL ELSE CASE WHEN x3_return_id IS NULL AND reporting_status = 'Returned' AND serial_order_match AND inventory_type <> 'Dropship' THEN inventory_cost_base_amount ELSE 0 END END) AS consignor_payouts_credit_to_1p_inventory_base_amount
  , 
(
    (-1 * CASE WHEN inventory_relationship = '1P' THEN NULL ELSE inventory_cost_base_amount END)
  + (CASE WHEN inventory_relationship = '1P' THEN NULL ELSE CASE WHEN x3_return_id IS NOT NULL THEN inventory_cost_base_amount ELSE 0 END END)
  + (CASE WHEN inventory_relationship = '1P' THEN NULL ELSE CASE WHEN x3_return_id IS NULL AND reporting_status = 'Returned' AND serial_order_match AND inventory_type <> 'Dropship' THEN inventory_cost_base_amount ELSE 0 END END)
)
 AS consignor_payouts_total_base_amount

  , (-1 * CASE WHEN inventory_relationship = '1P' THEN NULL ELSE inventory_cost END) AS consignor_payouts_payable
  , (CASE WHEN inventory_relationship = '1P' THEN NULL ELSE CASE WHEN x3_return_id IS NOT NULL THEN inventory_cost ELSE 0 END END) AS consignor_payouts_returned
  , (CASE WHEN inventory_relationship = '1P' THEN NULL ELSE CASE WHEN x3_return_id IS NULL AND reporting_status = 'Returned' AND serial_order_match AND inventory_type <> 'Dropship' THEN inventory_cost ELSE 0 END END) AS consignor_payouts_credit_to_1p_inventory
  , 
(
    (-1 * CASE WHEN inventory_relationship = '1P' THEN NULL ELSE inventory_cost END)
  + (CASE WHEN inventory_relationship = '1P' THEN NULL ELSE CASE WHEN x3_return_id IS NOT NULL THEN inventory_cost ELSE 0 END END)
  + (CASE WHEN inventory_relationship = '1P' THEN NULL ELSE CASE WHEN x3_return_id IS NULL AND reporting_status = 'Returned' AND serial_order_match AND inventory_type <> 'Dropship' THEN inventory_cost ELSE 0 END END)
)
 AS consignor_payouts_total

/* Revenues */
  , CASE
      WHEN inventory_relationship = '1P'
      THEN NULL
      ELSE
        CASE
          WHEN reporting_status IN ('Cancelled', 'Returned')
          THEN line_gtv + (-1 * (line_payment_refunded + line_payment_credited + line_discount))
          ELSE line_item_price_paid + line_item_store_credit_applied + line_item_discount
        END
        + coalesce(
(
    (-1 * CASE WHEN inventory_relationship = '1P' THEN NULL ELSE inventory_cost END)
  + (CASE WHEN inventory_relationship = '1P' THEN NULL ELSE CASE WHEN x3_return_id IS NOT NULL THEN inventory_cost ELSE 0 END END)
  + (CASE WHEN inventory_relationship = '1P' THEN NULL ELSE CASE WHEN x3_return_id IS NULL AND reporting_status = 'Returned' AND serial_order_match AND inventory_type <> 'Dropship' THEN inventory_cost ELSE 0 END END)
)
, 0)
    END AS revenue_commissions -- TODO: confirm calculation (why are there no refunds?)
  , CASE
      WHEN inventory_relationship = '1P'
      THEN
        CASE
          WHEN reporting_status IN ('Cancelled', 'Returned')
          THEN line_gtv + (-1 * (line_payment_refunded + line_payment_credited + line_discount))
          ELSE
            (line_item_price_paid + line_item_store_credit_applied + line_item_discount)
            + (-1 * (line_payment_refunded + line_payment_credited + line_item_discount))
        END
    END AS revenue_1p -- TODO: confirm calculation (why does this include shipping refunds/credits?)
  , CASE
      WHEN reporting_status IN ('Cancelled', 'Returned')
      THEN 0
      ELSE (line_shipping_price_paid + line_shipping_store_credit_applied + line_shipping_discount)
    END AS revenue_shipping
  , (
      line_gtv
      + coalesce(-1 * CASE reporting_status WHEN 'Cancelled' THEN NULL WHEN 'Returned' THEN 0 ELSE line_tax_paid END, 0)
      + coalesce(
(
    (-1 * CASE WHEN inventory_relationship = '1P' THEN NULL ELSE inventory_cost END)
  + (CASE WHEN inventory_relationship = '1P' THEN NULL ELSE CASE WHEN x3_return_id IS NOT NULL THEN inventory_cost ELSE 0 END END)
  + (CASE WHEN inventory_relationship = '1P' THEN NULL ELSE CASE WHEN x3_return_id IS NULL AND reporting_status = 'Returned' AND serial_order_match AND inventory_type <> 'Dropship' THEN inventory_cost ELSE 0 END END)
)
, 0)
      + (-1 * (line_payment_refunded + line_payment_credited + line_discount))
    ) AS revenue_total

/* Promos */
  , -1 * CASE reporting_status WHEN 'Cancelled' THEN NULL WHEN 'Returned' THEN 0 ELSE line_shipping_discount END AS promos_shipping_discounts
  , -1 * CASE reporting_status WHEN 'Cancelled' THEN NULL WHEN 'Returned' THEN 0 ELSE line_payment_credited END AS promos_post_checkout_credits
  , -1 * CASE reporting_status WHEN 'Cancelled' THEN NULL WHEN 'Returned' THEN 0 ELSE line_payment_refunded END AS promos_post_checkout_refunds
  , -1 * CASE reporting_status WHEN 'Cancelled' THEN NULL WHEN 'Returned' THEN 0 ELSE line_item_discount END AS promos_item_discounts
  , -1 * CASE reporting_status WHEN 'Cancelled' THEN NULL WHEN 'Returned' THEN 0 ELSE (line_payment_credited + line_payment_refunded + line_item_discount) END AS promos_less_shipping_discounts
  , CASE reporting_status WHEN 'Cancelled' THEN NULL WHEN 'Returned' THEN 0 ELSE (-1 * (line_payment_refunded + line_payment_credited + line_discount)) END AS promos_total

/* COGS */
  , CASE
      WHEN inventory_relationship = '1P'
      THEN CASE WHEN inventory_type = 'Returns Purchase' THEN -1 * CASE WHEN inventory_relationship = '1P' THEN inventory_cost END ELSE 0 END
    END AS cogs_returns_purchase
  , CASE
      WHEN inventory_relationship = '1P'
      THEN CASE WHEN inventory_type = 'Returns Purchase' THEN 0 ELSE -1 * CASE WHEN inventory_relationship = '1P' THEN inventory_cost END END
    END AS cogs_wholesale
  , -1 * CASE WHEN inventory_relationship = '1P' THEN inventory_cost END AS cogs_total

/* Credit Card Fees */
  , CASE WHEN business_unit = 'Omnichannel' THEN 
  (line_payment_fee + line_refund_fee)
  + CASE WHEN fee_includes_duties THEN (line_duties_paid - line_duties_refunded) ELSE 0 END
  + CASE WHEN fee_includes_ship_cost THEN line_ship_cost ELSE 0 END
 END AS transaction_fees_channel
  , CASE WHEN business_unit = 'Omnichannel' THEN NULL ELSE 
  (line_payment_fee + line_refund_fee)
  + CASE WHEN fee_includes_duties THEN (line_duties_paid - line_duties_refunded) ELSE 0 END
  + CASE WHEN fee_includes_ship_cost THEN line_ship_cost ELSE 0 END
 END AS transaction_fees_gateway
  , (line_riskified_fee) AS transaction_fees_fraud_prevention
  , (
  (line_payment_fee + line_refund_fee)
  + CASE WHEN fee_includes_duties THEN (line_duties_paid - line_duties_refunded) ELSE 0 END
  + CASE WHEN fee_includes_ship_cost THEN line_ship_cost ELSE 0 END
 + line_riskified_fee) AS transaction_fees_total

/* Shipping/Packaging Costs */
  , -1 * line_packaging_cost AS delivery_costs_packaging
  , -1 * line_ship_cost AS delivery_costs_shipping

  , (
      coalesce(-1 * CASE WHEN inventory_relationship = '1P' THEN inventory_cost END, 0)
      + 
  (line_payment_fee + line_refund_fee)
  + CASE WHEN fee_includes_duties THEN (line_duties_paid - line_duties_refunded) ELSE 0 END
  + CASE WHEN fee_includes_ship_cost THEN line_ship_cost ELSE 0 END

      + line_riskified_fee
      + -1 * line_packaging_cost
      + -1 * line_ship_cost
      + coalesce(-1 * CASE reporting_status WHEN 'Cancelled' THEN NULL WHEN 'Returned' THEN 0 ELSE line_duties_paid END, 0)
    ) AS cost_of_revenue

  , (
-- revenue
      line_gtv
      + coalesce(-1 * CASE reporting_status WHEN 'Cancelled' THEN NULL WHEN 'Returned' THEN 0 ELSE line_tax_paid END, 0)
      + coalesce(
(
    (-1 * CASE WHEN inventory_relationship = '1P' THEN NULL ELSE inventory_cost END)
  + (CASE WHEN inventory_relationship = '1P' THEN NULL ELSE CASE WHEN x3_return_id IS NOT NULL THEN inventory_cost ELSE 0 END END)
  + (CASE WHEN inventory_relationship = '1P' THEN NULL ELSE CASE WHEN x3_return_id IS NULL AND reporting_status = 'Returned' AND serial_order_match AND inventory_type <> 'Dropship' THEN inventory_cost ELSE 0 END END)
)
, 0)
      + (-1 * (line_payment_refunded + line_payment_credited + line_discount))
-- cost of revenue
      + coalesce(-1 * CASE WHEN inventory_relationship = '1P' THEN inventory_cost END, 0)
      + 
  (line_payment_fee + line_refund_fee)
  + CASE WHEN fee_includes_duties THEN (line_duties_paid - line_duties_refunded) ELSE 0 END
  + CASE WHEN fee_includes_ship_cost THEN line_ship_cost ELSE 0 END

      + line_riskified_fee
      + -1 * line_packaging_cost
      + -1 * line_ship_cost
      + coalesce(-1 * CASE reporting_status WHEN 'Cancelled' THEN NULL WHEN 'Returned' THEN 0 ELSE line_duties_paid END, 0)
    ) gross_profit

  , -1 * line_payment_refunded AS gross_refunds
  , (line_payment_amount - line_payment_refunded) AS net_paid
  , 
  (line_payment_fee + line_refund_fee)
  + CASE WHEN fee_includes_duties THEN (line_duties_paid - line_duties_refunded) ELSE 0 END
  + CASE WHEN fee_includes_ship_cost THEN line_ship_cost ELSE 0 END
 AS net_payment_and_refund_fees -- TODO: confirm duties/ship-cost dedupe here

  , current_timestamp AS rebuild_timestamp
  , safe_cast(datetime(safe_cast(current_timestamp AS timestamp), 'America/New_York') AS date) AS rebuild_date

  , CASE
      WHEN inventory_relationship = '1P'
      THEN
        CASE
          WHEN reporting_status IN ('Cancelled', 'Returned')
          THEN line_gtv + (-1 * (line_payment_refunded + line_payment_credited + line_discount))
          ELSE line_item_price_paid + line_item_store_credit_applied + line_item_discount
        END
    END AS revenue_1p_promos_less_shipping_discounts

  , CASE
      WHEN inventory_relationship = '1P'
      THEN
        CASE reporting_status
          WHEN 'Cancelled'
            THEN NULL
          WHEN 'Returned'
            THEN 0
          ELSE -1 * (line_payment_refunded + line_payment_credited + line_item_discount)
        END
    END AS promos_1p_less_shipping_discounts

  , tracking_number
  , coupon_code
  , shipping_postcode
  , transaction_state
  , acquisition_channel
  , default_channel_grouping
  , media_channel
  , ship_cost_source
  , line_channel_discount
  , line_channel_shipping
  , line_channel_duties
  , line_channel_additional_gtv
  , -1 * CASE WHEN line_item_price_refunded > 0 THEN 0 ELSE line_channel_shipping END AS delivery_costs_channel_ship_charge
  , -1 * CASE reporting_status WHEN 'Cancelled' THEN NULL WHEN 'Returned' THEN 0 ELSE line_duties_paid END AS duties
  , -1 * CASE WHEN line_item_price_refunded > 0 THEN 0 ELSE line_channel_additional_gtv END AS other_channel_gtv
  , customer_name
  , customer_city
  , marketing_channel
  , line_share_of_payment
  , line_payment_amount
  , line_credit_redeemed
  , line_discount
  , line_gtv
  , line_tax_paid
  , line_share_of_refund
  , line_payment_refunded
  , line_share_of_credit
  , line_payment_credited
  , line_duties_paid
  , line_duties_refunded
  , line_duties_credited
  , return_if_refunded
  , return_refund_threshold
  , return_refund_deduction
  , fee_includes_ship_cost
  , fee_includes_duties
  , order_shipping_description
  , delivery_shipping_description
  , free_shipping
  , rma_statuses
  , ship_cost_type
  , creditmemo_transaction_ids
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
--  todo: calculate next 3 fields earlier
  , round(CAST((line_item_price_paid + line_item_store_credit_applied + line_item_discount) AS decimal), 2) AS item_value_before_discount
  , round(CAST(line_item_discount AS decimal), 2) AS item_discount
  , round(CAST((line_item_price_paid + line_item_store_credit_applied) AS decimal), 2) AS item_price_after_discount
  , CASE
      WHEN round(CAST(line_item_discount AS decimal), 2) = round(CAST((line_item_price_paid + line_item_store_credit_applied + line_item_discount) AS decimal), 2)
        THEN  'Zero Out' -- calculate
      WHEN round(CAST(line_item_discount AS decimal), 2) > 0
        THEN 'Partial Discount'
      ELSE
        'Full Price'
    END AS item_discount_type
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
  , return_date
  , billing_country
  , billing_city
  , CASE WHEN geography_type = 'Domestic' THEN 'United States' ELSE geography END AS shipping_country
  , shipment_id
  , ship_method
  , ship_method_is_express
  , order_shipping_is_express
  , CASE
      WHEN business_unit = 'SOURCE'
        THEN business_unit
      WHEN private_customer_status = 'Private Client'
        THEN 'PC'
      WHEN business_unit = 'Omnichannel'
        THEN CASE WHEN sales_channel IN ('Farfetch', 'Tmall') THEN sales_channel ELSE 'Omnichannel (ex FF, Tmall)' END
      WHEN business_unit = 'Store'
        THEN CASE WHEN sales_channel = 'Chicago Store' THEN 'Store - Chi' WHEN sales_channel = 'SG Store' THEN 'Store - SoHo' ELSE sales_channel END
      ELSE 'DTC (ex PC)'
    END AS financial_reporting_unit
  , CASE
      WHEN reporting_status <> 'Returned' THEN NULL
      WHEN issued_serial_next_journal_document_id_after_dispatch_date IS NOT NULL THEN 'Restocked as original serial'
      WHEN new_serial_inventory_relationship = '3P' THEN 'Reserialized as 3P'
      WHEN new_serial_from_return IS NOT NULL THEN 'Reserialized as 1P'
      WHEN serial_order_match IS NOT TRUE THEN 'Assumed restocked'
      ELSE 'Assumed reserialized'
    END AS return_outcome
  , line_item_price_before_upcharge_base_amount
  , line_item_price_before_upcharge
  , line_item_upcharge_base_amount
  , line_item_upcharge
  , CASE
      WHEN business_unit = 'SOURCE' AND 
(order_serial_price < order_serial_previous_price) AND 

    datetime_diff(
        cast(order_created_at as datetime),
        cast(order_serial_price_changed_at as datetime),
        hour
    )

 < 72

        THEN 'SOURCE Price Drop'
      WHEN coupon_code IS NOT NULL
        THEN 'Promo Code'
      WHEN external_order_has_item_discount OR external_order_has_shipping_discount
        THEN 'Channel Discount'
      WHEN marketing_promo_type IS NOT NULL
        THEN marketing_promo_type
      WHEN seller_portal_promotion_started_at IS NOT NULL
        THEN 'Seller Portal Promo'
      WHEN 
(order_serial_price < order_serial_previous_price) AND 

    datetime_diff(
        cast(order_created_at as datetime),
        cast(order_serial_price_changed_at as datetime),
        hour
    )

 < 72

        THEN 'Price Drop'
    END AS promo_type
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
  , return_source
  , payment_total_shipping_subsidy_base_amount
  , payment_total_shipping_subsidy
  , line_payment_shipping_subsidy_base_amount
  , line_payment_shipping_subsidy
  , refund_total_shipping_subsidy_base_amount
  , refund_total_shipping_subsidy
  , line_refund_shipping_subsidy_base_amount
  , line_refund_shipping_subsidy
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_stadium_finance_lines_adjustments` adjusted_lines
  );
    