





with validation_errors as (

    select
        srhnum_0, srdlin_0
    from `ff-stadiumgoods-raw-live`.`live`.`sreturnd`

    group by srhnum_0, srdlin_0
    having count(*) > 1

)

select count(*)
from validation_errors


