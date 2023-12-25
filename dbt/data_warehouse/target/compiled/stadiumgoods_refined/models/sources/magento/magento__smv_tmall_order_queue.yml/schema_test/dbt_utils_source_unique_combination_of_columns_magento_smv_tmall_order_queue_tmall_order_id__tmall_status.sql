





with validation_errors as (

    select
        tmall_order_id, tmall_status
    from `ff-stadiumgoods-raw-live`.`stadium_production`.`smv_tmall_order_queue`

    group by tmall_order_id, tmall_status
    having count(*) > 1

)

select count(*)
from validation_errors


