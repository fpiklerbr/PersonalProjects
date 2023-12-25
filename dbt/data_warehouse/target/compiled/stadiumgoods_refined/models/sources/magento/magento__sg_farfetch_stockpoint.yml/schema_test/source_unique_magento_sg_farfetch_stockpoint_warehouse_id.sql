
    
    



select count(*) as validation_errors
from (

    select
        warehouse_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_stockpoint`
    where warehouse_id is not null
    group by warehouse_id
    having count(*) > 1

) validation_errors


