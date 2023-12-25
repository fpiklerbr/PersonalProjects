
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_staging`.`stg_ether_ledger_tenant_accounts`
where ether_ledger_account_id is null


