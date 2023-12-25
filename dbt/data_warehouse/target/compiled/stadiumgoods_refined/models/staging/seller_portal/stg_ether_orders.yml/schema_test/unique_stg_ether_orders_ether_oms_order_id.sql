
    
    



select count(*) as validation_errors
from (

    select
        ether_oms_order_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_ether_orders`
    where ether_oms_order_id is not null
    group by ether_oms_order_id
    having count(*) > 1

) validation_errors


