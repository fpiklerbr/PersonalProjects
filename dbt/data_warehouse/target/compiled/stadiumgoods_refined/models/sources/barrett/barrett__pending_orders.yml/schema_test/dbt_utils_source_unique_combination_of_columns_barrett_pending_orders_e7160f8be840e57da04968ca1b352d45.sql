





with validation_errors as (

    select
        file_name, reference, item_entered
    from `ff-stadiumgoods-raw-live`.`imports`.`barrett_pending_orders`

    group by file_name, reference, item_entered
    having count(*) > 1

)

select count(*)
from validation_errors


