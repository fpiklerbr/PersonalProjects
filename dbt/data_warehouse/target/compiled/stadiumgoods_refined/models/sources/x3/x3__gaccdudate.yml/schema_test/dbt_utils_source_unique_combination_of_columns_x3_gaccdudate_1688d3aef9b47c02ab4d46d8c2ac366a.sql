





with validation_errors as (

    select
        bpr_0, soinum_0, accnum_0, dudlig_0
    from `ff-stadiumgoods-raw-live`.`live`.`gaccdudate`

    group by bpr_0, soinum_0, accnum_0, dudlig_0
    having count(*) > 1

)

select count(*)
from validation_errors


