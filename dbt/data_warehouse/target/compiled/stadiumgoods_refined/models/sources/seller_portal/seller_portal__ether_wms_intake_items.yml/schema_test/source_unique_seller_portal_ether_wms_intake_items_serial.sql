
    
    



select count(*) as validation_errors
from (

    select
        serial

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`items`
    where serial is not null
    group by serial
    having count(*) > 1

) validation_errors


