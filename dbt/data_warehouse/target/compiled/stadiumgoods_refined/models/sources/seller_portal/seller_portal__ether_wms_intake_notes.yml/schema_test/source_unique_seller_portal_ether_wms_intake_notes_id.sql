
    
    



select count(*) as validation_errors
from (

    select
        id

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_intake_notes`
    where id is not null
    group by id
    having count(*) > 1

) validation_errors


