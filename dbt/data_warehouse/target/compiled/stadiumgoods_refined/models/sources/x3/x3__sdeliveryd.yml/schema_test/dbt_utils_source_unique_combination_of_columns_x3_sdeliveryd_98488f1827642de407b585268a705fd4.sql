





with validation_errors as (

    select
        sdhnum_0, sddlin_0, sohnum_0, upddattim_0, soplin_0, rowid
    from `ff-stadiumgoods-raw-live`.`live`.`sdeliveryd`

    group by sdhnum_0, sddlin_0, sohnum_0, upddattim_0, soplin_0, rowid
    having count(*) > 1

)

select count(*)
from validation_errors


