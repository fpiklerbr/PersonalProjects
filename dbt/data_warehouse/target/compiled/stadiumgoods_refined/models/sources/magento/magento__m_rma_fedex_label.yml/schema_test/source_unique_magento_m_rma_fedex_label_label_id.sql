
    
    



select count(*) as validation_errors
from (

    select
        label_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`m_rma_fedex_label`
    where label_id is not null
    group by label_id
    having count(*) > 1

) validation_errors


