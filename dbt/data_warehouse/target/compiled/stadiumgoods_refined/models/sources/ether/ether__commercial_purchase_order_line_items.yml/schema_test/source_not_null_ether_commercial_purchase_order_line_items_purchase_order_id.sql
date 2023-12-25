
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_purchase_order_line_items`
where purchase_order_id is null


