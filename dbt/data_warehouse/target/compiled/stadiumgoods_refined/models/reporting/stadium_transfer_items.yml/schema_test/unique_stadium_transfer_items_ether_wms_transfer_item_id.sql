
    
    



select count(*) as validation_errors
from (

    select
        ether_wms_transfer_item_id

    from `ff-stadiumgoods-refined-dev`.`fernandop_dbt_reporting`.`stadium_transfer_items`
    where ether_wms_transfer_item_id is not null
    group by ether_wms_transfer_item_id
    having count(*) > 1

) validation_errors


