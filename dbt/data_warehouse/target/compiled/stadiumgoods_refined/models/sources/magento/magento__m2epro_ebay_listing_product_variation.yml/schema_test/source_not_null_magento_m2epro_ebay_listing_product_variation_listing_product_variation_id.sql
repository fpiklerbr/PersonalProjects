
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_ebay_listing_product_variation`
where listing_product_variation_id is null


