





with validation_errors as (

    select
        itmref_0, ypcu_0
    from `ff-stadiumgoods-raw-live`.`live`.`yitmupc`

    group by itmref_0, ypcu_0
    having count(*) > 1

)

select count(*)
from validation_errors


