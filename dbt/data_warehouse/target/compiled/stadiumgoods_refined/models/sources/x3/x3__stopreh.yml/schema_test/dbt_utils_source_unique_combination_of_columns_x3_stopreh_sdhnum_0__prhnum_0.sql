





with validation_errors as (

    select
        sdhnum_0, prhnum_0
    from `ff-stadiumgoods-raw-live`.`live`.`stopreh`

    group by sdhnum_0, prhnum_0
    having count(*) > 1

)

select count(*)
from validation_errors


