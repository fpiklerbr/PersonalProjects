
    
    



select count(*) as validation_errors
from (

    select
        source_order_number

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_fulfillments`
    where source_order_number is not null
    group by source_order_number
    having count(*) > 1

) validation_errors


