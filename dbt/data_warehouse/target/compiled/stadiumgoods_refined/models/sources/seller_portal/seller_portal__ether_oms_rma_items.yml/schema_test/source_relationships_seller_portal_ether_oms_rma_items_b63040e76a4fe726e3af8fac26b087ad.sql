
    
    




select count(*) as validation_errors
from (
    select rma_number as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_rma_items`
) as child
left join (
    select rma_number as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_rmas`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null


