
    
    



select count(*) as validation_errors
from (

    select
        rma_number

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_oms_rmas`
    where rma_number is not null
    group by rma_number
    having count(*) > 1

) validation_errors


