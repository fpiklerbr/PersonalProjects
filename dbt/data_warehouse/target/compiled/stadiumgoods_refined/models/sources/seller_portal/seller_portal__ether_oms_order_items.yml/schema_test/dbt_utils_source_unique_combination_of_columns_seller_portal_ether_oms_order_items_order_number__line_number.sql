





with validation_errors as (

    select
        order_number, line_number
    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_order_items`

    group by order_number, line_number
    having count(*) > 1

)

select count(*)
from validation_errors


