
    
    




select count(*) as validation_errors
from (
    select review_id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_purchase_order_review_records`
) as child
left join (
    select id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_purchase_order_reviews`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null


