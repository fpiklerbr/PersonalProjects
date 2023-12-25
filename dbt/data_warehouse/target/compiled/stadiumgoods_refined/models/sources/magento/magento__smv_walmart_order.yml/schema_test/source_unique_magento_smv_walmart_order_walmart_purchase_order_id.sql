
    
    



select count(*) as validation_errors
from (

    select
        walmart_purchase_order_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`smv_walmart_order`
    where walmart_purchase_order_id is not null
    group by walmart_purchase_order_id
    having count(*) > 1

) validation_errors


