
    
    



select count(*) as validation_errors
from (

    select
        status_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_status`
    where status_id is not null
    group by status_id
    having count(*) > 1

) validation_errors


