





with validation_errors as (

    select
        dudnum_0, dudlig_0, num_0, lin_0
    from `ff-stadiumgoods-raw-live`.`live`.`paymentd`

    group by dudnum_0, dudlig_0, num_0, lin_0
    having count(*) > 1

)

select count(*)
from validation_errors


