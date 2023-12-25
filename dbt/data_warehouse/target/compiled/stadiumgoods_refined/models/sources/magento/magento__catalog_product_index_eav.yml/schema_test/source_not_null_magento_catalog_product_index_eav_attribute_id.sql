
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`stadium_production`.`catalog_product_index_eav`
where attribute_id is null


