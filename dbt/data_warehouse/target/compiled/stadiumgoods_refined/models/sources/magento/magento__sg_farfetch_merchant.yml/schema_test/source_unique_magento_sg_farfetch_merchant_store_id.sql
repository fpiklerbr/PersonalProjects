
    
    



select count(*) as validation_errors
from (

    select
        store_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_merchant`
    where store_id is not null
    group by store_id
    having count(*) > 1

) validation_errors


