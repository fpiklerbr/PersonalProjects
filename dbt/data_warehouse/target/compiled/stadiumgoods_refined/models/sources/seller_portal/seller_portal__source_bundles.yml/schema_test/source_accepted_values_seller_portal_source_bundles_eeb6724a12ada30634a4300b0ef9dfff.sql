
    
    




with all_values as (

    select distinct
        status as value_field

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`source_bundles`

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        'draft','cancelled','reserved','empty','sold','pending_review','rejected','fulfilled','listed'
    )
)

select count(*) as validation_errors
from validation_errors


