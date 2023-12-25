
    
    




select count(*) as validation_errors
from (
    select delivery_method_id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_fulfillments`
) as child
left join (
    select id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_delivery_methods`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null


