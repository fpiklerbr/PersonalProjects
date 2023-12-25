
    
    



select count(*) as validation_errors
from (

    select
        increment_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_rma`
    where increment_id is not null
    group by increment_id
    having count(*) > 1

) validation_errors


