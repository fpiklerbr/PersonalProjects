
    
    



select count(*) as validation_errors
from (

    select
        category_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_category`
    where category_id is not null
    group by category_id
    having count(*) > 1

) validation_errors


