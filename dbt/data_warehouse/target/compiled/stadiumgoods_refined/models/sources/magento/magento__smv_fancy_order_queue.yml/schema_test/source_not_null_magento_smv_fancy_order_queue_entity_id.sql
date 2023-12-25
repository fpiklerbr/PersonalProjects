
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`stadium_production`.`smv_fancy_order_queue`
where entity_id is null


