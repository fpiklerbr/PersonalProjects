SELECT
    transaction_id
  , mag_order_id
  , CASE WHEN status != 'auth expired' THEN CAST('Approved' AS string) ELSE CAST('Not Approved' AS string) END AS checkout_status
  , min(transaction_processed_at) AS payment_processed_at
  , sum(amount) AS payment_amount
  , SUM( CASE WHEN status = 'refunded' THEN amount END ) AS refund_amount
  , max(file_time) AS file_time
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`affirm__confirmed_charges`
GROUP BY 1, 2, 3