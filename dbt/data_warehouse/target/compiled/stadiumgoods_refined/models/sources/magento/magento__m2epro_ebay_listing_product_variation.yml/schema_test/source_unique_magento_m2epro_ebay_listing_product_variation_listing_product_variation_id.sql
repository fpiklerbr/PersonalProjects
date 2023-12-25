
    
    



select count(*) as validation_errors
from (

    select
        listing_product_variation_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_ebay_listing_product_variation`
    where listing_product_variation_id is not null
    group by listing_product_variation_id
    having count(*) > 1

) validation_errors


