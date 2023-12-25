
    
    



select count(*) as validation_errors
from (

    select
        user_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`admin_user`
    where user_id is not null
    group by user_id
    having count(*) > 1

) validation_errors


