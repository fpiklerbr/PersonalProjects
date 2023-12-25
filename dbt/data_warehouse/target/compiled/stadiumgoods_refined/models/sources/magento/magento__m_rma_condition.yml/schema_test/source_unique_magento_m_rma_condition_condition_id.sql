
    
    



select count(*) as validation_errors
from (

    select
        condition_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_condition`
    where condition_id is not null
    group by condition_id
    having count(*) > 1

) validation_errors


