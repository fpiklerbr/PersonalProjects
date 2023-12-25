
    
    



select count(*) as validation_errors
from (

    select
        order_item_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`mag_order_items`
    where order_item_id is not null
    group by order_item_id
    having count(*) > 1

) validation_errors


