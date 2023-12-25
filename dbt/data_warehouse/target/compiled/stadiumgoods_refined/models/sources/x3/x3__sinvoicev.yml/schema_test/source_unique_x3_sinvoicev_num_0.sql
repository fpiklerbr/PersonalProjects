
    
    



select count(*) as validation_errors
from (

    select
        num_0

    from `ff-stadiumgoods-raw-live`.`live`.`sinvoicev`
    where num_0 is not null
    group by num_0
    having count(*) > 1

) validation_errors


