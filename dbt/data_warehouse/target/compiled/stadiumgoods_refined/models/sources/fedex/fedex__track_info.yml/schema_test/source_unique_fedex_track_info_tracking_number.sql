
    
    



select count(*) as validation_errors
from (

    select
        tracking_number

    from `ff-stadiumgoods-raw-live`.`imports`.`fedex_track_info`
    where tracking_number is not null
    group by tracking_number
    having count(*) > 1

) validation_errors


