

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_affirm_chargebacks`
  OPTIONS()
  as SELECT
    order_date
  , mag_order_id
  , settlement_date
  , transaction_id as case_id
  , cast('Affirm' AS string )as payment_processor
  , sales as chargeback_amount
  , fees as chargeback_reversal
  , CASE
    WHEN event_type = 'dispute_opened' THEN 'Open'
    WHEN event_type = 'dispute_resolved' AND sales <> 0 THEN 'Closed - Won'
    WHEN event_type = 'dispute_resolved' AND fees <> 0 THEN 'Closed - Lost'
   END AS chargeback_status
  , event_type
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`affirm__settlement_reports`
  WHERE event_type IN ('dispute_opened', 'dispute_resolved');

