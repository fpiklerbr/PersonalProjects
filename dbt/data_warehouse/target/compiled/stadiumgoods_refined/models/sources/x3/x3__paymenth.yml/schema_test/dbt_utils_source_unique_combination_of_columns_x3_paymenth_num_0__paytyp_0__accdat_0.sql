





with validation_errors as (

    select
        num_0, paytyp_0, accdat_0
    from `ff-stadiumgoods-raw-live`.`live`.`paymenth`

    group by num_0, paytyp_0, accdat_0
    having count(*) > 1

)

select count(*)
from validation_errors


