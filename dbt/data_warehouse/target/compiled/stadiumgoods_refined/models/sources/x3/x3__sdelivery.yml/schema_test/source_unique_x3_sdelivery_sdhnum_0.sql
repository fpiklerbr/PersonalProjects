
    
    



select count(*) as validation_errors
from (

    select
        sdhnum_0

    from `ff-stadiumgoods-raw-live`.`live`.`sdelivery`
    where sdhnum_0 is not null
    group by sdhnum_0
    having count(*) > 1

) validation_errors


