
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`tmall_b2c_costs_by_ship_reference`
where ship_reference is null


