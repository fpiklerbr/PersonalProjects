
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`sales_channel`.`webhook_log`
where id is null


