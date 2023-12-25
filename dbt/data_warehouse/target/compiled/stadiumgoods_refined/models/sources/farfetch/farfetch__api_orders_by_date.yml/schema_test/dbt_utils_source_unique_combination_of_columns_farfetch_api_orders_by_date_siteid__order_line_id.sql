





with validation_errors as (

    select
        siteid, order_line_id
    from `ff-stadiumgoods-raw-live`.`imports`.`farfetch_orders_by_date`

    group by siteid, order_line_id
    having count(*) > 1

)

select count(*)
from validation_errors


