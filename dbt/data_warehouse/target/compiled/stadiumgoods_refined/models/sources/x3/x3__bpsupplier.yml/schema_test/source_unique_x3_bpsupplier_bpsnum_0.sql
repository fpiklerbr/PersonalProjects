
    
    



select count(*) as validation_errors
from (

    select
        bpsnum_0

    from `ff-stadiumgoods-raw-live`.`live`.`bpsupplier`
    where bpsnum_0 is not null
    group by bpsnum_0
    having count(*) > 1

) validation_errors


