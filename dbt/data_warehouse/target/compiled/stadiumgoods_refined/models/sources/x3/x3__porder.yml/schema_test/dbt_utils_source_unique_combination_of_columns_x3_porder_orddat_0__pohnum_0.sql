





with validation_errors as (

    select
        orddat_0, pohnum_0
    from `ff-stadiumgoods-raw-live`.`live`.`porder`

    group by orddat_0, pohnum_0
    having count(*) > 1

)

select count(*)
from validation_errors


