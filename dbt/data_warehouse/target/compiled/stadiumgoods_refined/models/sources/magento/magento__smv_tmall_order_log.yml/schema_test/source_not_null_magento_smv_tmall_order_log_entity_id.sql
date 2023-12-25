
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`stadium_production`.`smv_tmall_order_log`
where entity_id is null


