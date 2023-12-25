





with validation_errors as (

    select
        channel, ext_order_id
    from `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_order`

    group by channel, ext_order_id
    having count(*) > 1

)

select count(*)
from validation_errors


