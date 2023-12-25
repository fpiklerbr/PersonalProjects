
    
    




with all_values as (

    select distinct
        tax_source as value_field

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_orders`

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        'x3','ether','magento'
    )
)

select count(*) as validation_errors
from validation_errors


