
    
    




with all_values as (

    select distinct
        status as value_field

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_pick_items`

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        '0','1','2','3','4','5'
    )
)

select count(*) as validation_errors
from validation_errors


