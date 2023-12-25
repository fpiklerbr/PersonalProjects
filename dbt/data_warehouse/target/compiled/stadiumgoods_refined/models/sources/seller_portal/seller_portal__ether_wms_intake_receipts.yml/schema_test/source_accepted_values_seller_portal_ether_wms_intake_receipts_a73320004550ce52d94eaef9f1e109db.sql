
    
    




with all_values as (

    select distinct
        delivery_method as value_field

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`receipts`

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        '0','1','2','3'
    )
)

select count(*) as validation_errors
from validation_errors


