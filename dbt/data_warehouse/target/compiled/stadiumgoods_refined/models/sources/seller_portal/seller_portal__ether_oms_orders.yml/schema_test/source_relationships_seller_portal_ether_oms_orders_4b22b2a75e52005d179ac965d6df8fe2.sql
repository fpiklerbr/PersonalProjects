
    
    




select count(*) as validation_errors
from (
    select sales_channel_id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_orders`
) as child
left join (
    select id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_sales_channels`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null


