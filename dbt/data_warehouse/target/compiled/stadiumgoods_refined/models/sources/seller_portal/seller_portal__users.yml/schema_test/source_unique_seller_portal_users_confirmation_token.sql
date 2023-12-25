
    
    



select count(*) as validation_errors
from (

    select
        confirmation_token

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`users`
    where confirmation_token is not null
    group by confirmation_token
    having count(*) > 1

) validation_errors


