
    
    



select count(*) as validation_errors
from (

    select
        fps_order_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`fps_orders`
    where fps_order_id is not null
    group by fps_order_id
    having count(*) > 1

) validation_errors


