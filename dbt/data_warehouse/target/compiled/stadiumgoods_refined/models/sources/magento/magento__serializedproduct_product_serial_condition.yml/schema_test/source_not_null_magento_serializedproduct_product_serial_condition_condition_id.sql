
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`stadium_production`.`serializedproduct_product_serial_condition`
where condition_id is null


