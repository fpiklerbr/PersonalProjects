
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_purchase_orders`
where extra_intake_allowed is null


