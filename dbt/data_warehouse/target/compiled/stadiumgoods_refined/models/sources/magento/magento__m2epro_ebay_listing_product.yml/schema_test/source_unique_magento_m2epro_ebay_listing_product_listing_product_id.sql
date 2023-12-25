
    
    



select count(*) as validation_errors
from (

    select
        listing_product_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_ebay_listing_product`
    where listing_product_id is not null
    group by listing_product_id
    having count(*) > 1

) validation_errors


