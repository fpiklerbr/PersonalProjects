

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_affirm_settled_transactions`
  OPTIONS()
  as SELECT
    transaction_id
  , mag_order_id
  , MIN( CASE WHEN sales > 0 THEN transaction_processed_at END ) AS payment_processed_at
  , SUM( CASE WHEN sales > 0 THEN sales END ) AS payment_amount
  , SUM( CASE WHEN sales > 0 THEN fees END ) AS payment_fee
  , MIN( CASE WHEN sales < 0 OR refunds != 0 THEN transaction_processed_at END ) AS refund_processed_at
  , abs(SUM( CASE WHEN sales < 0 OR refunds != 0 THEN coalesce(sales, 0) + coalesce(refunds, 0) END )) AS refund_amount
  , SUM( CASE WHEN sales < 0 OR refunds != 0 THEN fees END ) AS refund_fee
  , min(settlement_date) AS settlement_date
  , max(file_time) AS file_time
  , string_agg(DISTINCT settlement_id, ',') AS settlement_id
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`affirm__settlement_reports`
GROUP BY 1, 2;

