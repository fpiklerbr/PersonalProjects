
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`stadium_production`.`smv_fancy_order`
where fancy_order_id is null


