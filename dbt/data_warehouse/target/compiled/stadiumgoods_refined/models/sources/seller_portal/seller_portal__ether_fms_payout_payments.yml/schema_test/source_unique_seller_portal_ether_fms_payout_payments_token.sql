
    
    



select count(*) as validation_errors
from (

    select
        token

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_fms_payout_payments`
    where token is not null
    group by token
    having count(*) > 1

) validation_errors


