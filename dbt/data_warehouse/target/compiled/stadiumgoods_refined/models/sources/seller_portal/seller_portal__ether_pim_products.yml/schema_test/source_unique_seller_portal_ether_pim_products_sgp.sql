
    
    



select count(*) as validation_errors
from (

    select
        sgp

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_products`
    where sgp is not null
    group by sgp
    having count(*) > 1

) validation_errors


