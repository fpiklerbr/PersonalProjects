
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_amazon_order_item`
where order_item_id is null


