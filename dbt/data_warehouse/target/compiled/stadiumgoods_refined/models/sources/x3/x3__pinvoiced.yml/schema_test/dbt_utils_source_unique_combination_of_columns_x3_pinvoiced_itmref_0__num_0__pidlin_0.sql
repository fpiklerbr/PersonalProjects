





with validation_errors as (

    select
        itmref_0, num_0, pidlin_0
    from `ff-stadiumgoods-raw-live`.`live`.`pinvoiced`

    group by itmref_0, num_0, pidlin_0
    having count(*) > 1

)

select count(*)
from validation_errors


