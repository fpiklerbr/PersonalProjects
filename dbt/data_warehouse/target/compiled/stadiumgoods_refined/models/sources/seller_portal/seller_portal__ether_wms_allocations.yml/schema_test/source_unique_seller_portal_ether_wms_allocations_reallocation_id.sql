
    
    



select count(*) as validation_errors
from (

    select
        reallocation_id

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_allocations`
    where reallocation_id is not null
    group by reallocation_id
    having count(*) > 1

) validation_errors


