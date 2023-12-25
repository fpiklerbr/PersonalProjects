

  create or replace table `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`tableau_january_finance`
  
  
  OPTIONS()
  as (
    SELECT
     CAST(mag_order_id AS string) AS mag_order_id
    , CAST(x3_order_id AS string) AS x3_order_id
    , CAST(channel_or_gateway AS string) AS channel_or_gateway
    , CAST(data_source AS string) AS data_source
    , CAST(order_date AS date) AS order_date
    , CAST(CAST(order_item_id AS float64) AS int64) AS order_item_id
    , CAST(order_item_line AS numeric) AS order_item_line
    , CAST(CAST(x3_order_line AS float64) AS int64) AS x3_order_line
    , CAST(owned_vs_marketplace AS string) AS owned_vs_marketplace
    , CAST(order_serial_price AS numeric) AS order_serial_price
    , CAST(CAST(shipping_value_not_charged AS float64) AS int64) AS shipping_value_not_charged
    , CAST(dispatch_date AS date) AS dispatch_date
    , CAST(CAST(qty_refunded AS float64) AS int64) AS qty_refunded
    , CAST(CAST(returns AS float64) AS int64) AS returns
    , CAST(mag_rma_ids AS string) AS mag_rma_ids
    , CAST(first_rma_creation_nyc AS datetime) AS first_rma_creation_nyc
    , CAST(mag_creditmemo_ids AS string) AS mag_creditmemo_ids
    , CAST(first_creditmemo_creation_nyc AS datetime) AS first_creditmemo_creation_nyc
    , CAST(x3_return_id AS string) AS x3_return_id
    , CAST(x3_return_creation_nyc AS datetime) AS x3_return_creation_nyc
    , CAST(riskified_percentage AS numeric) AS riskified_percentage
    , CAST(linkshare_commission AS float64) AS linkshare_commission
    , cast(cash_payment AS boolean) AS cash_payment
    , CAST(channel_fee_percentage AS numeric) AS channel_fee_percentage
    , CAST(channel_fee_flat AS numeric) AS channel_fee_flat
    , CAST(agency_percentage AS numeric) AS agency_percentage
    , cast(serial_order_match AS boolean) AS serial_order_match
    , CAST(consignor_type AS string) AS consignor_type
    , CAST(payout_amount AS float64) AS payout_amount
    , CAST(purchase_price AS numeric) AS purchase_price
    , CAST(issue_date AS date) AS issue_date
    , CAST(paid_out_status AS string) AS paid_out_status
    , CAST(ship_cost AS float64) AS ship_cost
    , CAST(tracking_number AS string) AS tracking_number
    , CAST(packaging_cost AS float64) AS packaging_cost
    , order_transaction_ids
    , CAST(mag_order_payment AS numeric) AS mag_order_payment
    , CAST(mag_order_store_credit_applied AS numeric) AS mag_order_store_credit_applied
    , CAST(mag_order_refunded AS numeric) AS mag_order_refunded
    , CAST(mag_order_store_credit AS numeric) AS mag_order_store_credit
    , CAST(x3_order_total AS numeric) AS x3_order_total
    , creditmemo_transaction_ids
    , CAST(creditmemo_refunded AS numeric) AS creditmemo_refunded
    , CAST(creditmemo_store_credit AS numeric) AS creditmemo_store_credit
    , CAST(payment_id AS string) AS payment_id
    , CAST(payment_channel_or_gateway AS string) AS payment_channel_or_gateway
    , CAST(payment_data_source AS string) AS payment_data_source
    , CAST(payment_timestamp AS timestamp) AS payment_timestamp
    , CAST(payment_amount AS float64) AS payment_amount
    , CAST(payment_fee AS float64) AS payment_fee
    , CAST(refund_id AS string) AS refund_id
    , CAST(refund_timestamp AS timestamp) AS refund_timestamp
    , CAST(refund_amount AS float64) AS refund_amount
    , CAST(refund_fee AS float64) AS refund_fee
	, CASE
		WHEN tmall_order_shipping IS NOT NULL
		THEN nullif(
     greatest(
      coalesce(CAST(order_serial_price AS float64) - CAST(line_item_price_paid AS float64) -nullif(
     greatest(
      coalesce(coalesce(CAST(line_shipping_price_paid AS float64), 0) + coalesce(CAST(line_shipping_tax_paid AS float64), 0)- tmall_order_shipping, CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      ,coalesce(0, CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      
      )
     , CAST('-9.9999999999999999999999999999999999999E+28' AS float64)
  ), CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      ,coalesce(0, CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      
      )
     , CAST('-9.9999999999999999999999999999999999999E+28' AS float64)
  )
		ELSE CAST(line_item_discount AS float64)
	END line_item_discount
	, CAST(line_item_store_credit_applied AS float64) AS line_item_store_credit_applied
	, CASE
		WHEN tmall_order_shipping IS NOT NULL
		THEN CAST(line_item_price_paid AS float64) + nullif(
     greatest(
      coalesce(coalesce(CAST(line_shipping_price_paid AS float64), 0) + coalesce(CAST(line_shipping_tax_paid AS float64), 0)- tmall_order_shipping, CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      ,coalesce(0, CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      
      )
     , CAST('-9.9999999999999999999999999999999999999E+28' AS float64)
  )
		ELSE CAST(line_item_price_paid AS float64)
	END line_item_price_paid
	, CAST(line_item_tax_paid AS float64) AS line_item_tax_paid
	, CASE
		WHEN tmall_order_shipping IS NOT NULL
		THEN nullif(
     least(
      coalesce(CAST(line_shipping_discount AS float64), CAST('9.9999999999999999999999999999999999999E+28' AS float64))
      ,coalesce(tmall_order_shipping, CAST('9.9999999999999999999999999999999999999E+28' AS float64))
      
      )
     , CAST('9.9999999999999999999999999999999999999E+28' AS float64)
  )
		ELSE CAST(line_shipping_discount AS float64)
	END line_shipping_discount
	, CAST(line_shipping_store_credit_applied AS float64) AS line_shipping_store_credit_applied
	, CASE
		WHEN tmall_order_shipping IS NOT NULL
		THEN nullif(
     least(
      coalesce(coalesce(CAST(line_shipping_price_paid AS float64), 0) + coalesce(CAST(line_shipping_tax_paid AS float64), 0), CAST('9.9999999999999999999999999999999999999E+28' AS float64))
      ,coalesce(tmall_order_shipping, CAST('9.9999999999999999999999999999999999999E+28' AS float64))
      
      )
     , CAST('9.9999999999999999999999999999999999999E+28' AS float64)
  )
		ELSE CAST(line_shipping_price_paid AS float64)
	END line_shipping_price_paid
	, CASE
		WHEN tmall_order_shipping IS NOT NULL
		THEN 0
		ELSE CAST(line_shipping_tax_paid AS float64)
	END line_shipping_tax_paid
	, CAST(line_payment_fee AS float64) AS line_payment_fee
	, CASE
		WHEN tmall_order_shipping IS NOT NULL
		THEN CAST(line_item_price_refunded AS float64) + nullif(
     greatest(
      coalesce(coalesce(CAST(line_shipping_price_refunded AS float64), 0) + coalesce(CAST(line_shipping_tax_refunded AS float64), 0) -tmall_order_shipping, CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      ,coalesce(0, CAST('-9.9999999999999999999999999999999999999E+28' AS float64))
      
      )
     , CAST('-9.9999999999999999999999999999999999999E+28' AS float64)
  )
		ELSE CAST(line_item_price_refunded AS float64)
	END line_item_price_refunded
	, CAST(line_item_tax_refunded AS float64) AS line_item_tax_refunded
	, CASE
		WHEN tmall_order_shipping IS NOT NULL
        THEN nullif(
     least(
      coalesce(coalesce(CAST(line_shipping_price_refunded AS float64), 0) + coalesce(CAST(line_shipping_tax_refunded AS float64), 0), CAST('9.9999999999999999999999999999999999999E+28' AS float64))
      ,coalesce(tmall_order_shipping, CAST('9.9999999999999999999999999999999999999E+28' AS float64))
      
      )
     , CAST('9.9999999999999999999999999999999999999E+28' AS float64)
  )
		ELSE CAST(line_shipping_price_refunded AS float64)
	END line_shipping_price_refunded
	, CASE
		WHEN tmall_order_shipping IS NOT NULL
		THEN 0
		ELSE CAST(line_shipping_tax_refunded AS float64)
	END line_shipping_tax_refunded
	, cast(line_refund_fee  AS float64) line_refund_fee
	, cast(line_item_price_credited  AS float64) line_item_price_credited
	, cast(line_item_tax_credited  AS float64) line_item_tax_credited
	, cast(line_shipping_price_credited  AS float64) line_shipping_price_credited
	, cast(line_shipping_tax_credited  AS float64) line_shipping_tax_credited
	, cast(tmall_order_shipping  AS float64) AS tmall_order_shipping
FROM `ff-stadiumgoods-raw-live`.`finance_snapshots`.`adhoc_2019_january`
LEFT JOIN (
  SELECT transaction_date,  60 * in_usd tmall_order_shipping
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_forex_daily_exchange_rates`
  WHERE currency = 'CNY'
) AS tmall_shipping
ON tmall_shipping.transaction_date = coalesce(CAST(safe_cast(datetime(safe_cast(payment_timestamp AS timestamp), 'America/New_York') AS datetime) as date), CAST(order_date AS date)) AND channel_or_gateway = 'Tmall'
  );
    