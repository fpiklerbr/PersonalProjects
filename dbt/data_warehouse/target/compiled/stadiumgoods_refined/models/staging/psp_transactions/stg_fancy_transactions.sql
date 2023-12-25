

WITH smv_fancy_order AS (

  SELECT
      fancy_order_id
    , sales_flat_order_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__smv_fancy_order`

), sales_flat_order AS (

  SELECT
      sales_flat_order_id
    , mag_order_id
    , customer_email
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`magento__sales_flat_order` AS sfo
  WHERE EXISTS (
    SELECT * FROM smv_fancy_order WHERE sales_flat_order_id = sfo.sales_flat_order_id
  )
    OR 


  regexp_contains(customer_email, r'(?i).*@fancy.com')



), dashboard AS (

  SELECT
      fancy_order_id
    , CAST('Fancy Dashboard' AS string) AS data_source
    , CASE WHEN min(settlement_date) IS NOT NULL THEN 'Settled' ELSE 'Not Settled' END AS transaction_state
    , sum( payment_amount ) AS payment_amount
    , min( payment_processed_at ) AS payment_processed_at
    , sum( payment_fee ) AS payment_fee
    , sum( refund_amount ) AS refund_amount
    , cast(NULL as timestamp) AS refund_processed_at
    , sum( refund_fee ) AS refund_fee
    , min(settlement_date) AS settlement_date
    , max(file_time) AS file_time
    , string_agg(DISTINCT settlement_id, ',') AS settlement_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`fancy__dashboard_orders`
  GROUP BY 1

), api AS (

  SELECT
      fancy_order_id
    , CAST('Fancy API' AS string) AS data_source
    , CAST('Not Settled' AS string) AS transaction_state
    , sum( payment_amount ) AS payment_amount
    , min( payment_processed_at ) AS payment_processed_at
    , sum( payment_fee ) AS payment_fee
    , sum( refund_amount ) AS refund_amount
    , cast(NULL as timestamp) AS refund_processed_at
    , sum( refund_fee ) AS refund_fee
    , min(CAST(NULL AS date)) AS settlement_date
    , max(file_time) AS file_time
    , CAST(NULL AS string) AS settlement_id
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`fancy__api_orders` AS api_orders
  WHERE NOT EXISTS (SELECT * FROM dashboard WHERE fancy_order_id = api_orders.fancy_order_id)
  GROUP BY 1

), unioned AS (

  SELECT *
  FROM api
  UNION ALL
  SELECT *
  FROM dashboard

), mag_order_match AS (

  SELECT
      fancy_order_id
    , mag_order_id
  FROM smv_fancy_order
  INNER JOIN sales_flat_order
    ON smv_fancy_order.sales_flat_order_id = sales_flat_order.sales_flat_order_id

), mag_email_match AS (

  SELECT DISTINCT
      
  CAST(regexp_extract(customer_email, 
  r'([0-9]{7})@'
) AS string)
 AS fancy_order_id
    , 
  CAST(regexp_extract(mag_order_id, 
  r'[0-9]{9}'
) AS string)
 AS mag_order_id
  FROM sales_flat_order
  WHERE NOT EXISTS (
    SELECT * FROM smv_fancy_order WHERE sales_flat_order_id = sales_flat_order.sales_flat_order_id
  )

), mag_orders AS (

  SELECT *
  FROM mag_order_match
  UNION ALL
  SELECT *
  FROM mag_email_match
  WHERE fancy_order_id IS NOT NULL

), final AS (

  SELECT
      unioned.fancy_order_id AS transaction_id
    , mag_orders.mag_order_id
    , unioned.settlement_id
    , CAST('Fancy' AS string) AS channel_or_gateway
    , unioned.data_source
    , unioned.transaction_state
    , CAST('Approved' AS string) AS checkout_status
    , unioned.payment_processed_at
    , unioned.payment_amount
    , unioned.payment_fee
    , unioned.refund_processed_at
    , unioned.refund_amount
    , unioned.refund_fee
    , unioned.settlement_date
    , unioned.file_time
    , CAST('Fancy' AS string) AS sales_channel
    , current_timestamp AS rebuild_timestamp
  FROM unioned
  LEFT JOIN mag_orders
    ON unioned.fancy_order_id = mag_orders.fancy_order_id

)

SELECT * FROM final