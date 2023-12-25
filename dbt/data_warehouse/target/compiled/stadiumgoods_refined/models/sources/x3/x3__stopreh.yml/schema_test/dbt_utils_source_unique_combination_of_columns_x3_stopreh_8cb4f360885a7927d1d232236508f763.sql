





with validation_errors as (

    select
        stofcy_0, prlnum_0, dlvflg_0, prhnum_0
    from `ff-stadiumgoods-raw-live`.`live`.`stopreh`

    group by stofcy_0, prlnum_0, dlvflg_0, prhnum_0
    having count(*) > 1

)

select count(*)
from validation_errors


