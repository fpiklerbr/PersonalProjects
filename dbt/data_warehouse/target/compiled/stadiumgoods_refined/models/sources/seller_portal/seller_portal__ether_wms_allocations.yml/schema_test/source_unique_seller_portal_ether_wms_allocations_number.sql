
    
    



select count(*) as validation_errors
from (

    select
        number

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_allocations`
    where number is not null
    group by number
    having count(*) > 1

) validation_errors


