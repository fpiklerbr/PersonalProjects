
    
    



select count(*) as validation_errors
from (

    select
        prhnum_0

    from `ff-stadiumgoods-raw-live`.`live`.`stopreh`
    where prhnum_0 is not null
    group by prhnum_0
    having count(*) > 1

) validation_errors


