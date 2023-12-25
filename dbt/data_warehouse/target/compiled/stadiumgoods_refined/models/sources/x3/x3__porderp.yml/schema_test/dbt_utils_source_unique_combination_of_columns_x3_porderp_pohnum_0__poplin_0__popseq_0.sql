





with validation_errors as (

    select
        pohnum_0, poplin_0, popseq_0
    from `ff-stadiumgoods-raw-live`.`live`.`porderp`

    group by pohnum_0, poplin_0, popseq_0
    having count(*) > 1

)

select count(*)
from validation_errors


