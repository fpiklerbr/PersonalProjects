



WITH settled AS (

  SELECT *
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`vantiv__net_settled_sales`

), captured_not_settled AS (

  SELECT *
  , CAST(NULL AS float64) AS payment_fee
  , CAST(NULL AS float64) AS refund_fee
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`vantiv__session_report` AS session_report
	WHERE transaction_description NOT IN ('Authorization', 'Auth Reversal')
	  AND NOT EXISTS (SELECT * FROM settled WHERE transaction_id = session_report.transaction_id)

), authorized_not_captured AS (

  SELECT *
  , CAST(NULL AS float64) AS payment_fee
  , CAST(NULL AS float64) AS refund_fee
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`vantiv__session_report` AS session_report
	WHERE transaction_description IN ('Authorization', 'Auth Reversal')
	  AND NOT EXISTS (SELECT * FROM settled WHERE transaction_id = session_report.transaction_id)
	  AND NOT EXISTS (SELECT * FROM settled WHERE parent_transaction_id = session_report.transaction_id)
	  AND NOT EXISTS (SELECT * FROM captured_not_settled WHERE parent_transaction_id = session_report.transaction_id)

), settled_agg AS (

  SELECT
    'Vantiv Net Settled Sales' AS data_source
  , 'Settled' AS transaction_state
    
  , transaction_id
  , mag_order_id
  , checkout_status
  , cast('Vantiv' as string) AS channel_or_gateway
  , sum( payment_amount ) AS payment_amount
  , min( payment_processed_at ) AS payment_processed_at
  , sum( payment_fee ) AS payment_fee
  , sum( refund_amount ) AS refund_amount
  , min( refund_processed_at ) AS refund_processed_at
  , sum( refund_fee ) AS refund_fee
  , max(file_time) AS file_time

  , min(settlement_date) AS settlement_date
  , string_agg(settlement_id, ',') AS settlement_id
  FROM settled
  GROUP BY 1, 2, 3, 4, 5, 6

), captured_not_settled_agg AS (

  SELECT
    'Vantiv Session Report' AS data_source
  , 'Not Settled' AS transaction_state
    
  , transaction_id
  , mag_order_id
  , checkout_status
  , cast('Vantiv' as string) AS channel_or_gateway
  , sum( payment_amount ) AS payment_amount
  , min( payment_processed_at ) AS payment_processed_at
  , sum( payment_fee ) AS payment_fee
  , sum( refund_amount ) AS refund_amount
  , min( refund_processed_at ) AS refund_processed_at
  , sum( refund_fee ) AS refund_fee
  , max(file_time) AS file_time

  , cast(NULL as date) AS settlement_date
  , cast(NULL as string) AS settlement_id
  FROM captured_not_settled
  GROUP BY 1, 2, 3, 4, 5, 6

), authorized_not_captured_agg AS (

  SELECT
    'Vantiv Session Report' AS data_source
  , 'Not Settled' AS transaction_state
    
  , transaction_id
  , mag_order_id
  , checkout_status
  , cast('Vantiv' as string) AS channel_or_gateway
  , sum( payment_amount ) AS payment_amount
  , min( payment_processed_at ) AS payment_processed_at
  , sum( payment_fee ) AS payment_fee
  , sum( refund_amount ) AS refund_amount
  , min( refund_processed_at ) AS refund_processed_at
  , sum( refund_fee ) AS refund_fee
  , max(file_time) AS file_time

  , cast(NULL as date) AS settlement_date
  , cast(NULL as string) AS settlement_id
  FROM authorized_not_captured
  GROUP BY 1, 2, 3, 4, 5, 6

), final AS (

  SELECT *
  FROM settled_agg
  UNION ALL
  SELECT *
  FROM captured_not_settled_agg
  UNION ALL
  SELECT *
  FROM authorized_not_captured_agg

)

SELECT *
  , CAST('SG Web' AS string) AS sales_channel
  , current_timestamp AS rebuild_timestamp
FROM final