
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`sales_channel`.`imported_order`
where channel is null


