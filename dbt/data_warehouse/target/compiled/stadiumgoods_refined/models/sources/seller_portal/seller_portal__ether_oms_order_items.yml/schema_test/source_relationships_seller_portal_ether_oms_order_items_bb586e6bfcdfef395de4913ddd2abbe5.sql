
    
    




select count(*) as validation_errors
from (
    select order_id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_order_items`
) as child
left join (
    select id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_orders`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null


