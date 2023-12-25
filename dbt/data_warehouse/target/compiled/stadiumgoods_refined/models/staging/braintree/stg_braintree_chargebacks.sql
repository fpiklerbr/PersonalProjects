select
     order_date
   , mag_order_id
   , settlement_date
   , case_id
   , cast('Braintree' AS string) as payment_processor
   , case
     when status in ('lost', 'accepted', 'expired') then amount * -1
     else amount end as chargeback_amount
   , amount_won as chargeback_reversal
   , CASE
     WHEN status = 'open' THEN 'Open'
     WHEN status in ('lost', 'accepted', 'expired') then 'Closed - Lost'
     WHEN status = 'won' then 'Closed - Won'
    END AS chargeback_status
   , status as event_type
  from `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`braintree__disputes` AS bbd
  where status in ('open', 'lost', 'accepted', 'expired', 'won')