
    
    



select count(*) as validation_errors
from (

    select
        tracking_number

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`fedex_costs_by_tracking_number`
    where tracking_number is not null
    group by tracking_number
    having count(*) > 1

) validation_errors


