
    
    




with all_values as (

    select distinct
        type as value_field

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_ledger_accounts`

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        'Ether::Ledger::Account::Asset','Ether::Ledger::Account::Expense','Ether::Ledger::Account::Revenue'
    )
)

select count(*) as validation_errors
from validation_errors


