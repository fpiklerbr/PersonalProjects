





with validation_errors as (

    select
        channel, channel_order_id
    from `ff-stadiumgoods-raw-live`.`sales_channel`.`imported_order`

    group by channel, channel_order_id
    having count(*) > 1

)

select count(*)
from validation_errors


