
    
    



select count(*) as validation_errors
from (

    select
        product_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_product`
    where product_id is not null
    group by product_id
    having count(*) > 1

) validation_errors


