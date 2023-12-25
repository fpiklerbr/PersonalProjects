
    
    




select count(*) as validation_errors
from (
    select purchase_order_id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_purchase_order_notes`
) as child
left join (
    select id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_purchase_orders`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null


