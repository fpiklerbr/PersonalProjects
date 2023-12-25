
    
    




with all_values as (

    select distinct
        order_type as value_field

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_fulfillments`

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        'customer_order','withdrawal_order','source'
    )
)

select count(*) as validation_errors
from validation_errors


