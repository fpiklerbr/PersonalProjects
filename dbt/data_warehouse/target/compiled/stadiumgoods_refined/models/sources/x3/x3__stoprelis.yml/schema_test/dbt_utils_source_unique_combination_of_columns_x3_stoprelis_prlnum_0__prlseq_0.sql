





with validation_errors as (

    select
        prlnum_0, prlseq_0
    from `ff-stadiumgoods-raw-live`.`live`.`stoprelis`

    group by prlnum_0, prlseq_0
    having count(*) > 1

)

select count(*)
from validation_errors


