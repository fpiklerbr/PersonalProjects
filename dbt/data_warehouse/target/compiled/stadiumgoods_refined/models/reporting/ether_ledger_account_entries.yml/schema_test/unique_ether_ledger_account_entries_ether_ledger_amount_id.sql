
    
    



select count(*) as validation_errors
from (

    select
        ether_ledger_amount_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`ether_ledger_account_entries`
    where ether_ledger_amount_id is not null
    group by ether_ledger_amount_id
    having count(*) > 1

) validation_errors


