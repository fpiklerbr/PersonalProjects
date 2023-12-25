

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_amazon_pay_chargebacks`
  OPTIONS()
  as SELECT
   transaction_processed_at as order_date
 , mag_order_id
 , settlement_date
 , transaction_id as case_id
 , cast('Amazon Pay' AS string) as payment_processor
 , transaction_amount as chargeback_amount
 , cast(null AS float64) as chargeback_reversal
 , CASE
    when transaction_type in ('A to Z Guarantee Claim','Chargeback') then 'Closed - Lost'
   END AS chargeback_status
 , transaction_type as event_type
FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`amazon_pay__settlement_data`
WHERE transaction_type in ('A to Z Guarantee Claim','Chargeback');

