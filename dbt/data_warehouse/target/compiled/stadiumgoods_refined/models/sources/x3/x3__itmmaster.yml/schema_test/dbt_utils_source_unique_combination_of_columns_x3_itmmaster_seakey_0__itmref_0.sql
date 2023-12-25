





with validation_errors as (

    select
        seakey_0, itmref_0
    from `ff-stadiumgoods-raw-live`.`live`.`itmmaster`

    group by seakey_0, itmref_0
    having count(*) > 1

)

select count(*)
from validation_errors


