
    
    




select count(*) as validation_errors
from (
    select warehouse_id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_warehouse_bins`
) as child
left join (
    select id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_warehouses`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null


