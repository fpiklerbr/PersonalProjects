
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`source_bundle_payments`
where stripe_payment_intent_id is null


