
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_rma_creditmemo`
where rma_creditmemo_id is null


