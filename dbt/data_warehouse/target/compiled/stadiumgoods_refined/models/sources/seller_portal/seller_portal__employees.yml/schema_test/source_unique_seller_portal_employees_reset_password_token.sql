
    
    



select count(*) as validation_errors
from (

    select
        reset_password_token

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`employees`
    where reset_password_token is not null
    group by reset_password_token
    having count(*) > 1

) validation_errors


