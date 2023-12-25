





with validation_errors as (

    select
        payout_invoice_id, payout_invoice_line
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_x3_consignor_payouts`

    group by payout_invoice_id, payout_invoice_line
    having count(*) > 1

)

select count(*)
from validation_errors


