
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`source_bundle_items`
where seller_commission_cents is null


