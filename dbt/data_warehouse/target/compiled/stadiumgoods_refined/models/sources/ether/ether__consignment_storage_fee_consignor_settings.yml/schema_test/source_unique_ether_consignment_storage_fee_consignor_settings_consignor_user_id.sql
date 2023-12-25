
    
    



select count(*) as validation_errors
from (

    select
        consignor_user_id

    from `ff-stadiumgoods-raw-live`.`stadium_goods_production`.`ether_consignment_storage_fee_consignor_settings`
    where consignor_user_id is not null
    group by consignor_user_id
    having count(*) > 1

) validation_errors


