
    
    



select count(*) as validation_errors
from (

    select
        sizescale_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_sizes`
    where sizescale_id is not null
    group by sizescale_id
    having count(*) > 1

) validation_errors


