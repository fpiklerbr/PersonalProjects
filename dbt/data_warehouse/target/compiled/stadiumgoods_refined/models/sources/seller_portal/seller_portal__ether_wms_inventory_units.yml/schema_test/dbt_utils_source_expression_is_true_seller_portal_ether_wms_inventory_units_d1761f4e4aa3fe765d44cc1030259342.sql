




with meet_condition as (

    select * from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_inventory_units` where payout_currency IS NOT NULL

),
validation_errors as (

    select
        *
    from meet_condition
    
    where not(payout_currency = price_currency)

)

select count(*)
from validation_errors

