
    
    



select count(*) as validation_errors
from (

    select
        username

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`admin_user`
    where username is not null
    group by username
    having count(*) > 1

) validation_errors


