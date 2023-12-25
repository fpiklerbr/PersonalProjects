
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_price`
where barcode_entity_id is null


