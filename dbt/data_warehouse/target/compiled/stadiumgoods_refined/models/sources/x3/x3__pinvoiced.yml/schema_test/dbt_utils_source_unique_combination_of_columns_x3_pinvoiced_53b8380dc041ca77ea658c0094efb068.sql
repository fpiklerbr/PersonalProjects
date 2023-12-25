





with validation_errors as (

    select
        typori_0, numori_0, linori_0, seqori_0, num_0, pidlin_0
    from `ff-stadiumgoods-raw-live`.`live`.`pinvoiced`

    group by typori_0, numori_0, linori_0, seqori_0, num_0, pidlin_0
    having count(*) > 1

)

select count(*)
from validation_errors


