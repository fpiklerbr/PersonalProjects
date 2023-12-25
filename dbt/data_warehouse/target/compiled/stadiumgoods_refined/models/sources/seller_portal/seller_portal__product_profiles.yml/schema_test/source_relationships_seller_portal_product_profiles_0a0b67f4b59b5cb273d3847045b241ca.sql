
    
    




select count(*) as validation_errors
from (
    select ticket_id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`product_profiles`
) as child
left join (
    select id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`tickets`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null


