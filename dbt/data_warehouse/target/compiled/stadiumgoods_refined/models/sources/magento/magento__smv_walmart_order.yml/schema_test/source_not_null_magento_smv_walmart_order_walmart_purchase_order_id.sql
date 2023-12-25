
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`stadium_production`.`smv_walmart_order`
where walmart_purchase_order_id is null


