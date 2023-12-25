
    
    



select count(*) as validation_errors
from (

    select
        transaction_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`m_credit_transaction`
    where transaction_id is not null
    group by transaction_id
    having count(*) > 1

) validation_errors


