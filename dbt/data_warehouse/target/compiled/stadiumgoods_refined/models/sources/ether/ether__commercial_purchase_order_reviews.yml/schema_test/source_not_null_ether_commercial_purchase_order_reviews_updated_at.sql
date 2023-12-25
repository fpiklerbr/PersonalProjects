
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_purchase_order_reviews`
where updated_at is null


