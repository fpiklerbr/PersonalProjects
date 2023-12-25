
    
    



select count(*) as validation_errors
from (

    select
        signature

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_ledger_events`
    where signature is not null
    group by signature
    having count(*) > 1

) validation_errors


