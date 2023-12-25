





with validation_errors as (

    select
        bpsnum_0, pthnum_0, ptdlin_0
    from `ff-stadiumgoods-raw-live`.`live`.`preceiptd`

    group by bpsnum_0, pthnum_0, ptdlin_0
    having count(*) > 1

)

select count(*)
from validation_errors


