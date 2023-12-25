





with validation_errors as (

    select
        prhnum_0, prelin_0
    from `ff-stadiumgoods-raw-live`.`live`.`stopred`

    group by prhnum_0, prelin_0
    having count(*) > 1

)

select count(*)
from validation_errors


