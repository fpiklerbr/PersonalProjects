
    
    




select count(*) as validation_errors
from (
    select product_id as id from `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_product_variant`
) as child
left join (
    select entity_id as id from `ff-stadiumgoods-raw-live`.`stadium_production`.`sg_farfetch_product`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null


