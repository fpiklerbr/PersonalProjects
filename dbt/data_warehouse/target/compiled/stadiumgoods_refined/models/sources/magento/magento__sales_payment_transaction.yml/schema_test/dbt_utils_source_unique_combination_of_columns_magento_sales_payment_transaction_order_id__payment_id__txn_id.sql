





with validation_errors as (

    select
        order_id, payment_id, txn_id
    from `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_payment_transaction`

    group by order_id, payment_id, txn_id
    having count(*) > 1

)

select count(*)
from validation_errors


