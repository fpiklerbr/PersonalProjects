





with validation_errors as (

    select
        typ_0, num_0, lig_0, dudlig_0
    from `ff-stadiumgoods-raw-live`.`live`.`gaccdudate`

    group by typ_0, num_0, lig_0, dudlig_0
    having count(*) > 1

)

select count(*)
from validation_errors


