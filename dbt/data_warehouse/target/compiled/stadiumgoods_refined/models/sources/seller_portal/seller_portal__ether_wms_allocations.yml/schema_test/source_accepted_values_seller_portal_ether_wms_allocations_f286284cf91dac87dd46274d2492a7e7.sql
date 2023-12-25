
    
    




with all_values as (

    select distinct
        reallocation_reason as value_field

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_allocations`

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        '0','1','2','3','4','5','6','7','8','9','10'
    )
)

select count(*) as validation_errors
from validation_errors


