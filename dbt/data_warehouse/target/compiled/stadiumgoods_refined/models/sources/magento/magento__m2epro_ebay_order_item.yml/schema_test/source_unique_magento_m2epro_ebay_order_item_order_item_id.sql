
    
    



select count(*) as validation_errors
from (

    select
        order_item_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`m2epro_ebay_order_item`
    where order_item_id is not null
    group by order_item_id
    having count(*) > 1

) validation_errors


