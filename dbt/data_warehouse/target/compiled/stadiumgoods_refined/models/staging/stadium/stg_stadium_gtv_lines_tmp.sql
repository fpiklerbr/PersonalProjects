WITH gtv_union AS (
  SELECT
    stadium_order_id
  , product_sku
  , variant_size
  , serial_source
  , order_sku_size_source_line
  , payment_id
  , order_or_payment_id
  , channel_or_gateway
  , sales_channel
  , business_unit
  , data_source
  , order_date
  , gtv_paid
  , gtv_credit_redeemed
  , gtv_item_discounts
  , gtv_shipping_discounts
  , gtv_total
  , geography_type
  , coalesce(EXTRACT(TIME from order_creation_nyc), cast('00:00:00' AS time) ) AS order_time
  , private_customer_status
  , private_customer_type
  , private_customer_source
  , private_customer_stylist
  , inventory_type
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines`
  UNION ALL
  SELECT
    mag_order_id AS stadium_order_id
  , CAST(NULL AS string) AS product_sku
  , CAST(NULL AS string) AS variant_size
  , CAST(NULL AS string) AS serial_source
  , CAST(NULL AS int64) AS order_sku_size_source_line
  , transactions.transaction_id
  , coalesce(mag_order_id, transaction_id) AS order_or_payment_id
  , channel_or_gateway
  , sales_channel
  , business_unit
  , data_source
  , CAST(safe_cast(datetime(safe_cast(payment_timestamp AS timestamp), 'America/New_York') AS datetime) AS date) AS order_date
  , payment_amount + coalesce(channel_shipping, 0) + coalesce(channel_duties, 0) + coalesce(channel_additional_gtv, 0) AS gtv_paid
  , CAST(0 AS float64) AS gtv_credit_redeemed
  , coalesce(channel_discount, 0) AS gtv_item_discounts
  , CAST(0 AS float64) AS gtv_shipping_discounts
  , payment_amount + coalesce(channel_shipping, 0) + coalesce(channel_duties, 0) + coalesce(channel_additional_gtv, 0) + coalesce(channel_discount, 0) AS gtv_total
  , geography_type
  , EXTRACT(TIME from safe_cast(datetime(safe_cast(payment_timestamp AS timestamp), 'America/New_York') AS datetime)) AS order_time
  , cast(NULL as string ) AS private_customer_status
  , cast(NULL as string ) AS private_customer_type
  , cast(NULL as string ) AS private_customer_source
  , cast(NULL as string ) AS private_customer_stylist
  , cast(NULL as string ) AS inventory_type
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_transactions` AS transactions
  WHERE checkout_status IN ('Paid', 'Approved')
  AND payment_amount IS NOT NULL
  AND is_excluded_from_financial_reporting IS NOT TRUE
  AND NOT EXISTS (
      SELECT *
      FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines` AS fol
      WHERE fol.mag_order_id = transactions.mag_order_id
  )
  AND NOT EXISTS (
      SELECT *
      FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_reporting`.`stadium_finance_lines` AS fol
      WHERE fol.payment_id =transactions.transaction_id
	  AND fol.channel_or_gateway = transactions.channel_or_gateway
  )

), final AS (

  SELECT
    *
  , datetime(order_date, order_time) AS order_timestamp_nyc
  FROM gtv_union

)

SELECT * FROM final