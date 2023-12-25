
    
    



select count(*) as validation_errors
from (

    select
        numdud_0

    from `ff-stadiumgoods-raw-live`.`live`.`gaccdudate`
    where numdud_0 is not null
    group by numdud_0
    having count(*) > 1

) validation_errors


