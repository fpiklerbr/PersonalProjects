
    
    



select count(*) as validation_errors
from (

    select
        id

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`seller_portal_consignment_ticket_items`
    where id is not null
    group by id
    having count(*) > 1

) validation_errors


