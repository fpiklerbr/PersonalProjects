

  create or replace view `ff-stadiumgoods-refined-live`.`stadiumgoods_staging`.`stg_paypal_chargebacks`
  OPTIONS()
  as WITH paypal_base AS (

  SELECT
    transaction_initiation_date as order_date
  , mag_order_id
  , settlement_date
  , transaction_id as case_id
  , cast('Paypal' AS string) as payment_processor
  , CASE
     WHEN seed.chargeback_status = 'Open' then transaction_amount * -1
     WHEN seed.chargeback_status = 'Closed - Won' then transaction_amount
     WHEN seed.chargeback_status = 'Closed - Lost' then transaction_amount * -1
   END AS chargeback_amount
  , cast(null AS float64) as chargeback_reversal
  , seed.chargeback_status
  , pp.transaction_event_code
  , row_number() over (partition by transaction_id order by settlement_date) as transaction_order
  FROM `ff-stadiumgoods-refined-live`.`stadiumgoods_sources`.`paypal__settlements` AS pp
  LEFT JOIN `ff-stadiumgoods-refined-live`.`stadiumgoods_seeds`.`lookup_paypal_transaction_events` AS seed USING (transaction_event_code)

), final AS (

  SELECT
    paypal_base.order_date
  , mag_order_id
  , settlement_date
  , case_id
  , payment_processor
  , chargeback_amount
  , chargeback_reversal
  , chargeback_status
  , transaction_event_code as event_type
  FROM  paypal_base
  WHERE (chargeback_status = 'Open' and transaction_order = 1)
  OR chargeback_status = 'Closed - Won'
  OR chargeback_status = 'Closed - Lost'

)

SELECT * FROM final;

