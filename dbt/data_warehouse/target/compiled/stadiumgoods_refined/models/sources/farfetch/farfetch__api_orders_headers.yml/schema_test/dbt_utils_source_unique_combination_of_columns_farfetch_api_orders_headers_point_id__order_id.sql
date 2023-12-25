





with validation_errors as (

    select
        point_id, order_id
    from `ff-stadiumgoods-raw-live`.`imports`.`farfetch_orders_headers`

    group by point_id, order_id
    having count(*) > 1

)

select count(*)
from validation_errors


