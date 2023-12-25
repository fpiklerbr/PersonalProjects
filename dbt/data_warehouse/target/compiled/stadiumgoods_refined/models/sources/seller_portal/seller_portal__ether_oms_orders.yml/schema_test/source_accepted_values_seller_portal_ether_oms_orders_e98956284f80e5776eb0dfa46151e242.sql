
    
    




with all_values as (

    select distinct
        hold_status as value_field

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_orders`

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        '1','2'
    )
)

select count(*) as validation_errors
from validation_errors


