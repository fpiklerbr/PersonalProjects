
    
    



select count(*) as validation_errors
from (

    select
        order_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_amazon_order`
    where order_id is not null
    group by order_id
    having count(*) > 1

) validation_errors


