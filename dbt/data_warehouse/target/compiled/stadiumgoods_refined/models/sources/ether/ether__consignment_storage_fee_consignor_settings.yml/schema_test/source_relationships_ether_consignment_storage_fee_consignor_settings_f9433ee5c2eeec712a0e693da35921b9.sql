
    
    




select count(*) as validation_errors
from (
    select consignor_user_id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_consignment_storage_fee_consignor_settings`
) as child
left join (
    select id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`users`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null


