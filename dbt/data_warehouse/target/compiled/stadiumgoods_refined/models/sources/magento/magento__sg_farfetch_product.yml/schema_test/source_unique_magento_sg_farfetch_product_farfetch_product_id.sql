
    
    



select count(*) as validation_errors
from (

    select
        farfetch_product_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_product`
    where farfetch_product_id is not null
    group by farfetch_product_id
    having count(*) > 1

) validation_errors


