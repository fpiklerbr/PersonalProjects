
    
    



select count(*) as validation_errors
from (

    select
        notification_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`sumoheavy_stocknotifications`
    where notification_id is not null
    group by notification_id
    having count(*) > 1

) validation_errors


