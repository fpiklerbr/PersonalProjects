

  create or replace view `ff-stadiumgoods-refined-dev`.`stadiumgoods_staging`.`stg_x3_payouts`
  OPTIONS()
  as 

  SELECT
      invoice_id
    , business_partner_id
    , total_amount
    , payment_date
    , paid_amount
    , total_amount - paid_amount AS invoice_open_amount
  FROM `ff-stadiumgoods-refined-dev`.`stadiumgoods_sources`.`x3__gaccdudate`
  WHERE invoice_type_code = 'SPINV';

