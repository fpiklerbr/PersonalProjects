
    
    




with all_values as (

    select distinct
        item_type as value_field

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_versions`

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        'Ether::Commercial::PurchaseOrder'
    )
)

select count(*) as validation_errors
from validation_errors


