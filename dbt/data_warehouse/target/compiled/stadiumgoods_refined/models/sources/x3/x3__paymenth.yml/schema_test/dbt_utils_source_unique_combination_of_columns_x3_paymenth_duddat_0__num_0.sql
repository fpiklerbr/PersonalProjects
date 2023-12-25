





with validation_errors as (

    select
        duddat_0, num_0
    from `ff-stadiumgoods-raw-live`.`live`.`paymenth`

    group by duddat_0, num_0
    having count(*) > 1

)

select count(*)
from validation_errors


