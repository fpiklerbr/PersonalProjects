
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_wms_transfer_receipts`
where lock_version is null


