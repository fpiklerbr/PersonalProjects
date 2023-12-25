





with validation_errors as (

    select
        credit_transaction_id, refund_transaction_id
    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`mag_store_credit_transactions`

    group by credit_transaction_id, refund_transaction_id
    having count(*) > 1

)

select count(*)
from validation_errors


