
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`imports`.`ga_product_data`
where product_sku is null


