
    
    



select count(*) as validation_errors
from (

    select
        tmall_order_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`smv_tmall_order`
    where tmall_order_id is not null
    group by tmall_order_id
    having count(*) > 1

) validation_errors


