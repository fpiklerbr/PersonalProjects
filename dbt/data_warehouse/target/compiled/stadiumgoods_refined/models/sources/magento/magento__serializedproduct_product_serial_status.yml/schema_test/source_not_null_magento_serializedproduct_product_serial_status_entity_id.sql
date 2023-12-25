
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`stadium_production`.`serializedproduct_product_serial_status`
where entity_id is null


