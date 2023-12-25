
    
    



select count(*) as validation_errors
from (

    select
        vendor_number

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_commercial_vendors`
    where vendor_number is not null
    group by vendor_number
    having count(*) > 1

) validation_errors


