
    
    




with all_values as (

    select distinct
        delivery_strategy as value_field

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_fulfillments`

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        '0','1'
    )
)

select count(*) as validation_errors
from validation_errors


