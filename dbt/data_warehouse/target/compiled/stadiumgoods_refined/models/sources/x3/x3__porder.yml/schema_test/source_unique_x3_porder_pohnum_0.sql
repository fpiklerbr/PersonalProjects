
    
    



select count(*) as validation_errors
from (

    select
        pohnum_0

    from `ff-stadiumgoods-raw-live`.`live`.`porder`
    where pohnum_0 is not null
    group by pohnum_0
    having count(*) > 1

) validation_errors


