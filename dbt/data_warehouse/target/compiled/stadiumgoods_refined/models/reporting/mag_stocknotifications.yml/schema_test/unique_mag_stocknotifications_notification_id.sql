
    
    



select count(*) as validation_errors
from (

    select
        notification_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`mag_stocknotifications`
    where notification_id is not null
    group by notification_id
    having count(*) > 1

) validation_errors


