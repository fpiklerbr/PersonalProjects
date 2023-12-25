
    
    




with all_values as (

    select distinct
        return_reason as value_field

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_rma_items`

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        'does_not_fit','changed_mind','damaged_or_defective','wrong_item','inaccurate_website_description','other','rts_address_correction','rts_fraud'
    )
)

select count(*) as validation_errors
from validation_errors


