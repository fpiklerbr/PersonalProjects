
    
    



select count(*) as validation_errors
from (

    select
        usr_0

    from `ff-stadiumgoods-raw-live`.`live`.`autilis`
    where usr_0 is not null
    group by usr_0
    having count(*) > 1

) validation_errors


