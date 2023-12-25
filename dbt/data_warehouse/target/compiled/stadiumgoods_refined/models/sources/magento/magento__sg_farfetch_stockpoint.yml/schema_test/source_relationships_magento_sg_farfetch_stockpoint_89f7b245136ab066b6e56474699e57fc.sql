
    
    




select count(*) as validation_errors
from (
    select farfetch_merchant_id as id from `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_stockpoint`
) as child
left join (
    select entity_id as id from `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_merchant`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null


