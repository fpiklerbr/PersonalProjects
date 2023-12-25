
    
    




with all_values as (

    select distinct
        fulfillment_status as value_field

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_order_items`

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        'pending','missing','picked','sent_to_3pl','packed','cancelled'
    )
)

select count(*) as validation_errors
from validation_errors


