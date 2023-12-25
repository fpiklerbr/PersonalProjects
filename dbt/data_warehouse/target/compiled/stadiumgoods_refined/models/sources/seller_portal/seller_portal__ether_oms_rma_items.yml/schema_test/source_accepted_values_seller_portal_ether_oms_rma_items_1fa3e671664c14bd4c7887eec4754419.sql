
    
    




with all_values as (

    select distinct
        return_condition as value_field

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_rma_items`

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        'never_opened_outer_box','opened_but_did_not_try_on','tried_on_but_did_not_wear'
    )
)

select count(*) as validation_errors
from validation_errors


