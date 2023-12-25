
    
    



select count(*) as validation_errors
from (

    select
        coupon_id

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`salesrule_coupon`
    where coupon_id is not null
    group by coupon_id
    having count(*) > 1

) validation_errors


