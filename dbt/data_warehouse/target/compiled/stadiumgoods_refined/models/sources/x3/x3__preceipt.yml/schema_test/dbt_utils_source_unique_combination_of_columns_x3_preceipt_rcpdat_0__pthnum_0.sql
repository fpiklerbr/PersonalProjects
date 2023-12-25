





with validation_errors as (

    select
        rcpdat_0, pthnum_0
    from `ff-stadiumgoods-raw-live`.`live`.`preceipt`

    group by rcpdat_0, pthnum_0
    having count(*) > 1

)

select count(*)
from validation_errors


