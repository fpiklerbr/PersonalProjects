
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`ether_ledger_account_entries`
where ether_ledger_amount_id is null


