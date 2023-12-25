
    
    



select count(*) as validation_errors
from (

    select
        ship_reference

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`tmall_b2c_costs_by_ship_reference`
    where ship_reference is not null
    group by ship_reference
    having count(*) > 1

) validation_errors


