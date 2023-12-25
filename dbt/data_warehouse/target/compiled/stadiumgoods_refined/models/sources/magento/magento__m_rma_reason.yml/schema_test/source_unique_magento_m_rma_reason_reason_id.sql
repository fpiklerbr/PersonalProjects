
    
    



select count(*) as validation_errors
from (

    select
        reason_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_reason`
    where reason_id is not null
    group by reason_id
    having count(*) > 1

) validation_errors


