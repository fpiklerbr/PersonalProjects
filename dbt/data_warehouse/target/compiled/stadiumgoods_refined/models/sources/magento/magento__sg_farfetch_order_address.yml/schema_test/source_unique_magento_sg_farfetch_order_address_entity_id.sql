
    
    



select count(*) as validation_errors
from (

    select
        entity_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_order_address`
    where entity_id is not null
    group by entity_id
    having count(*) > 1

) validation_errors


