





with validation_errors as (

    select
        increment_id, x3_order_id
    from `ff-stadiumgoods-raw-live`.`stadium_production`.`smv_x3_order`

    group by increment_id, x3_order_id
    having count(*) > 1

)

select count(*)
from validation_errors


