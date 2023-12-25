





with validation_errors as (

    select
        accnum_0, dudlig_0
    from `ff-stadiumgoods-raw-live`.`live`.`gaccdudate`

    group by accnum_0, dudlig_0
    having count(*) > 1

)

select count(*)
from validation_errors


