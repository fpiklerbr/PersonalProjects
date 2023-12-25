
    
    



select count(*) as validation_errors
from (

    select
        sales_channel_order_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`sales_channel_orders`
    where sales_channel_order_id is not null
    group by sales_channel_order_id
    having count(*) > 1

) validation_errors


