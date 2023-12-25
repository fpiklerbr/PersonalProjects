





with validation_errors as (

    select
        transaction_id, transaction_event
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`consignor_transactions`

    group by transaction_id, transaction_event
    having count(*) > 1

)

select count(*)
from validation_errors


