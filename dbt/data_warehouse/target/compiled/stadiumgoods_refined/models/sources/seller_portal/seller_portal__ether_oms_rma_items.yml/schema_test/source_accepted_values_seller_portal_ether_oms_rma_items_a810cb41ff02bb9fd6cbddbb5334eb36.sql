
    
    




with all_values as (

    select distinct
        status as value_field

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_rma_items`

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        'accepted','rejected','cancelled'
    )
)

select count(*) as validation_errors
from validation_errors


