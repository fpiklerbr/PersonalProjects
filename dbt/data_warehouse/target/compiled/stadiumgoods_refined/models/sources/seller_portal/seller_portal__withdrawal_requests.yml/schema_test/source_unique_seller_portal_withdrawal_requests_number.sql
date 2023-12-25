
    
    



select count(*) as validation_errors
from (

    select
        number

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`withdrawal_requests`
    where number is not null
    group by number
    having count(*) > 1

) validation_errors


