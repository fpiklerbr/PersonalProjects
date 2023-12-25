
    
    



select count(*) as validation_errors
from (

    select
        ether_ledger_account_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_ether_ledger_tenant_accounts`
    where ether_ledger_account_id is not null
    group by ether_ledger_account_id
    having count(*) > 1

) validation_errors


