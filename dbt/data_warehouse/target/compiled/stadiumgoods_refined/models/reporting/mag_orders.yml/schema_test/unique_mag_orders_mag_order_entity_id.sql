
    
    



select count(*) as validation_errors
from (

    select
        mag_order_entity_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`mag_orders`
    where mag_order_entity_id is not null
    group by mag_order_entity_id
    having count(*) > 1

) validation_errors


