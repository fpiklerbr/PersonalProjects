
    
    



select count(*) as validation_errors
from (

    select
        email

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`employees`
    where email is not null
    group by email
    having count(*) > 1

) validation_errors


