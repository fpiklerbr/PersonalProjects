





with validation_errors as (

    select
        gte_0, num_0
    from `ff-stadiumgoods-raw-live`.`live`.`sinvoice`

    group by gte_0, num_0
    having count(*) > 1

)

select count(*)
from validation_errors


