
    
    



select count(*) as validation_errors
from (

    select
        resolution_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_resolution`
    where resolution_id is not null
    group by resolution_id
    having count(*) > 1

) validation_errors


