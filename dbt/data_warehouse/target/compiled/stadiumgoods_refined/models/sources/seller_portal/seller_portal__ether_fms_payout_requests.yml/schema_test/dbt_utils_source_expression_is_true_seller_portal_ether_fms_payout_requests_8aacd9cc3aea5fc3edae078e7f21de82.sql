




with meet_condition as (

    select * from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`payment_requests` where fee_currency IS NOT NULL

),
validation_errors as (

    select
        *
    from meet_condition
    
    where not(fee_currency = total_payout_currency)

)

select count(*)
from validation_errors

