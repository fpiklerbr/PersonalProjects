





with validation_errors as (

    select
        dlvdat_0, sdhnum_0
    from `ff-stadiumgoods-raw-live`.`live`.`sdelivery`

    group by dlvdat_0, sdhnum_0
    having count(*) > 1

)

select count(*)
from validation_errors


