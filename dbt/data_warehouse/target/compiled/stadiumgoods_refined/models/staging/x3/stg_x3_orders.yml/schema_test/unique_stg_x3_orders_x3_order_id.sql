
    
    



select count(*) as validation_errors
from (

    select
        x3_order_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_x3_orders`
    where x3_order_id is not null
    group by x3_order_id
    having count(*) > 1

) validation_errors


