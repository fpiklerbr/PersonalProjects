
    
    




select count(*) as validation_errors
from (
    select user_id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_fms_payees`
) as child
left join (
    select id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`users`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null


