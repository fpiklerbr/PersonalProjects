
    
    



select count(*) as validation_errors
from (

    select
        purchase_order_number

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_ether_purchase_orders`
    where purchase_order_number is not null
    group by purchase_order_number
    having count(*) > 1

) validation_errors


