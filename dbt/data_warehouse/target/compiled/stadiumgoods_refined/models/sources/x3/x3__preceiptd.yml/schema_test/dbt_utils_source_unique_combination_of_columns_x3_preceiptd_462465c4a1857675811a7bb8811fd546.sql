





with validation_errors as (

    select
        pohnum_0, poplin_0, poqseq_0, pthnum_0, ptdlin_0
    from `ff-stadiumgoods-raw-live`.`live`.`preceiptd`

    group by pohnum_0, poplin_0, poqseq_0, pthnum_0, ptdlin_0
    having count(*) > 1

)

select count(*)
from validation_errors


