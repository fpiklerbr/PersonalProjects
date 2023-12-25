SELECT
    posted_date as order_date
  , cast(null as string) as mag_order_id
  , posted_date as settlement_date
  , transaction_id as case_id
  , cast('Amazon Marketplace' as string) as payment_processor
  , sum(_raw_amount) as chargeback_amount
  , cast(null AS float64) as chargeback_reversal
  , CASE
   when transaction_type in ('A-to-z Guarantee Refund','Chargeback Refund') then 'Closed - Lost'
   END AS chargeback_status
   , transaction_type as event_type
  from `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_amazon_marketplace_settlements`
  where transaction_type in ('A-to-z Guarantee Refund','Chargeback Refund')
  and posted_date > '2000-01-01'
  group by posted_date, mag_order_id, transaction_id, chargeback_status, transaction_type