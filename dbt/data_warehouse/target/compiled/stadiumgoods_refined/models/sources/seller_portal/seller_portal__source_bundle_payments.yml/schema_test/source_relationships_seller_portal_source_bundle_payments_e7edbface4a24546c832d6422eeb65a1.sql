
    
    




select count(*) as validation_errors
from (
    select stripe_payment_intent_id as id from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`source_bundle_payments`
) as child
left join (
    select payment_intent_id as id from `ff-stadiumgoods-raw-live`.`imports`.`stripe_payout_reconciliation_reports`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null


