
    
    



select count(*) as validation_errors
from (

    select
        uuid

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_transfers`
    where uuid is not null
    group by uuid
    having count(*) > 1

) validation_errors


