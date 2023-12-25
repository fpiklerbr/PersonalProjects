





with validation_errors as (

    select
        bpsnum_0, orddat_0, pohnum_0
    from `ff-stadiumgoods-raw-live`.`live`.`porder`

    group by bpsnum_0, orddat_0, pohnum_0
    having count(*) > 1

)

select count(*)
from validation_errors


