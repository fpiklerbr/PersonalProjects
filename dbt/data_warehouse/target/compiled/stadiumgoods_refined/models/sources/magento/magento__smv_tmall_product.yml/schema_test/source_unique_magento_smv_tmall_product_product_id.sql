
    
    



select count(*) as validation_errors
from (

    select
        product_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`smv_tmall_product`
    where product_id is not null
    group by product_id
    having count(*) > 1

) validation_errors


