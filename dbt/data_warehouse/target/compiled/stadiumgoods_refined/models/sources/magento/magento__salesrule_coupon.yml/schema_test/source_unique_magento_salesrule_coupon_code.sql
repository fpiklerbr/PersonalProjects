
    
    



select count(*) as validation_errors
from (

    select
        code

    from `ff-stadiumgoods-raw-live`.`stadium_production`.`salesrule_coupon`
    where code is not null
    group by code
    having count(*) > 1

) validation_errors


