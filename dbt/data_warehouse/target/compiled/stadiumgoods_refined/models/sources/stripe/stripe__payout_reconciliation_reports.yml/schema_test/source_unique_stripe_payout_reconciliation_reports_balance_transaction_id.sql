
    
    



select count(*) as validation_errors
from (

    select
        balance_transaction_id

    from `ff-stadiumgoods-raw-live`.`imports`.`stripe_payout_reconciliation_reports`
    where balance_transaction_id is not null
    group by balance_transaction_id
    having count(*) > 1

) validation_errors


