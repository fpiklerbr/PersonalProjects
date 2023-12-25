
    
    



select count(*) as validation_errors
from (

    select
        ticket_item_token

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`items`
    where ticket_item_token is not null
    group by ticket_item_token
    having count(*) > 1

) validation_errors


