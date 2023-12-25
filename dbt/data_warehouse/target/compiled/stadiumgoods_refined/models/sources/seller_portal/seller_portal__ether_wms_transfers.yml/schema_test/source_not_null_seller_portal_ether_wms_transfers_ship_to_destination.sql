
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_transfers`
where ship_to_destination is null


