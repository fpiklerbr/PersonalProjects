
    
    




with all_values as (

    select distinct
        cancel_reason as value_field

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_order_items`

),

validation_errors as (

    select
        value_field

    from all_values
    where value_field not in (
        '0','1','2','3','4','5','6','7','8','9','10','11','12','13','14','15','16','17'
    )
)

select count(*) as validation_errors
from validation_errors


