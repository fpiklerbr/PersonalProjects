
    
    



select count(*) as validation_errors
from (

    select
        composition_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_composition`
    where composition_id is not null
    group by composition_id
    having count(*) > 1

) validation_errors


