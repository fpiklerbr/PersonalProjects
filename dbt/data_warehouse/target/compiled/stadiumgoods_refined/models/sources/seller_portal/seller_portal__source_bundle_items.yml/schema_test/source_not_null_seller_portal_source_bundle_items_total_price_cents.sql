
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`source_bundle_items`
where total_price_cents is null


