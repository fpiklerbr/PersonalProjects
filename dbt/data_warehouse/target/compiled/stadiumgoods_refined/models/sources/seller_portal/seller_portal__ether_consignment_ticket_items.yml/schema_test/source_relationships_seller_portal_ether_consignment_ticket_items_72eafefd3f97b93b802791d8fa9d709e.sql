
    
    




select count(*) as validation_errors
from (
    select seller_portal_consignment_shipment_box_id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`seller_portal_consignment_ticket_items`
) as child
left join (
    select id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`seller_portal_consignment_shipment_boxes`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null


