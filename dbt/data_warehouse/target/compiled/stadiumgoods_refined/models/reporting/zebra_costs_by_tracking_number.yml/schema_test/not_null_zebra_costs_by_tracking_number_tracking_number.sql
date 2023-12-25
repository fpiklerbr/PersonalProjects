
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`zebra_costs_by_tracking_number`
where tracking_number is null


