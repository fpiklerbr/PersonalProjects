
    
    



select count(*) as validation_errors
from (

    select
        son_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_children_items`
    where son_id is not null
    group by son_id
    having count(*) > 1

) validation_errors


