
    
    




with all_values as (

    select distinct
        amount_currency as value_field

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_ledger_amounts`

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        'USD'
    )
)

select count(*) as validation_errors
from validation_errors


