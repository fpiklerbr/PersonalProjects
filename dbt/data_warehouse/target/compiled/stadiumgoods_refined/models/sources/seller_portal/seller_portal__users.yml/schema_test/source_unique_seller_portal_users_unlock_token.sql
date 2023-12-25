
    
    



select count(*) as validation_errors
from (

    select
        unlock_token

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`users`
    where unlock_token is not null
    group by unlock_token
    having count(*) > 1

) validation_errors


