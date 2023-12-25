





with validation_errors as (

    select
        payment_id, payment_line
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`x3_consignor_payments`

    group by payment_id, payment_line
    having count(*) > 1

)

select count(*)
from validation_errors


