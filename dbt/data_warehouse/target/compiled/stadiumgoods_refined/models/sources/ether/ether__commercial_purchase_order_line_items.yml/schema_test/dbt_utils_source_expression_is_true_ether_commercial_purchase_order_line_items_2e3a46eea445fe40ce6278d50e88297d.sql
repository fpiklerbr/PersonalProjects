




with meet_condition as (

    select * from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_purchase_order_line_items` where cost_currency IS NOT NULL

),
validation_errors as (

    select
        *
    from meet_condition
    
    where not(cost_currency = price_currency)

)

select count(*)
from validation_errors

