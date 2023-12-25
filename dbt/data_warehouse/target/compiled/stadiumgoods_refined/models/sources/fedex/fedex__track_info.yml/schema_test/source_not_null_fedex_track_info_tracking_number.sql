
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`imports`.`fedex_track_info`
where tracking_number is null


