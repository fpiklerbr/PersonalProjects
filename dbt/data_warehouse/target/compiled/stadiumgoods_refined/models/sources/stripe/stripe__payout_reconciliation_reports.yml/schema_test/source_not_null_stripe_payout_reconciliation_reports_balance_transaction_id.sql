
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`imports`.`stripe_payout_reconciliation_reports`
where balance_transaction_id is null


