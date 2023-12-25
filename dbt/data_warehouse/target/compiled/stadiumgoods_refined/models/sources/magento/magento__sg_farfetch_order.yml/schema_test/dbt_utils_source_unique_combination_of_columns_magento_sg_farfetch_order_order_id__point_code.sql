





with validation_errors as (

    select
        order_id, point_code
    from `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_order`

    group by order_id, point_code
    having count(*) > 1

)

select count(*)
from validation_errors


