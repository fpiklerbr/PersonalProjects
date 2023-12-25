
    
    



select count(*) as validation_errors
from (

    select
        composition_type_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_composition_type`
    where composition_type_id is not null
    group by composition_type_id
    having count(*) > 1

) validation_errors


