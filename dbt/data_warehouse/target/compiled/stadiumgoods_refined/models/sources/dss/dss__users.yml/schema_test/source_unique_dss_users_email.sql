
    
    



select count(*) as validation_errors
from (

    select
        email

    from `ff-stadiumgoods-raw-live`.`dss_portal_production`.`users`
    where email is not null
    group by email
    having count(*) > 1

) validation_errors


