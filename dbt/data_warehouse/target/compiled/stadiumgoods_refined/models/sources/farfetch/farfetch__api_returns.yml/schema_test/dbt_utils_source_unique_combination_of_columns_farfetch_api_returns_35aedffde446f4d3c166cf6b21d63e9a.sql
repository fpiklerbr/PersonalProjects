





with validation_errors as (

    select
        point_id, order_line_id, return_order_id
    from `ff-stadiumgoods-raw-live`.`imports`.`farfetch_returns`

    group by point_id, order_line_id, return_order_id
    having count(*) > 1

)

select count(*)
from validation_errors


