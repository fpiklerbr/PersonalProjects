
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`stadium_production`.`sumoheavy_stocknotifications`
where notification_id is null


