
    
    



select count(*) as validation_errors
from (

    select
        ff_stockpoint_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_stockpoint`
    where ff_stockpoint_id is not null
    group by ff_stockpoint_id
    having count(*) > 1

) validation_errors


