
    
    



select count(*) as validation_errors
from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_fms_inventory_unit_commissions`
where serial_number is null


