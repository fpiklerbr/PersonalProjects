
    
    




select count(*) as validation_errors
from (
    select vendor_id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_purchase_orders`
) as child
left join (
    select id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_vendors`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null


