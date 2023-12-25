
    
    



select count(*) as validation_errors
from (

    select
        id

    from `ff-stadiumgoods-raw-live`.`dss_portal_production`.`users`
    where id is not null
    group by id
    having count(*) > 1

) validation_errors


