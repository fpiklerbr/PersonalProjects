
    
    



select count(*) as validation_errors
from (

    select
        id

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_pricing_variant_auto_approve_ranges`
    where id is not null
    group by id
    having count(*) > 1

) validation_errors


