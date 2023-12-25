
    
    



select count(*) as validation_errors
from (

    select
        bundle_id

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`source_bundle_payments`
    where bundle_id is not null
    group by bundle_id
    having count(*) > 1

) validation_errors


