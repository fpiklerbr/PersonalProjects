





with validation_errors as (

    select
        stofcy_0, itmref_0, stocou_0, seq_0
    from `ff-stadiumgoods-raw-live`.`live`.`stoall`

    group by stofcy_0, itmref_0, stocou_0, seq_0
    having count(*) > 1

)

select count(*)
from validation_errors


