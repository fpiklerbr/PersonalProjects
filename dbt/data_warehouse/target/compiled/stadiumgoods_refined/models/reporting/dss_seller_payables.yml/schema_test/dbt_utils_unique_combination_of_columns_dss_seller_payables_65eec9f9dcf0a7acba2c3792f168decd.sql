





with validation_errors as (

    select
        consignor_id, payout_invoice_date
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`dss_seller_payables`

    group by consignor_id, payout_invoice_date
    having count(*) > 1

)

select count(*)
from validation_errors


