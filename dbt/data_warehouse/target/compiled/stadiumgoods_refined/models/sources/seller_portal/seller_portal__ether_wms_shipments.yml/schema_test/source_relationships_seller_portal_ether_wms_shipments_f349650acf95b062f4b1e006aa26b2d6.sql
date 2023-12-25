
    
    




select count(*) as validation_errors
from (
    select fulfillment_id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_shipments`
) as child
left join (
    select id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_fulfillments`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null


