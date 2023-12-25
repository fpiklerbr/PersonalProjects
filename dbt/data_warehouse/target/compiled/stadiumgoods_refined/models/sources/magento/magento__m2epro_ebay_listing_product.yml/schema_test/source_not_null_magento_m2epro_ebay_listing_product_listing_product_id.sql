
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_ebay_listing_product`
where listing_product_id is null


