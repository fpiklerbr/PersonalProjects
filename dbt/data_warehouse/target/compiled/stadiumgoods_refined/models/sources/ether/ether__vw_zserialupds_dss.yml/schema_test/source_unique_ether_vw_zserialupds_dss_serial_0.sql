
    
    



select count(*) as validation_errors
from (

    select
        serial_0

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`vw_zserialupds_dss`
    where serial_0 is not null
    group by serial_0
    having count(*) > 1

) validation_errors


