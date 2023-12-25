
    
    



select count(*) as validation_errors
from (

    select
        id

    from `ff-stadiumgoods-raw-live`.`dss_portal_production`.`tracked_variant_changes`
    where id is not null
    group by id
    having count(*) > 1

) validation_errors


