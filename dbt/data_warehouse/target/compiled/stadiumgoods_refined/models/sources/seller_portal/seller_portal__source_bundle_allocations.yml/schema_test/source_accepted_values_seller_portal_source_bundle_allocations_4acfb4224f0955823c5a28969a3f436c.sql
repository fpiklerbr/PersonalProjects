
    
    




with all_values as (

    select distinct
        status as value_field

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`source_bundle_allocations`

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        'pending','reserved','transferred','allocated'
    )
)

select count(*) as validation_errors
from validation_errors


