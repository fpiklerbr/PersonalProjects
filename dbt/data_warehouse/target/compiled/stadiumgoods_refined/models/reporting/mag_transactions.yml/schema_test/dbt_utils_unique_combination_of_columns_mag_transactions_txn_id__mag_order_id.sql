





with validation_errors as (

    select
        txn_id, mag_order_id
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`mag_transactions`

    group by txn_id, mag_order_id
    having count(*) > 1

)

select count(*)
from validation_errors


