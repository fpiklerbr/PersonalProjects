
    
    



select count(*) as validation_errors
from (

    select
        invitation_token

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`users`
    where invitation_token is not null
    group by invitation_token
    having count(*) > 1

) validation_errors


