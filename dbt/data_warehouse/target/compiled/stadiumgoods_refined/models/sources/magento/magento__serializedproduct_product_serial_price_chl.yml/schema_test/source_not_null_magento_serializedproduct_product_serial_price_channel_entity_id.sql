
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`stadium_production`.`serializedproduct_product_serial_price_channel`
where entity_id is null


