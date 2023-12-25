
    
    



select count(*) as validation_errors
from (

    select
        rma_creditmemo_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_rma_creditmemo`
    where rma_creditmemo_id is not null
    group by rma_creditmemo_id
    having count(*) > 1

) validation_errors


