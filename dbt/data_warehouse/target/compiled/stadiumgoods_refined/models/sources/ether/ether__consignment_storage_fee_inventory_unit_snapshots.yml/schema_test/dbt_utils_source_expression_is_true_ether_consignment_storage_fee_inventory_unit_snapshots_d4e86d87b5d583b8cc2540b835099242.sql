




with meet_condition as (

    select * from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_consignment_storage_fee_inventory_unit_snapshots` where free_eligible_price_currency IS NOT NULL

),
validation_errors as (

    select
        *
    from meet_condition
    
    where not(free_eligible_price_currency = price_currency)

)

select count(*)
from validation_errors

