





with validation_errors as (

    select
        sdhnum_0, sddlin_0
    from `ff-stadiumgoods-raw-live`.`live`.`sdeliveryd`

    group by sdhnum_0, sddlin_0
    having count(*) > 1

)

select count(*)
from validation_errors


