
    
    



select count(*) as validation_errors
from (

    select
        number

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_orders`
    where number is not null
    group by number
    having count(*) > 1

) validation_errors


