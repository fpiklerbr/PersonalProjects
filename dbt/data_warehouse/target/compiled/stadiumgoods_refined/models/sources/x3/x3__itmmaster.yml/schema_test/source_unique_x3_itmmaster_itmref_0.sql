
    
    



select count(*) as validation_errors
from (

    select
        itmref_0

    from `ff-stadiumgoods-raw-live`.`live`.`itmmaster`
    where itmref_0 is not null
    group by itmref_0
    having count(*) > 1

) validation_errors


