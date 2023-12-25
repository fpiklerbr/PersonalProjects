





with validation_errors as (

    select
        store_id, order_line_id
    from `ff-stadiumgoods-raw-live`.`imports`.`farfetch_orders_rows`

    group by store_id, order_line_id
    having count(*) > 1

)

select count(*)
from validation_errors


