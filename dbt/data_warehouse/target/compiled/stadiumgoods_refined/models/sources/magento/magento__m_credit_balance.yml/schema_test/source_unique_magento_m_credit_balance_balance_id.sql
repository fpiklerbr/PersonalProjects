
    
    



select count(*) as validation_errors
from (

    select
        balance_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`m_credit_balance`
    where balance_id is not null
    group by balance_id
    having count(*) > 1

) validation_errors


