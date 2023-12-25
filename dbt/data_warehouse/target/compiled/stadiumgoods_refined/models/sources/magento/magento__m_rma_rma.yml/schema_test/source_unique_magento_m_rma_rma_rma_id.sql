
    
    



select count(*) as validation_errors
from (

    select
        rma_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_rma`
    where rma_id is not null
    group by rma_id
    having count(*) > 1

) validation_errors


