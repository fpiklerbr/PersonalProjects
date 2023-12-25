
    
    




with all_values as (

    select distinct
        source_type as value_field

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_ledger_events`

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        'Ether::Fms::Accrual::InventoryUnitSold','Ether::Fms::ManualAdjustment','Ether::Fms::Payout::Request'
    )
)

select count(*) as validation_errors
from validation_errors


