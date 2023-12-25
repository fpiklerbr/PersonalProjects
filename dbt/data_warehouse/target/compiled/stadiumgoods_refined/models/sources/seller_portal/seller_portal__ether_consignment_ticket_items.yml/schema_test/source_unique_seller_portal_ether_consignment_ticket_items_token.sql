
    
    



select count(*) as validation_errors
from (

    select
        token

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`seller_portal_consignment_ticket_items`
    where token is not null
    group by token
    having count(*) > 1

) validation_errors


