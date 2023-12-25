
    
    



select count(*) as validation_errors
from (

    select
        fancy_order_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`smv_fancy_order`
    where fancy_order_id is not null
    group by fancy_order_id
    having count(*) > 1

) validation_errors


