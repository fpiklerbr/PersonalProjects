
    
    



select count(*) as validation_errors
from (

    select
        item_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`sales_flat_order_item`
    where item_id is not null
    group by item_id
    having count(*) > 1

) validation_errors


