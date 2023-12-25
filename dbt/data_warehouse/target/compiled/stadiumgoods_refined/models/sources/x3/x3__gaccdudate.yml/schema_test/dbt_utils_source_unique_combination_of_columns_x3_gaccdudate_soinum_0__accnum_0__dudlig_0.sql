





with validation_errors as (

    select
        soinum_0, accnum_0, dudlig_0
    from `ff-stadiumgoods-raw-live`.`live`.`gaccdudate`

    group by soinum_0, accnum_0, dudlig_0
    having count(*) > 1

)

select count(*)
from validation_errors


