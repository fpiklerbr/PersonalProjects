





with validation_errors as (

    select
        num_0, pidlin_0, bpr_0, numori_0, linori_0
    from `ff-stadiumgoods-raw-live`.`live`.`pinvoiced`

    group by num_0, pidlin_0, bpr_0, numori_0, linori_0
    having count(*) > 1

)

select count(*)
from validation_errors


