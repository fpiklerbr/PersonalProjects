
    
    



select count(*) as validation_errors
from (

    select
        bpcnum_0

    from `ff-stadiumgoods-raw-live`.`live`.`bpcustomer`
    where bpcnum_0 is not null
    group by bpcnum_0
    having count(*) > 1

) validation_errors


