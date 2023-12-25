
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`stadium_production`.`smv_tmall_order_queue`
where tmall_order_id is null


