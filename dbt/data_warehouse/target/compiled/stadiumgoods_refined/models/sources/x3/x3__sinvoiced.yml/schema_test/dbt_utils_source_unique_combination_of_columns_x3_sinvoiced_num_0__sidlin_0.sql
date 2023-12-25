





with validation_errors as (

    select
        num_0, sidlin_0
    from `ff-stadiumgoods-raw-live`.`live`.`sinvoiced`

    group by num_0, sidlin_0
    having count(*) > 1

)

select count(*)
from validation_errors


