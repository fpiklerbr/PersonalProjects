





with validation_errors as (

    select
        merchant_order_id, order_status
    from `ff-stadiumgoods-raw-live`.`stadium_production`.`smv_jet_order_queue`

    group by merchant_order_id, order_status
    having count(*) > 1

)

select count(*)
from validation_errors


