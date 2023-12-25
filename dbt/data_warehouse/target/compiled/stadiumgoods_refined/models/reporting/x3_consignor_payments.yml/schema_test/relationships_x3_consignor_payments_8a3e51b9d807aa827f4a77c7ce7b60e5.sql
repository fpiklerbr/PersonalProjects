
    
    




select count(*) as validation_errors
from (
    select line_invoice as id from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`x3_consignor_payments`
) as child
left join (
    select payout_invoice_id as id from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_x3_consignor_payouts`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null


