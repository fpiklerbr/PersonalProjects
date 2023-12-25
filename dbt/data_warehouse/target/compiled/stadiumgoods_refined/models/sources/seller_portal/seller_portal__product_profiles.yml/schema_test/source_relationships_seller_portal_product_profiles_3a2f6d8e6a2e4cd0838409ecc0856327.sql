
    
    




select count(*) as validation_errors
from (
    select product_id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`product_profiles`
) as child
left join (
    select id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`products`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null


