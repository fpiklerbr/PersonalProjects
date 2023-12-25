
    
    



select count(*) as validation_errors
from (

    select
        order_number

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`flow_costs_by_order_number`
    where order_number is not null
    group by order_number
    having count(*) > 1

) validation_errors


