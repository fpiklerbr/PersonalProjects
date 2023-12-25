





with validation_errors as (

    select
        num_0, lin_0, curlin_0
    from `ff-stadiumgoods-raw-live`.`live`.`paymentd`

    group by num_0, lin_0, curlin_0
    having count(*) > 1

)

select count(*)
from validation_errors


