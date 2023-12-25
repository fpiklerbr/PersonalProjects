
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_order`
where entity_id is null


