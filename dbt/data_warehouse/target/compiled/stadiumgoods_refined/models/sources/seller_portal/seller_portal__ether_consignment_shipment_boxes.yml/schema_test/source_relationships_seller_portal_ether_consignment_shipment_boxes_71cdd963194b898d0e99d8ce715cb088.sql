
    
    




select count(*) as validation_errors
from (
    select shipment_id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`seller_portal_consignment_shipment_boxes`
) as child
left join (
    select id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`shipments`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null


